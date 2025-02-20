FROM kylemanna/openvpn:latest

# Copy the setup script into the container
COPY init-openvpn.sh /scripts/init-openvpn.sh
RUN chmod +x /scripts/init-openvpn.sh

# Expose the OpenVPN port
EXPOSE 1194/udp