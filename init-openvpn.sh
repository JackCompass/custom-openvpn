#!/bin/bash

# Set the VM's public IP address
VM_IP="54.179.187.4"  # Replace with your VM's public IP

# Step 1: Generate OpenVPN configuration
echo "Generating OpenVPN configuration..."
docker-compose run --rm openvpn ovpn_genconfig -u udp://$VM_IP

# Step 2: Initialize the PKI (Public Key Infrastructure)
echo "Initializing PKI..."
docker-compose run --rm openvpn ovpn_initpki

# Step 3: Start the OpenVPN service
echo "Starting OpenVPN service..."
docker-compose up -d

# Step 4: Generate a client certificate
CLIENT_NAME="client1"  # Replace with your desired client name
echo "Generating client certificate for $CLIENT_NAME..."
docker-compose run --rm openvpn easyrsa build-client-full $CLIENT_NAME nopass

# Step 5: Export the client configuration
echo "Exporting client configuration..."
docker-compose run --rm openvpn ovpn_getclient $CLIENT_NAME > $CLIENT_NAME.ovpn

echo "Setup complete! Client configuration file: $CLIENT_NAME.ovpn"