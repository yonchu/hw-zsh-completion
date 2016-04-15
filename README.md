# hw-zsh-completion

`hw-zsh-completion` is the zsh completion script for
[hw (highway)](https://github.com/tkengo/highway).

![hw-zsh-completion](https://raw.github.com/yonchu/hw-zsh-completion/master/img/screenshot01.png)

## Installation

Put the `_hw` file in the `fpath` directory.

```sh
$ cp _hw /path/to/fpath-directory
$ exec zsh
```

Where is the `fpath` directory ?

```sh
$ echo "$fpath" | tr " " "\n"
```
