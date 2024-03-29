#!/usr/bin/env bash
# READ FROM pack.toml if possible, too lazy at the moment
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
	echo Server restarting...
	echo Press CTRL + Z to stop.
done
