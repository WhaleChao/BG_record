#!/bin/bash
# Regenerate warning MP3s (edge-tts zh-TW-HsiaoChenNeural).
# TTS reads 量 as liàng (amount); for "measure" (liáng) we feed the homophone 涼.
cd "$(dirname "$0")/../audio" || exit 1
V=zh-TW-HsiaoChenNeural
gen() { edge-tts --voice $V --text "$(echo "$2" | sed 's/量/涼/g')" --write-media "$1.mp3"; }
gen bg_warn1 "請量血糖。"
gen bg_warn5 "量血糖，胰島素高峰到了，低血糖風險最高。低於九十馬上吃葡萄糖粉，開燈坐著量。"
gen bg_0630  "六點半，量血糖，記錄晨起狀態。"
gen bg_1820  "六點二十分，量血糖。八單位NPH正在上升，加上R的尾巴。低於七十，馬上吃葡萄糖粉六到九克。低於一百，先吃起司或奶粉。"
