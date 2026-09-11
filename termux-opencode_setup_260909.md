# Opencode in Termux — Setup Runbook (standalone, no PC needed)

Consolidated from a verified install on `arm64-v8a`, Android 16, Termux `0.118.3`,
bionic opencode `1.18.29`. Nothing here needs `adb` or a second machine.

## 0. Prerequisites (once)

* Termux installed **from F-Droid** (not Play), opened once, storage approved:

```bash
termux-setup-storage
```

* ARM64 device, ~300 MB free (final footprint ≈ 200–250 MB), internet.

## 1. Install the Android-native build (do NOT use the npm path)

The npm `opencode-termux` musl build crashes the TUI on Android (Bun trap +
dead keyboard). Install the bionic-native build instead:

```bash
pkg update -y && pkg install -y nodejs git ca-certificates curl dpkg
curl -fsSL https://raw.githubusercontent.com/bd-loser/opencode-bionic/main/install.sh | bash
opencode --version
```

Expected: installer prints `opencode_<ver>_aarch64.deb: OK`, version prints
(e.g. `1.18.29`). If you ever installed the npm build first, remove it:

```bash
npm rm -g opencode-termux opencode-ai
```

## 2. Log in + place your project

```bash
opencode auth login          # interactive provider picker; keys land in ~/.local/share/opencode/auth.json
opencode auth list           # confirm your provider shows up
cd ~/BG_record               # your project dir (symlink or real dir — TUI shows the canonical path either way)
git pull 2>&1 | tail -n 2
```

## 3. Fix terminal + touch + keyboard (one block, run in Termux)

**3a. Sane terminal type** (fixes garbage rendering):

```bash
grep -q 'TERM=xterm-256color' ~/.bashrc || echo 'export TERM=xterm-256color' >> ~/.bashrc
export TERM=xterm-256color
```

**3b. Extra-keys row with arrows + keyboard toggle** (fixes missing Tab/arrows/soft-keyboard):

```bash
mkdir -p ~/.termux
cp -f ~/.termux/termux.properties ~/.termux/termux.properties.bak 2>/dev/null
grep -v -e '^extra-keys' -e '^extra-keys-style' ~/.termux/termux.properties.bak 2>/dev/null > ~/.termux/termux.properties
cat >> ~/.termux/termux.properties <<'EOF'
extra-keys-style = arrows-all
extra-keys = [['ESC','TAB','CTRL','ALT',{key: '-', popup: '|'},'HOME','END'], \
              ['PGUP','PGDN','LEFT','DOWN','UP','RIGHT','KEYBOARD','DRAWER']]
EOF
termux-reload-settings
```

`TAB` = switch Build/Plan agent. `KEYBOARD` = pop the soft keyboard on demand.
`-` swiped up = `|`.

**3c. TUI mouse mode explicit** (taps click things; keyboard via the `KEYBOARD`
key or `Ctrl+Alt+K`):

```bash
mkdir -p ~/.config/opencode
cat > ~/.config/opencode/tui.json <<'EOF'
{
  "$schema": "https://opencode.ai/tui.json",
  "mouse": true,
  "diff_style": "stacked"
}
EOF
```

(`stacked` = single-column diffs for narrow portrait screens.)

**3d. If touches ever print `...M`/`...m` garbage** (leftover mouse-tracking
from a crashed app), reset once:

```bash
printf '\e[?1000l\e[?1002l\e[?1003l\e[?1006l\e[?1015l\e[?1016l' && stty sane && reset
```

Save it as `~/bin/fixterm` if you want it permanent.

## 4. Verify end-to-end

```bash
cd ~/BG_record && timeout 280 opencode run -m opencode/muse-spark-1.3-contributor-free "Reply with exactly: PHONE_OK"
```

Expected: `PHONE_OK`. Then launch the interactive UI:

```bash
cd ~/BG_record && opencode
```

Tap the input box; if the keyboard doesn't appear, hit the `KEYBOARD` extra key.
Quit with `/exit`.

## 5. Everyday ergonomics (phone-screen survival)

* **Landscape + smaller Termux font** = the biggest space win (more columns/rows).
* Long prompts: `export EDITOR=nano` in `~/.bashrc`, then `/editor` (or `ctrl+x e`)
  composes full-screen instead of the small box.
* Strip idle chrome in-TUI: `ctrl+x b` (sidebar), `ctrl+p` → `tips` off,
  `ctrl+p` → `scrollbar` off — one-time, persists.
* Scroll occupies vs history: drag starting in the **middle of the terminal
  text**; clipping the extra-keys `UP` key reprints the last command.

## 6. Known unfixables (verified against docs + `tui.json` schema, don't chase)

* **Corner folder path** (`/storage/emulated/0/...`): hardcoded, symlink-independent
  (OS `getcwd` resolves it), no hide/shorten option. Only relief = shorter real
  location or an upstream feature request.
* **Model/plan labels** in the typing area: rendered unconditionally, no hide option.
  Adjacent relief = cap the box via `"prompt": {"max_height": 6}` in `tui.json`,
  or try `opencode --mini` (note upstream issue `anomalyco/opencode#41259`: mini
  mislabels the agent as Build — verify agent by behavior, not the label).
* Mini-mode agent switching without Tab: `opencode --mini --agent plan`, or
  in-session `ctrl+x a` agent dialog.

## 7. Optional: single-shot helpers (if wanted back)

One-shot Q&A without the TUI (model flag baked in):

```bash
# ~/bin/ask — usage: ask "question..."
opencode run -m opencode/muse-spark-1.3-contributor-free "$@" 2>&1 | tee ~/last-answer.txt
```

Camera-to-answer (needs `pkg install termux-api`):

```bash
# ~/bin/askphoto — usage: askphoto "is this safe?"
termux-camera-photo -c back tmp-telegram/phone_$(date +%Y%m%d_%H%M%S).jpg
opencode run -m opencode/muse-spark-1.3-contributor-free \
  "Using the read tool, look at the image, then answer. User question: $*"
```

## 8. Keep Termux alive (Xiaomi/HyperOS kills background apps)

Verified 20260911 on Xiaomi 2510DRA23E, HyperOS V816, Android 16 —
`sleep`-based alarms die with the app; system Clock alarms survive.

```bash
termux-wake-lock   # hold partial wake lock (re-run after every Termux restart)
termux-notification --id termux-keepalive --ongoing \
  --title "Termux BG guard" --content "Keepalive ON — do not swipe away Termux."
```

Manual (must tap, no command can do it for you):

1. Settings → Apps → Termux → Battery → **No restrictions** (same for Termux:API).
2. Settings → Apps → Autostart (Security app) → enable **Termux** + **Termux:API**.
3. Recents → pull down Termux card → **Lock**.
4. Optional: F-Droid **Termux:Boot** → auto-restart guard after reboot.

Rule: BG-critical alarms always via system Clock
(`am start -a android.intent.action.SET_ALARM ...`); voice TTS needs Termux alive.
