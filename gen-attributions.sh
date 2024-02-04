#!/usr/bin/env bash
MOD_URLS=$(./get-mods.sh)
for u in $MOD_URLS; do
	echo $u
done
