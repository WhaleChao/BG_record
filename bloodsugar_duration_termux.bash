#!/bin/bash
termux-wake-lock                    # keep Termux alive

while true; do
	clear
	perl ./bloodsugar_duration_v3.pl
	sleep 60
done
