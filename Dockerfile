FROM kylemanna/openvpn:latest

# Add any custom configurations or scripts if needed
# For example, you can copy a script to the container
# COPY custom-script.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/custom-script.sh

# Expose the OpenVPN port
EXPOSE 1194/udp

# Set the entrypoint (optional, as the base image already has one)
ENTRYPOINT ["ovpn_run"]