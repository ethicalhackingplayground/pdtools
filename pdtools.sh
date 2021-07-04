#!/bin/bash


# Install golang
function golang() {
	
	if [ "$1" != "golang" ]; then
		operator
	else


		# Download golang language
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
		operator
	fi
}

# Update/Install the project discovery tools tools
function operator() {
	GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
	GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
	GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
	GO111MODULE=on go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu
	GO111MODULE=on go get -v github.com/projectdiscovery/dnsx/cmd/dnsx
	GO111MODULE=on go get -v github.com/projectdiscovery/proxify/cmd/proxify
}

# Run functions sequentially.
golang
operator
