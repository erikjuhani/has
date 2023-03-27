# has

Easily check for existence of a particular command or commands with the `has`
command. If any of the given commands do not exist the command will exit with
an error code 1. Has takes an arbitrary amount of command names to check.

```sh
has jq
error: cannot find command "jq"
```

## Installation

Easiest way to install `has` is with [shm](https://github.com/erikjuhani/shm).

To install `shm` run either one of these oneliners:

curl:

```sh
curl -sSL https://raw.githubusercontent.com/erikjuhani/shm/main/shm.sh | sh
```

wget:

```sh
wget -qO- https://raw.githubusercontent.com/erikjuhani/shm/main/shm.sh | sh
```

then run:

```sh
shm get erikjuhani/has
```

## Usage

```sh
has <command> [<command> ...]
```

### Options

```sh
-h --help Show help
```

### Examples

Check for a command that does not exist

```sh
has jq
error: cannot find command "jq"
```

Check for multiple commands where some commands do not exist

```sh
has cat ls git echo jq
error: cannot find command "git" "jq"
```

Check for multiple commands that do exist

```sh
has cat ls echo
```
