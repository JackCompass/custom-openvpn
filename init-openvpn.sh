#!/bin/sh

# Step 1: Fetch the public IP address of the host
echo "Fetching public IP address..."
VM_IP=$(curl -s https://api.ipify.org)
if [ -z "$VM_IP" ]; then
  echo "Failed to fetch public IP address. Exiting."
  exit 1
fi
echo "Using public IP address: $VM_IP"

# Step 2: Generate OpenVPN configuration
echo "Generating OpenVPN configuration for UDP://$VM_IP..."
ovpn_genconfig -u udp://$VM_IP

# Step 3: Initialize the PKI (Public Key Infrastructure)
echo "Initializing PKI..."
ovpn_initpki

# Step 4: Generate a client certificate
CLIENT_NAME="client1"  # You can customize this if needed
echo "Generating client certificate for $CLIENT_NAME..."
easyrsa build-client-full $CLIENT_NAME nopass

# Step 5: Export the client configuration
echo "Exporting client configuration..."
ovpn_getclient $CLIENT_NAME > /etc/openvpn/$CLIENT_NAME.ovpn

echo "Setup complete! Client configuration file: /etc/openvpn/$CLIENT_NAME.ovpn"