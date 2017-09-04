# macupgrade
Bash script to upgrade HomeBrews, Mac OS &amp; and do a final clean with owner check of /usr/local folder, to avoid HomeBrew folder ownership errors.

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
