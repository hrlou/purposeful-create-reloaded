#!/usr/bin/env bash
[ ! -f "packwiz-installer-bootstrap.jar" ] && wget "https://github.com/packwiz/packwiz-installer-bootstrap/releases/download/v0.0.3/packwiz-installer-bootstrap.jar"
rm pack.toml && wget "https://github.com/hrlou/purposeful-create-reloaded/raw/main/pack.toml"
chmod +x *.sh
bash update.sh
