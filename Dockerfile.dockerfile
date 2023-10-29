# Use the base image
FROM docker.io/redhat/ubi8:8.7

# Set the maintainer
LABEL maintainer="Donis Isic <donis-isic@hotmail.com>"

# Updating the package manager
RUN dnf update -y && dnf upgrade -y 

# Install Java
RUN dnf install -y java-1.8.0-openjdk-devel

# Set Nexus environment variables
ENV NEXUS_HOME /opt/nexus

# Create the Nexus directory
RUN mkdir -p $NEXUS_HOME

# Copy and unpack the downloaded Nexus bundle
COPY nexus-3.37.3-02-unix.tar.gz $NEXUS_HOME/
RUN tar -xzvf $NEXUS_HOME/nexus-3.37.3-02-unix.tar.gz -C $NEXUS_HOME/ --strip-components=1
RUN rm $NEXUS_HOME/nexus-3.37.3-02-unix.tar.gz

# Expose Nexus ports
EXPOSE 8081

# Set the working directory
WORKDIR $NEXUS_HOME

# Define a volume for sonatype-work
VOLUME /opt/nexus/sonatype-work

# Start Nexus
CMD ["bin/nexus", "run"]
