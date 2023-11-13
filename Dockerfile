# Ubuntu-based image as the base image
FROM ubuntu:latest

# Install essential packages and clean up
RUN apt-get update && apt-get install -y \
        curl \
        wget \
        gcc \
        tcpdump 
   
# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Add scenario scripts
COPY app /app

# Create a log directory
RUN mkdir -p /var/log

# Set the entry point to run the scenarios script
ENTRYPOINT ["/bin/bash", "/app/scenarios/run_scenarios.sh"]


