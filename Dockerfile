# Stage 1: Builder - Installs tools, builds dependencies
FROM ubuntu:minimal AS builder

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

# Install kubectl (Verifying with SHA256 checksum)
ARG KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
RUN curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
    curl -LO "https://dl.k8s.io/${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256" && \
    echo "$(cat kubectl.sha256) kubectl" | sha256sum --check && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/ && \
    rm -f kubectl.sha256

# Copy application scripts
COPY app /app

# Ensure scripts are executable
RUN chmod -R +x /app

# Stage 2: Minimal Final Image - Keeps only the necessary files
FROM ubuntu:minimal

# Copy necessary files from the builder stage
COPY --from=builder /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=builder /app /app

# Ensure scripts remain executable
RUN chmod -R +x /app && \
    mkdir -p /var/log

# Set the entry point to run the scenarios script
ENTRYPOINT ["/app/entrypoint.sh"]

