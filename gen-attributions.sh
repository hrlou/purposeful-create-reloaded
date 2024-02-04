#!/usr/bin/env bash
if ! command -v dasel &> /dev/null; then
	>&2 echo "Please install dasel"
	exit 1
fi

get_url() {
	local mode="$(dasel -f "${1}" -r toml download.mode 2>/dev/null)"
	local stub=$(basename ${1/.pw.toml/})
	if [[ "${mode}" == "'metadata:curseforge'" ]]; then
		URL="https://www.curseforge.com/minecraft/mc-mods/${stub}"
	else
		URL="https://modrinth.com/mod/${stub}"
	fi
}

for i in mods/*.toml; do
	NAME=$(dasel -f "${i}" -r toml name); NAME=${NAME:1:-1}
	get_url "${i}"
	echo " - [${NAME}](${URL})"
done
