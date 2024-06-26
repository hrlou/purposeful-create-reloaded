#!/usr/bin/env bash
rm pack.toml
wget 'https://raw.githubusercontent.com/hrlou/purposeful-create-reloaded/main/pack.toml'
MC_VERSION="$(grep -Po '(?<=minecraft = ")[^"]*' pack.toml)"
NFML_VERSION="$(grep -Po '(?<=neoforge = ")[^"]*' pack.toml)"
INSTALLER="https://maven.neoforged.net/releases/net/neoforged/forge/${MC_VERSION}-${NFML_VERSION}/forge-${MC_VERSION}-${NFML_VERSION}-installer.jar"

if [ ! -d "./libraries" ]; then
	jar="./installer.jar"
	wget "${INSTALLER}" -O ${jar}
	java -jar ${jar} --installServer
	rm ${jar}
fi

if [ ! -f "./eula.txt" ]; then
	read -p "Do you agree to the Minecraft Server EULA? (y/N): " yn
	case $yn in 
		yes | y | Y ) echo "eula=true" > eula.txt;;
		* ) echo exiting...;
			exit;;
	esac
fi

while true; do
	java @user_jvm_args.txt @libraries/net/neoforged/forge/"${MC_VERSION}-${NFML_VERSION}/unix_args.txt" --nogui
	echo "== IF YOU ARE STUCK IN A LOOP DELETE './libraries' =="
	echo "Server restarting in 5 seconds..."
	echo "Press CTRL + Z to cancel."
done
