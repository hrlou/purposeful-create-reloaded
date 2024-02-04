#!/usr/bin/env bash
for i in mods/*.toml; do
	mode="$(dasel -f "${i}" -r toml download.mode 2>/dev/null)"
	if [[ "$mode" == "'metadata:curseforge'" ]]; then
		i=$(basename ${i/.pw.toml/})
		echo "https://www.curseforge.com/minecraft/mc-mods/${i}"
	fi
done
