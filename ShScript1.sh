#!/bin/bash

wget https://download.sonatype.com/nexus/3/nexus-3.37.3-02-unix.tar.gz

#Install Podman
yum install podman -y

# Check if Podman is installed
if ! command -v podman &> /dev/null; then
    echo "Podman is not installed. Please install Podman and try again."
    exit 1
fi

# Build the Podman image
podman build -t nexus-server:nexus -f Dockerfile.dockerfile .

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Nexus server Podman image successfully built as 'nexus-server:nexus'."
else
    echo "Error: Failed to build the Nexus server Podman image."
fi

rm nexus-3.37.3-02-unix.tar.gz
