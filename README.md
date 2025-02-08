> ⚠️ ⚠️ OBSOLETE SETUP. ⚠️ ⚠️
>
> 🟢 You can find my [current dotfiles setup on the main branch](https://github.com/fmoliveira/dotfiles).

# dotfiles

Installing all the apps I need in a new system is very boring and troublesome.

I use these scripts to configure my new work environments for web development. This simplifies my life a LOT when setting up new systems from scratch, and can also be used continuously for update management.

Right now this covers a significant part of my setup and it's really super handy.

> dotfiles are the last thing you'll actually find in this repository, lol.
>
> nowadays it's a lot easier to sync editor settings using gists, and that's where my dotfiles are right now.
> I still want to improve that set up, so the dotfiles _might_ be added back to the repository at some point.

## History

I used to have fancier dotfiles script, which you can find archived under the tag [v1-debian-jessie](https://github.com/fmoliveira/dotfiles/tree/v1-debian-jessie). I've decided to discard all the bells and whistles and reboot it in a very minimalistic (and probably a bit too raw) way.

While the former version had my full Sublime Text configuration versioned with the repository, this setup does not and instead I used to use the VS Code sync with my settings hosted on this gist: <https://gist.github.com/fmoliveira/8bbbbecc8cbb35a0da3e66b52522318e>. Some of my former research on VS Code extensions is also available at <https://gist.github.com/fmoliveira/73a9a6fd9e1d439c741cc49724bd4bcc> as well as part of my old Windows Terminal settings at <https://gist.github.com/fmoliveira/f6ba8c6158632a4f5e5ed20848482cb7>

## Disclaimer

It's recommended that you inspect all of the scripts and files in this repository before running anything.

While everything works well for me, there's no guarantee that it will work for you or that it will not break anything in your system.

The scripts are still not fail safe. Errors are not handled. In time, I want to make the whole code safer for general public usage. Handling all that in bash is a lot of work that I'm not committed to do at the moment.

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

### download.sh

Run `./download.sh` to download and install applications from their direct website.

Applications included:

- Google Chrome
- Google Drive
- Discord
- Obsidian
- Notion
- Spotify
- Zoom

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
