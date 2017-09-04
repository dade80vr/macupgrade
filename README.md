# macupgrade
Upgrade HomeBrews & Mac OS in one time!

This Bash script performs an owner check of /usr/local folder (to avoid HomeBrew folder ownership errors), run HomeBrew update/upgrade/clean, run MAS & Mac OS upgrades.

By [Davide Permunian](https://github.com/dade80vr) 

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
---

#### License

Code is under the [MIT license](LICENSE).

---

#### Want to uninstall?

```shell
rm -rf macupgrade
```
