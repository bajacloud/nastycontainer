# Use the official Ubuntu image as the base
FROM ubuntu:latest

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    nmap \
    tcpdump

# Copy the entire 'app' directory into the container
COPY app /app

# Make all scripts executable
RUN find /app -type f -name "*.sh" -exec chmod +x {} \;

# Start network capture and run scenarios
CMD /bin/bash /app/scenarios/start_network_capture.sh & \
    /bin/bash /app/run_scenarios.sh

