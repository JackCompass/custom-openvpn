FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    curl \
    vim \
    net-tools

# Set up SSH
RUN mkdir /var/run/sshd
RUN echo 'root:pirateocean' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]