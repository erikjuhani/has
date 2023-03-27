#!/usr/bin/env sh

set -e

help() {
  cat <<EOF
has
Checks existence of any given command, if any of the given commands do not
exists the command will exit with an error code 1. Has command takes an
arbitrary amount of commands to check.

USAGE
	has <command> [<command> ...]

OPTIONS
	-h --help	Show help

EXAMPLES
	Check for a command that does not exist
	has jq
	error: cannot find command "jq"

	Check for multiple commands where some commands do not exist
	has cat ls echo git jq
	error: cannot find command "git" "jq"

	Check for multiple commands that do exist
	has cat ls echo

EOF
  exit 2
}

err() {
  printf >&2 "error: %s\n" "$@"
  exit 1
}

print() {
  printf "%b\n" "$@"
}

has() {
  [ "$#" -eq 0 ] && help

  for arg; do
    case "${arg}" in
    -h | --help) help_has ;;
    esac

    if ! command -v "${arg}" >/dev/null; then
      missing_commands="${missing_commands}\"${arg}\" "
    fi
  done

  [ -n "${missing_commands}" ] && err "cannot find command ${missing_commands}"

  exit 0
}

has "$@"
