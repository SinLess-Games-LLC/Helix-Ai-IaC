#!/bin/zsh

# Global variables
GIT_EMAIL="disdainful777@gmail.com"
GIT_NAME="Sinless777"
REQUIRED_PYTHON_VERSION="3.12.2"
PYTHON_VERSION=$(python3 --version | cut -d " " -f 2)
TMP_DIR="./tmp"

# Vitess
#            https://github.com/vitessio/vitess/releases/download/v${version}/${file}
VITESS_LINK="https://github.com/vitessio/vitess/releases/download/v19.0.1/vitess-19.0.1-3a43ab8.tar.gz"
VITESS_DIR="/usr/local/vitess"
VITESS_BIN_DIR="${VITESS_DIR}/bin"
VITESS_FILE="${TMP_DIR}/vitess-19.0.1-3a43ab8.tar.gz"

# zsh
ZSHRC_FILE="./scripts/files/.zshrc"
ZSHRC_DEST="/home/vscode/.zshrc"

# ZSH Plugins
ZSH_AUTOSUGGESTIONS_LINK="https://github.com/zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGESTIONS_DIR="/home/vscode/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
ZSH_ENVRC_LINK="https://github.com/fabiogibson/envrc-zsh-plugin.git"
ZSH_ENVRC_DIR="/home/vscode/.oh-my-zsh/custom/plugins/envrc"
ZSH_SYNTAX_HIGHLIGHTING_LINK="https://github.com/zsh-users/zsh-syntax-highlighting.git"
ZSH_SYNTAX_HIGHLIGHTING_DIR="/home/vscode/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

# SSH Keys
SSH_PRIVATE_KEY_FILE="./.ssh/id_ed25519"
SSH_PUBLIC_KEY_FILE="./.ssh/id_ed25519.pub"
SSH_DIR="/home/vscode/.ssh"
SSH_KEY="$SSH_DIR/id_ed25519"
SSH_PUBLIC_KEY="$SSH_DIR/id_ed25519.pub"

set -e

#
# FUNCTIONS
#

# Function to install a zsh plugin
install_zsh_plugin() {
    local PLUGIN_LINK="$1"
    local PLUGIN_DIR="$2"

    # Check if the plugin directory exists
    if [ ! -d "$PLUGIN_DIR" ]; then
        # Clone the repository if it doesn't exist
        echo "Cloning $PLUGIN_LINK to $PLUGIN_DIR"
        git clone --quiet "$PLUGIN_LINK" "$PLUGIN_DIR"
    else
        echo "$PLUGIN_DIR already exists. Skipping clone."
    fi
}

# Function to check if a file exists
file_exists() {
    local file="$1"
    [ -f "$file" ]
}

# Function to check if a directory exists
directory_exists() {
    local dir="$1"
    [ -d "$dir" ]
}

# Create Temp directory
mkdir -p "$TMP_DIR"
printf "\n\n"

echo "Begining Vitess installation"

#
# Vitess installation
#

# Check if the file exists
if file_exists "$VITESS_FILE"; then
    echo "Vitess file already exists. Skipping download."
else
    # Download the file
    echo "Downloading Vitess file"
    curl -L "$VITESS_LINK" -o "$VITESS_FILE" > /dev/null
fi

# Remove the existing directory if it exists
if directory_exists "$VITESS_DIR"; then
    echo "Removing existing Vitess directory"
    rm -rf "$VITESS_DIR"
fi

# Create the directory
echo "Creating directory ${VITESS_DIR}"
mkdir -p "$VITESS_DIR"

# Extract the contents of the tar.gz file
echo "Extracting contents to ${VITESS_DIR}"
tar -xf "$VITESS_FILE" -C "$VITESS_DIR" --strip-components=1 > /dev/null

echo "Vitess has been successfully installed in ${VITESS_DIR}"
printf "\n\n"

#
# ZSH installation
#

# Install ZSH plugins
echo "Installing ZSH plugins"
install_zsh_plugin "$ZSH_ENVRC_LINK" "$ZSH_ENVRC_DIR"
install_zsh_plugin "$ZSH_AUTOSUGGESTIONS_LINK" "$ZSH_AUTOSUGGESTIONS_DIR"
install_zsh_plugin "$ZSH_SYNTAX_HIGHLIGHTING_LINK" "$ZSH_SYNTAX_HIGHLIGHTING_DIR"

