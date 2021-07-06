#!/bin/bash


function banner() {

echo "            _ _              _     	"
echo "           | | |            | |    	"
echo "  _ __   __| | |_ ___   ___ | |___ 	"	
echo " | '_ \ / _  | __/ _ \ / _ \| / __|	"
echo " | |_) | (_| | || (_) | (_) | \__ \	"
echo " | .__/ \__,_|\__\___/ \___/|_|___/	"
echo " | |                               	"
echo " |_|                               	"
echo " 		Updater/Installer		"
echo ""
echo ""

}

# Install golang
function main() {

	# Display the ASCII banner
	banner
	
	if [ "$1" != "go" ]; then

		# Download pd tools
		echo "----- [+] Installing pd tools"
		echo ""
		execute_tools
	else
		
		# Download golang language and install pd tools
		echo "----- [+] Installing Golang and pd tools"
		echo ""
		wget https://dl.google.com/go/go1.16.5.linux-amd64.tar.gz
		sudo tar -xvf go1.16.5.linux-amd64.tar.gz
		sudo mv go /usr/local
		export GOROOT=/usr/local/go
		export GOPATH=$HOME/go
		export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
		echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
		echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
		echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
		rm *.gz
		execute_tools
	fi
}

# Update/Install the project discovery tools tools
function execute_tools() {
	GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
	GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
	GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
	GO111MODULE=on go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu
	GO111MODULE=on go get -v github.com/projectdiscovery/dnsx/cmd/dnsx
	GO111MODULE=on go get -v github.com/projectdiscovery/proxify/cmd/proxify
	GO111MODULE=on go get -v github.com/projectdiscovery/notify/cmd/notify
}

# Run functions sequentially.
main $1
