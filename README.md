# macupgrade ![release version](https://img.shields.io/github/release/dade80vr/macupgrade.svg)
Upgrade HomeBrews, Mac OS and other stuff in one time!

![Image of macupgrade at work](macupgrade.png)

## Features

Designed for Apple Mac, this Bash script performs an owner check/mod of _/usr/local_ folder (to permit to any users to run HomeBrew update/upgrade without folder ownership errors), run HomeBrew + Cask update/upgrade/cleanup, run Atom upgrade, NPM update and finally run MAS & Mac OS upgrades.

### MAIN requirements

* [awk](https://developer.apple.com/library/content/documentation/OpenSource/Conceptual/ShellScripting/Howawk-ward/Howawk-ward.html)

### SUB requirements (not needed but useful)

* [HomeBrew](https://brew.sh/index_it.html)
* [Atom](https://atom.io)
* [npm](https://www.npmjs.com)
* [MAS](https://github.com/mas-cli/mas)

### Installation

```shell
git clone https://github.com/dade80vr/macupgrade.git
```

### Make it executable

```shell
cd macupgrade
chmod +x macupgrade.sh
```

### Usage

`./macupgrade.sh` (with no arguments) run in quiet mode (default)

`--help` show help

`-v` verbose mode, show output from any script (default hide)

`-m` monochrome output

### `March 2018 update:` Warnings or errors messages regarding MAS 

If you got warnings or errors @ steps 2-3 (HomeBrew MAS upgrade) regarding installation of Xcode 9.0 please see this:
https://github.com/mas-cli/mas/issues/138

### License

Code is under the [MIT license](LICENSE).

---

### Want to uninstall?

```shell
rm -rf macupgrade
```
