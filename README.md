# dotfiles

Dotfiles used by me to configure new work environments for web development.

Right now this only covers a bare minimum of my setup, but it's already very handy.

## History

I used to have fancier dotfiles script, which you can find under the tag [linux-dotfiles](https://github.com/fmoliveira/dotfiles/tree/linux-dotfiles). I've decided to discard all the bells and whistles and reboot it in a very minimalistic (and probably a bit too raw) way.

## Disclaimer

It's recommended that you inspect all of the scripts and files in this repository before running anything.

While everything works well for me, there's no guarantee that it will work for you or that it will not break anything in your system.

Use at your own risk.

## Installing

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

### app-store.sh

Run `./app-store.sh` to loop through a list of applications from the App Store. This command requires having Go Lang installed.

The script will launch the App Store with one application at a time, and wait until it's installed to switch to another. You still have to press the install button on each application. :)

Applications included:

- 1Password
- Apple Developer
- Gifox
- Kindle
- Keynote
- Numbers
- Pages
- Skitch
- Snappy
- Slack
- Speedtest
- The Unarchiver
- XCode

### gpg.sh

Run `./gpg.sh` to effortlessly setup GPG keys.

This includes:

- Downloading public GitHub GPG key, importing it, and prompting to trust it
- Accepting a command line argument to the folder where the GPG keys can be found (always keep your private keys away from the repository!!!)
- Importing and prompting to trust my GPG keys
- Configuring Git to always sign my commits with my default GPG key

The folder passed as command line argument must have a file named `keys.txt` containing the filenames of the keys (public or private) and the associated email address, separated by at least one space. Example:

```
github.gpg      noreply@github.com
mykey-sec.gpg   myself@mymailz.com
```

### ssh.sh

Run `./ssh.sh` to create a new SSH key, copy the public key to the clipboard, and open GitHub's settings page where you can paste it.

## System Requirements

macOS 11+

# License

MIT
