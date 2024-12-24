#!/bin/bash

# Check if the required tarballs are present in the current directory
if [[ ! -f "dotnet-sdk-*.tar.gz" || ! -f "aspnetcore-runtime-*.tar.gz" ]]; then
  echo "Error: Missing required tarballs (dotnet-sdk-*.tar.gz and aspnetcore-runtime-*.tar.gz) in the current directory."
  exit 1
fi

# Check if the /usr/local/share/dotnet directory exists, and remove it if it does
if [[ -d "/usr/local/share/dotnet" ]]; then
  echo "Removing existing /usr/local/share/dotnet directory..."
  sudo rm -rf /usr/local/share/dotnet
fi

# Install required dependencies
echo "Installing required dependencies..."
sudo dnf install -y libicu

# Create the directory for dotnet installation
echo "Creating directory for .NET installation..."
sudo mkdir -p /usr/local/share/dotnet

# Extract the SDK tarball
echo "Extracting .NET SDK..."
sudo tar -zxf dotnet-sdk-*.tar.gz -C /usr/local/share/dotnet

# Extract the ASP.NET Core Runtime tarball
echo "Extracting ASP.NET Core Runtime..."
sudo tar -zxf aspnetcore-runtime-*.tar.gz -C /usr/local/share/dotnet

# Create the profile script for adding dotnet to PATH
echo "Creating /etc/profile.d/dotnet.sh to update PATH..."
echo "export PATH=\$PATH:/usr/local/share/dotnet" | sudo tee /etc/profile.d/dotnet.sh > /dev/null

# Make the script executable
sudo chmod +x /etc/profile.d/dotnet.sh

# Source the updated profile to apply the changes
echo "Sourcing /etc/profile to apply changes..."
source /etc/profile

# Verify the installation
echo "Verifying .NET installation..."
dotnet --version

echo "Installation complete."
