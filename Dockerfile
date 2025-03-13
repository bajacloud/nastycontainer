# Stage 1: Builder - Installs tools and dependencies
FROM ubuntu:22.04 AS builder

# Install necessary tools and clean up
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        wget \
        nmap \
        gcc \
        tcpdump \
        netcat \
        telnet \
        file \
        dnsutils \
        iputils-ping \
    && rm -rf /var/lib/apt/lists/*  # Reduce image size by removing cached APT files

# Install kubectl (Hardcoded Version)
RUN set -e && \
    echo "Installing kubectl v1.32.3 (amd64)" && \
    wget --no-check-certificate --retry-connrefused --waitretry=5 --timeout=30 --tries=5 -O kubectl "https://dl.k8s.io/release/v1.32.3/bin/linux/amd64/kubectl" && \
    ls -lh kubectl && \
    [ -s kubectl ] || (echo "ERROR: Kubectl download failed!" && exit 1) && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/kubectl && \
    /usr/local/bin/kubectl version --client=true --output=yaml

# Copy application scripts
COPY app /app

# Ensure scripts are executable
RUN chmod -R +x /app

# Stage 2: Final Image - Includes all necessary tools
FROM ubuntu:22.04

# Install all required runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        wget \
        nmap \
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
