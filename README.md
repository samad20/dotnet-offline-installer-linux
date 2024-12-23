# .NET Offline Installer

This repository contains a Bash script to install the .NET SDK and ASP.NET Core Runtime offline on Linux systems. The script extracts the tarballs and sets up the necessary environment for .NET development.

## Features
- Installs the .NET SDK and ASP.NET Core Runtime from offline tarballs.
- Automatically updates the system `PATH` to include the .NET installation directory.
- Verifies the installation by checking the installed .NET version.

## Requirements
- The following tarballs must be present in the current directory:
  - `dotnet-sdk-*.tar.gz`
  - `aspnetcore-runtime-*.tar.gz`
- Linux distribution with `dnf` package manager (e.g., Fedora, RHEL).

## Usage
1. Clone this repository or download the script.
2. Place the required tarballs (`dotnet-sdk-*.tar.gz` and `aspnetcore-runtime-*.tar.gz`) in the same directory as the script.
3. Run the script:
   ```bash
   chmod +x install-dotnet.sh
   ./install-dotnet.sh
