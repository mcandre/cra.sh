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

# ABOUT

crash performs a sequence of customizable commands and remembers whether any commands failed. This is useful for linter suites, where it is often desirable to emit all warnings together, rather than terminating early on the first failure.

# RUNTIME REQUIREMENTS

* a POSIXy shell (bash, zsh, ksh, dash, posh, etc.)

# INSTALL + IMPORT

1. Clone crash.
2. `. <path-to-clone>/lib/cra.sh`
