#!/usr/bin/env bash
# READ FROM pack.toml if possible, too lazy at the moment
MC_VERSION="1.20.1"
NFML_VERSION="47.1.88"
INSTALLER="https://maven.neoforged.net/releases/net/neoforged/forge/${MC_VERSION}-${NFML_VERSION}/forge-${MC_VERSION}-${NFML_VERSION}-installer.jar"

if [ ! -f "./server.jar" ]; then
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
	java @jvm_args.txt -jar server.jar --nogui
	echo Server restarting...
	echo Press CTRL + Z to stop.
done
