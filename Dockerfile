FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    net-tools \
    ttyd

# Expose port for ttyd
EXPOSE 7681

# Start ttyd
CMD ["ttyd", "bash"]