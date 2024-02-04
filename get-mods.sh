#!/usr/bin/env bash
if ! command -v dasel &> /dev/null; then
	>&2 echo "Please install dasel"
	exit 1
fi
for i in mods/*.toml; do
	name=$(basename ${i/.pw.toml/})
	mode="$(dasel -f "${i}" -r toml download.mode 2>/dev/null)"
	if [[ "$mode" == "'metadata:curseforge'" ]]; then
		echo "https://www.curseforge.com/minecraft/mc-mods/${name}"
	else
		echo "https://modrinth.com/mod/${name}"
	fi
done
