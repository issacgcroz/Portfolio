#!/bin/bash

# Check if Homebrew is already installed
if [[ $(command -v brew) ]]; then
    echo "Homebrew is already installed!"
else
    # Change ownership of /usr/local/share/zsh to current user
    echo "Changing ownership of /usr/local/share/zsh to $(whoami)..."
    sudo chown -R $(whoami) /usr/local/share/zsh

    # Install Homebrew
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [[ $? -eq 0 ]]; then
        echo "Homebrew installation successful."
    else
        echo "Homebrew installation failed!"
    fi

    # Change ownership of /usr/local/share to current user
    echo "Changing ownership of /usr/local/share to $(whoami)..."
    sudo chown -R $(whoami) /usr/local/share
fi

# Link Git and Install Git
echo "Linking Git..."
brew link git
echo "Installing Git..."
brew install git

# Install Maven
echo "Installing Maven..."
brew install maven

# Create and edit .bash_profile file
echo "Creating and editing .bash_profile file..."
touch ~/.bash_profile
open -e ~/.bash_profile

# Add environment variables for Java and Maven
echo "Adding environment variables for Java and Maven..."
echo 'export JAVA_HOME='/Library/Java/JavaVirtualMachines/applejdk-17.0.1.12.1.jdk/Contents/Home'' >> ~/.bash_profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bash_profile
echo 'export M2_HOME=/Users/name/Documents/apache-maven-3.8.4' >> ~/.bash_profile
echo 'export PATH=$PATH:$M2_HOME/bin' >> ~/.bash_profile

# Move files to /Users/admin
echo "Moving files to /Users/admin..."
mv encrypted_properties_key.pub encrypted_properties_key /Users/admin/

# Set file2.txt as hidden
echo "Setting file2.txt as hidden..."
mv /Users/admin/encrypted_properties_key /Users/admin/.encrypted_properties_key

# Set file permissions for file1.txt and file2.txt
echo "Setting file permissions..."
chmod 700 /Users/admin/encrypted_properties_key.pub
chmod 400 /Users/admin/.encrypted_properties_key

# Clone Git repository and run script
echo "Cloning Git repository and running script..."
git clone https://github.pie.apple.com/crypto-services/trust-apple-corp-root-cas
cd Users/admin/Desktop/trust-apple-corp-root-cas
sudo bash trust_apple_corp_root_cas.sh

#
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install

# Install encprops using Homebrew
echo "Installing encprops using Homebrew..."
brew tap ais-engineering/homebrew https://github.pie.apple.com/ais-engineering/homebrew.git
brew install encprops

#!/bin/bash

echo "Creating SSH key for GitHub..."

# Prompt user for email address associated with GitHub account
read -p "Enter email address associated with GitHub account: " email

# Generate SSH key pair
ssh-keygen -t ed25519 -C "$email"

# Save public key to file for easy access
cat ~/.ssh/id_ed25519.pub > github_ssh_key.pub

echo "SSH key generated and saved to github_ssh_key.pub."

