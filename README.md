# macupgrade
Upgrade HomeBrews & Mac OS in one time!

*Version 3*

By [Davide Permunian](https://github.com/dade80vr)

## Features

Designed for Apple Mac, this Bash script performs an owner check/mod of _/usr/local_ folder (to permit to any users to run HomeBrew update/upgrade without folder ownership errors), run HomeBrew update/upgrade/cleanup, run MAS & Mac OS upgrades.

### Requirements

* [HomeBrew](https://brew.sh/index_it.html)
* [awk](http://brewformulas.org/Awk)
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
