#!/bin/sh

# Step 1: Generate OpenVPN configuration
echo "Generating OpenVPN configuration for UDP://$VM_IP..."
ovpn_genconfig -u udp://$VM_IP

# Step 2: Initialize the PKI (Public Key Infrastructure)
echo "Initializing PKI..."
ovpn_initpki

# Step 3: Generate a client certificate
CLIENT_NAME="client1"  # You can customize this if needed
echo "Generating client certificate for $CLIENT_NAME..."
easyrsa build-client-full $CLIENT_NAME nopass

# Step 4: Export the client configuration
echo "Exporting client configuration..."
ovpn_getclient $CLIENT_NAME > /etc/openvpn/$CLIENT_NAME.ovpn

echo "Setup complete! Client configuration file: /etc/openvpn/$CLIENT_NAME.ovpn"