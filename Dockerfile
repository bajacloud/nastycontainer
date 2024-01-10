# Ubuntu-based image as the base image
FROM ubuntu:latest

# Install essential packages and clean up
RUN apt-get update && apt-get install -y \
        curl \
        nmap \
        wget \
        gcc \
        tcpdump \
        ncat \ 
        telnet \
        file \
        dnsutils \
        dnsutils \
        ruby \
        hostname \
        iputils-ping

   
# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Add scenario scripts
COPY app /app

# Make scenario scripts executable
RUN find /app/ -type f -exec chmod +x {} \;

# Create a log directory
RUN mkdir -p /var/log

RUN chmod +x /app/entrypoint.sh

# Set the entry point to run the scenarios script
ENTRYPOINT ["/app/entrypoint.sh"]
