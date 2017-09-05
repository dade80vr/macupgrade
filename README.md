# macupgrade
Upgrade HomeBrews & Mac OS in one time!

By [Davide Permunian](https://github.com/dade80vr)

*Version3.1*

## Features

Designed for Apple Mac, this Bash script performs an owner check/mod of _/usr/local_ folder (to permit to any users to run HomeBrew update/upgrade without folder ownership errors), run HomeBrew update/upgrade/cleanup, run MAS & Mac OS upgrades.

### Requirements

* [MAS](https://github.com/mas-cli/mas)
* [HomeBrew](https://brew.sh/index_it.html)

### Installation

```shell
git clone https://github.com/dade80vr/macupgrade.git
```

### Make it executable

```shell
cd macupgrade
chmod +x macupgrade.sh
```

### Run with

```shell
./macupgrade.sh
```

#### License

Code is under the [MIT license](LICENSE).

---

#### Want to uninstall?

```shell
rm -rf macupgrade
```
