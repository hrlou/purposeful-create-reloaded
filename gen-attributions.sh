#!/usr/bin/env bash
if ! command -v dasel &> /dev/null; then
	>&2 echo "Please install dasel"
	exit 1
fi
for i in mods/*.toml; do
	mode="$(dasel -f "${i}" -r toml download.mode 2>/dev/null)"
	if [[ "$mode" == "'metadata:curseforge'" ]]; then
		i=$(basename ${i/.pw.toml/})
		echo "https://www.curseforge.com/minecraft/mc-mods/${i}"
	fi
	
done
