# BUILDTIME REQUIREMENTS

* [GNU bash](https://www.gnu.org/software/bash/)
* [GNU findutils](https://www.gnu.org/software/findutils/)
* [checkbashisms](https://sourceforge.net/projects/checkbaskisms/)
* [ShellCheck](https://hackage.haskell.org/package/ShellCheck)
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
