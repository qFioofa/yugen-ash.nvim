#!/usr/bin/env bash
# yugen-ash highlight showcase — Bash (.sh)
#
# Open with the theme:
#   nvim -u tests/minimal_init.lua tests/fixtures/langs/bash.sh
#   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/bash.sh
#
# Headless coverage check:
#   scripts/test-highlights.sh bash
#
# Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

# legacy syntax: shShebang, shComment
# Treesitter: @comment, @keyword.directive
set -euo pipefail

# legacy syntax: shAlias
alias ll='ls -la'

# legacy syntax: shVariable, shVarAssign, shShellVariables, shSetList
# legacy syntax: shDerefSimple, shDerefVar, shDeref
# Treesitter: @variable, @operator, @variable.parameter
NAME="yugen-ash"
VERSION=2
RATIO=3.14
FILES=(one two three)
export PATH="${PATH}:/usr/local/bin"
readonly LIMIT=42

# legacy syntax: shFunctionKey, shFunctionName
# Treesitter: @function, @keyword.function
greet() {
	local prefix="${1:-Hello}"
	# legacy syntax: shString, shDoubleQuote, shQuote
	# Treesitter: @string
	local message="${prefix}, ${NAME}!"
	echo "${message}"
}

# legacy syntax: shCommandSub, shCmdSubRegion
# Treesitter: @function.call, @punctuation.special
current_date="$(date +%Y-%m-%d)"

# legacy syntax: shConditional, shTestOpr, shOperator
# Treesitter: @keyword.conditional, @operator
if [[ -n "${NAME}" && ${VERSION} -gt 0 ]]; then
	greet "Hi"
elif [ "${VERSION}" -eq 0 ]; then
	echo "zero"
else
	echo "other"
fi

# legacy syntax: shCase, shCaseLabel, shCaseEsac
# Treesitter: @keyword.conditional, @keyword
case "${1:-default}" in
start | run)
	echo "starting"
	;;
stop)
	echo "stopping"
	;;
*)
	echo "unknown"
	;;
esac

# legacy syntax: shRepeat, shLoop, shRange
# Treesitter: @keyword.repeat, @variable
for file in "${FILES[@]}"; do
	echo "file: ${file}"
done

for index in {1..3}; do
	echo "${index}"
done

while read -r line; do
	echo "${line}"
done < /dev/null

until false; do
	break
done

# legacy syntax: shOption
# Treesitter: @variable.parameter
list_all() {
	ls -la --color=auto "$@"
}

# legacy syntax: shRedir, shSpecial, shSpecialDQ, shEscape
# Treesitter: @punctuation.special, @string.escape
run_quiet() {
	command printf 'line\nquote"tab\t' > /tmp/showcase.txt 2>&1
	cat /tmp/showcase.txt | sort | uniq > /dev/null
}

# legacy syntax: shStatement
# Treesitter: @function.builtin, @constant
main() {
	local status=0

	if command -v curl > /dev/null; then
		curl --version > /dev/null || status=$?
	fi

	# legacy syntax: shTestOpr, shOperator
	if (( status == 0 )); then
		echo "ok: ${current_date}"
	else
		echo "failed: ${status}" >&2
	fi

	# legacy syntax: shString, shSingleQuote
	# Treesitter: @string.special.path
	echo 'single quoted' "${HOME}/projects/showcase"
}

main "$@"
