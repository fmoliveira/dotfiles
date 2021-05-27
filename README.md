# dotfiles

Dotfiles used by me to configure new work environments for web development.

Right now this only covers a bare minimum of my setup, but it's already very handy.

## History

I used to have fancier dotfiles script, which you can find under the tag [linux-dotfiles](https://github.com/fmoliveira/dotfiles/tree/linux-dotfiles). I've decided to discard all the bells and whistles and reboot it in a very minimalistic (and probably a bit too raw) way.

## Disclaimer

It's recommended that you inspect all of the scripts and files in this repository before running anything.

While everything works well for me, there's no guarantee that it will work for you or that it will not break anything in your system.

Use at your own risk.

## Execution

Clone this repository and run `./setup.sh` to install everything.

The setup includes:

- Homebrew
- Git
- GitHub CLI
- Go Lang
- Rust
- Node.js
- VS Code
- Sync Extension for VS Code
- GPG Keychain

## Other Tools

### gpg.sh

Run `./gpg.sh` to effortlessly setup GPG keys.

This includes;

- Downloading public GitHub GPG key, importing it, and prompting to trust it
- Accepting a command line argument to the folder where my own GPG keys can be found (always keep your private keys away from the repository!!!)
- Importing and prompting to trust my GPG keys
- Configuring Git to always sign my commits with my default GPG key

### ssh.sh

Run `./ssh.sh` to create a new SSH key, copy the public key to the clipboard, and open GitHub's settings page where you can paste it.

## System Requirements

macOS 11+

# License

MIT
