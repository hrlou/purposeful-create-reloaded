#!/usr/bin/env sh
java -jar './packwiz-installer-bootstrap.jar' -g -s 'server' "https://raw.githubusercontent.com/hrlou/purposeful-create-reloaded/main/pack.toml"
./restart.sh