echo "ZSH plugins have been successfully installed"
printf "\n\n"

echo starting Zsh installation / Configuration

# Check if .zshrc exists, remove it if it does
if file_exists "$ZSHRC_DEST"; then
    echo "Removing existing .zshrc file"
    rm "$ZSHRC_DEST"
fi

# Copy .zshrc file to home directory
echo "Copying .zshrc to home directory"
cp "$ZSHRC_FILE" "$ZSHRC_DEST"

#
# SSH Keys
#

# Check if .ssh directory exists
if [ ! -d "/home/vscode/.ssh" ]; then
    echo "Creating .ssh directory"
    mkdir -p "/home/vscode/.ssh"
fi

# Check if the ssh directory exists
if [ ! -d "/home/vscode/.ssh" ]; then
    echo "Creating .ssh directory"
    mkdir -p "/home/vscode/.ssh"
else
    echo ".ssh directory already exists. Skipping creation."
    if file_exists "$SSH_KEY" && file_exists "$SSH_PUBLIC_KEY"; then
        echo "SSH keys already exist. Skipping copy."
    else
        echo "Copying SSH keys"
        cp "$SSH_PRIVATE_KEY_FILE" "$SSH_DIR"
        cp "$SSH_PUBLIC_KEY_FILE" "$SSH_DIR"
    fi
fi

# Configure permissions for the SSH keys
echo "Configuring permissions for SSH keys"
chmod 600 /home/vscode/.ssh/id_ed25519

echo "SSH keys have been successfully copied and configured"
printf "\n\n"

#
# Python installation
#

echo Configuring Python

# Test if python is the required version
if [ "$PYTHON_VERSION" = "$REQUIRED_PYTHON_VERSION" ]; then
    echo "Python is already installed"
else
    echo "Installing Python $REQUIRED_PYTHON_VERSION"
    echo python version is $PYTHON_VERSION
    echo Required python version is $REQUIRED_PYTHON_VERSION
    echo "Updating apt"
    apt-get update > /dev/null
    echo "Installing dependencies"
    apt-get install software-properties-common -y > /dev/null
    echo "Adding deadsnakes PPA"
    add-apt-repository ppa:deadsnakes/ppa -y > /dev/null
    echo updating apt
    apt-get update > /dev/null
    echo "Installing Python $REQUIRED_PYTHON_VERSION"
    apt-get install -y python$REQUIRED_PYTHON_VERSION > /dev/null
fi


# Test if pip is installed
if command -V pip &> /dev/null; then
    echo "Pip is already installed"
else
    echo "Installing Pip"
    apt-get update > /dev/null
    apt-get install -y python3-pip > /dev/null
fi

echo "Python Version: $PYTHON_VERSION"
echo "Required Python Version: $REQUIRED_PYTHON_VERSION"

if [ "$PYTHON_VERSION" = "$REQUIRED_PYTHON_VERSION" ]; then
    echo "Python has been successfully installed"
else
    echo "Python is not installed correctly. Exiting."
    exit 1
fi

echo "install requirements.txt"
python3 -m pip install -r ./requirements.txt > /dev/null

echo installing ansible roles
ansible-galaxy install --role-file ./requirements.yaml > /dev/null

echo "python3 and requirements have been successfully installed"
printf "\n\n"

#
# Git configuration
#

echo "Configuring Git"
git config --global user.email ${GIT_EMAIL}
git config --global user.name ${GIT_NAME}

echo "Git has been successfully configured"
printf "\n\n"

#
# GPG configuration
#

echo "Configuring GPG"

# Check if gpg is installed
if command -v gpg &> /dev/null; then
    echo "GPG is already installed"
else
    echo "Installing GPG"
    apt-get update  > /dev/null
    apt-get install -y gnupg  > /dev/null
fi



cp ./.devcontainer/gpg-pubkey /home/vscode/.gnupg/pub.gpg  > /dev/null
sudo chmod 600 /home/vscode/.gnupg/pub.gpg  > /dev/null
gpg --import /home/vscode/.gnupg/pub.gpg  > /dev/null

echo "GPG has been successfully configured"
printf "\n\n"

#
# Cleanup
#

echo Cleaning up the temp directory
rm -rf "$TMP_DIR"

#
# Post script
#

# changing source
echo "Sourcing $ZSHRC_DEST"
source "$ZSHRC_DEST"
