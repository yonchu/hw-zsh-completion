# hw-zsh-completion

`hw-zsh-completion` is the zsh completion script for
[hw (highway)](https://github.com/tkengo/highway).

![hw-zsh-completion](https://raw.github.com/yonchu/hw-zsh-completion/master/img/screenshot01.png)

## Installation

Put the `_hw` file in the `fpath` directory.

```sh
$ cp _hw /usr/local/share/zsh/site-functions/
$ exec zsh
```

Where the `fpath` directory is ?

```sh
$ echo "$fpath" | tr " " "\n"
```
