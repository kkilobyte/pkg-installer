# pkg-installer
Personal package installer for ChromiumOS, Fedora, and Debian-based distros
This only installs packages that are not present in Chromebrew, Debian 12, or Ultramarine 40.
I don't use Ubuntu or stock Fedora (etc.), so I will not be able to test any issues on those.

# Requirements
- chromiumOS/fedora/debian based distro - because i dont use anything else
- non-immutable distros (except chromiumOS) will not work - apt/dnf require /bin and /usr/bin to be writable
- sudo/root access - to install 
- chromebrew (on chromiumOS) - (dependencies like git and unzip are installed by chromebrew)
- ability to copy and paste

# Usage
## ChromiumOS (x86-64)
1. Make sure you have [Chromebrew](https://chromebrew.github.io/) installed.
2. Run `git clone https://github.com/kkilobyte/pkg-installer` in rather a `crosh` shell or in vt2 (`ctrl+alt+forward` or `ctrl+alt+refresh`).
3. Run `cd pkg-installer`.
4. Run `sudo bash chromiumos-installer.sh`.
5. Profit.
## Fedora (x86-64)
1. Run `git clone https://github.com/kkilobyte/pkg-installer` in a terminal.
2. Run `cd pkg-installer`.
3. Run `sudo bash fedora-installer.sh`.
4. Profit.
## Debian (x86-64)
1. Run `git clone https://github.com/kkilobyte/pkg-installer` in a terminal.
2. Run `cd pkg-installer`.
3. Run `sudo bash debian-installer.sh`.

# Packages
## ChromiumOS (x86-64)
- fastfetch (aka flashfetch)
## Fedora (x86-64)
- fastfetch (aka flashfetch)
- google-chrome-stable
## Debian (x86-64)
- fastfetch (aka flashfetch)
- google-chrome-stable

# Functionality
I have been able to test on Ultramarine 40 (KDE Edition) however I won't be testing anything else. If you encounter an issue, use Github Issues or make a Pull Request.

ChromeOS and Debian are also untested by me for now.