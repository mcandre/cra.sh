# BUILDTIME REQUIREMENTS

* a POSIXy shell (sh, bash, zsh, ksh, ash, dash, posh, WLS/Git/Cygwin/MinGW/MSYS Bash, etc.)
* [GNU findutils](https://www.gnu.org/software/findutils/)
* [checkbashisms](https://sourceforge.net/projects/checkbaskisms/)
* [stank](https://github.com/mcandre/stank) (e.g. `go get github.com/mcandre/stank/...`)
* [shfmt](https://github.com/mvdan/sh) (e.g. `go get github.com/mvdan/sh/cmd/shfmt`)
* [Python 3.8+](https://www.python.org/) (then `pip[3[.8]] install -r requirements-dev.txt`)
* [Ruby 2.6.5+](https://www.ruby-lang.org/en/) (then `bundle install`)

## Recommended

* [direnv](https://direnv.net/)
* [pyenv](https://github.com/pyenv/pyenv)
* [gvm](https://github.com/moovweb/gvm)

# LINT

```console
$ ./build.sh lint
```

# TEST

```console
$ ./build.sh test
```
