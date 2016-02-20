#!/bin/sh

echo "=== BOOTSTRAP SCRIPT ==="
sudo echo " "
read -p "Press any key to continue..."

# Working variables
USERNAME=`whoami`
BASE_PATH="$HOME/repos/$USERNAME"
RSA_KEY="id_rsa"

# Update APT
# TO DO: check if it hasn't ran decently with `ls -l /var/lib/apt/periodic/update-success-stamp`
echo "[INFO] Updating APT repositories..."
sudo apt-get update

# Upgrade OS
echo "[INFO] Upgrading operating system..."
sudo apt-get upgrade

# Intentional blank line
echo " "

# Setup Vim
# This shouldn't be inside the bootstrap script, but as `vi` has been buggy for long time, it makes sense installing `vim` right now
which vim >> /dev/null
if [ "$?" == "0" ]; then
  echo "[INFO] Vim already installed."
else
  echo "[INFO] Installing Vim..."
  sudo apt-get install -y vim
fi

# Intentional blank line
echo " "

# Setup Git
which git >> /dev/null
if [ "$?" == "0" ]; then
  echo "[INFO] Git already installed."
else
  echo "[INFO] Installing Git..."
  sudo apt-get install -y git
fi

# Configure Git
read -p "Type your name to be displayed in commits: " git_name
read -p "Type your email as registered in GitHub: " git_email
git config --global user.name "$git_name"
git config --global user.email "$git_email"
git config --global push.default simple

# Create .ssh directory
if [ ! -d "$HOME/.ssh" ]; then
  echo "Creating '$HOME/.ssh' directory..."
  mkdir $HOME/.ssh
fi

# Create SSH key pair
if [ ! -f "$HOME/.ssh/$RSA_KEY.pub" ]; then
  echo "Creating RSA key pair..."
  ssh-keygen -f $HOME/.ssh/$RSA_KEY -t rsa -N ''

  if [ "$?" == 0 ]; then
    # Print newly created public key
    echo "[INFO] Your new RSA key pair has been created successfully."
    echo "[INFO] You would want to setup your GitHub account with it now:"
  else
    echo "[FAIL] Failed to generate a new RSA key pair!"
    echo "[FAIL] Please try running 'ssh-keygen' manually."
    return
  fi
else
  echo "[INFO] You already have got a RSA key pair setup."
  echo "[INFO] You would want to make sure your GitHub account is already setup with it now:"
fi

# Let me know the SSH public key to setup GitHub
echo " "
echo $HOME/.ssh/$RSA_KEY.pub
cat $HOME/.ssh/$RSA_KEY.pub
echo " "
read -p "Press any key to continue..."

# Create repositories directory
if [ ! -d "$BASE_PATH" ]; then
  echo "[INFO] Creating '$BASE_PATH' directory..."
  mkdir -p $BASE_PATH
else
  echo "[INFO] Directory '$BASE_PATH' already exists."
fi

# Clone dotfiles repository
if [ ! -d "$BASE_PATH/dotfiles" ]; then
  echo "[INFO] Cloning dotfiles repository..."
  git clone https://github.com/fmoliveira/dotfiles.git $BASE_PATH/dotfiles
else
  echo "[INFO] Repository dotfiles is already cloned."

  echo "[INFO] Updating dotfiles repository..."
  git -c $BASE_PATH/dotfiles pull > /dev/null
  if [ "$?" == 0 ]; then
    echo "[INFO] Repository updated successfully!"
  else
    echo "[FAIL] Failed updating repository!"
    echo "[FAIL] Please check if there are unstage changes preventing the repository from being update by manually issuing a 'git pull' command in the folder '$BASE_PATH/dotfiles'."
    return
  fi
fi

# Execute dotfiles setup
echo "[INFO] Executing dotfiles setup script..."
. $BASE_PATH/dotfiles/setup.sh

