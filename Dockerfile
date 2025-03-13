# Stage 1: Builder - Installs tools and dependencies
FROM ubuntu:22.04 AS builder

# Install necessary tools and clean up
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        nmap \
        wget \
        gcc \
        tcpdump \
        netcat \
        telnet \
        file \
        dnsutils \
        iputils-ping \
    && rm -rf /var/lib/apt/lists/*  # Reduce image size by removing cached APT files

# Install kubectl (Fixing variable issue)
RUN set -e && \
    export KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt) && \
    curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Copy application scripts
COPY app /app

# Ensure scripts are executable
RUN chmod -R +x /app

# Stage 2: Final Image - Includes all necessary tools
FROM ubuntu:22.04

# Install all required runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        nmap \
        wget \
        gcc \
        tcpdump \
        netcat \
        telnet \
        file \
        dnsutils \
        iputils-ping \
    && rm -rf /var/lib/apt/lists/*  # Reduce image size by removing cached APT files

# Copy necessary files from the builder stage
COPY --from=builder /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=builder /app /app

# Ensure scripts remain executable
RUN chmod -R +x /app && \
    mkdir -p /var/log

# Set the entry point to run the scenarios script
ENTRYPOINT ["/app/entrypoint.sh"]
