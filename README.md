# TRUE NORTH engineering
# Donis Isic

## Project description

This project describes a task of building a container for the Nexus server using Podman runtime.
Binaries for the Nexus server were provided in the project task.
The container is built using the UBI 8.7 base image and is designed to facilitate the deployment and usage of the Nexus server within a containerized environment.

## Features

- Uses the UBI 8.7 base image for a lightweight and secure container.
- Includes the Java 1.8.0 OpenJDK for running the Nexus server.
- Defines the `NEXUS_HOME` environment variable set to `/opt/nexus`.
- Copies and unpacks the downloaded Nexus bundle into the `NEXUS_HOME` folder.
- Defines exposed ports for accessing the Nexus server.
- Sets the default working directory to `NEXUS_HOME`.
- Defines a volume mount point for the `/opt/nexus/sonatype-work` container directory.
- Configures the command for starting the Nexus server.
- Follows best practices and security considerations for containerization.

## Usage instructions

It is required to have the provided Dockerfile and scripts in the same directory.
If the user is not root, run the scripts using sudo command

## Building the Container Image

To build the Nexus container image, run the provided "ShScript1.sh" script.
The script downloads Nexus binaries, then uses the provided Dockerfile and builds the container image for the Nexus server.
After the process binaries are deleted because they are not needed from that point on.

## Running the container

To start the Nexus server in a container, run the "ShScript2.sh" script.
This script starts the container, names it 'nexus', runs it in the background, mounts the container folder /opt/nexus/sonatype-work to the host filesystem under /tn_devops/nexus, binds host port 18081 to the exposed port in the container, and sets it to start automatically with the operating system.

## Test

- Access the Nexus server by opening a web browser and navigating to http://localhost:18081.
- Container autostart can be tested by rebooting the host OS.
