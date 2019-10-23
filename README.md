# cra.sh: soft assertions for shell scripts

![bun](https://raw.githubusercontent.com/mcandre/cra.sh/master/crash.png)

# EXAMPLE

```console
$ crash begin

$ crash do ls
README.md lib test

$ crash do ls no_such_file
ls: no_such_file: No such file or directory

$ crash end; echo "$?"
1
```

See [tests/](tests) for more examples.

# ABOUT

cra.sh performs a sequence of customizable commands and remembers whether any commands failed. This is useful for linter suites, where it is often desirable to emit all warnings together, rather than terminating early on the first failure.

cra.sh is safe to use inside of strict execution contexts like `&&` and `set -eEuo pipefail`.

# RUNTIME REQUIREMENTS

* a POSIXy shell (sh, bash, zsh, ksh, ash, dash, posh, WLS/Git/Cygwin/MinGW/MSYS Bash, etc.)

# INSTALL + IMPORT

1. Clone the cra.sh repository.
2. `. <path-to-clone>/lib/cra.sh`

# CONTRIBUTING

See [DEVELOPMENT.md](DEVELOPMENT.md).

# LICENSE

FreeBSD

# CREDITS

* Inspired by `xargs` from [GNU findutils](https://www.gnu.org/software/findutils/)
