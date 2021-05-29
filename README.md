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
- Exercism CLI
- GCC
- CMake
- Go Lang
- Rust
- Node.js
- VS Code
- Sync Extension for VS Code
- GPG Keychain

## Other Tools

### adobe.sh

Run `./adobe.sh` to open the direct link to download the Adobe Creative Cloud installer.

### app-store.sh

Run `./app-store.sh` to loop through a list of applications and open them at the App Store. The list of applications is defined on the file `./data/app-store.txt` and are sorted by order of desired installation. I usually put the most convenient apps at the top, and leave Xcode at the bottom since it's the largest download.

The script will launch the App Store with one application at a time, and wait until it's installed to switch to another. You still have to press the install button on each application. The App Store window will be brought to front when it's time to install a new application.

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

### fonts.sh

Run `./fonts.sh` to install all fonts from a pre-defined Google Drive folder.

### gpg.sh

Run `./gpg.sh` to effortlessly setup GPG keys.

This includes:

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
