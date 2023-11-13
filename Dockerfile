# Ubuntu-based image as the base image
FROM ubuntu:latest

# Install essential packages and clean up
RUN apt-get update && apt-get install -y \
        curl \
        wget \
        gcc \
        tcpdump && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Add scenario scripts
COPY scenarios /scenarios

# Create a log directory
RUN mkdir -p /var/log

# Set the entry point to run the scenarios script
ENTRYPOINT ["/bin/bash", "/scenarios/run_scenarios.sh"]


