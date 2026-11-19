# yugen-ash highlight showcase — Python (.py)
#
# Open with the theme:
#   nvim -u tests/minimal_init.lua tests/fixtures/langs/python.py
#   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/python.py
#
# Headless coverage check:
#   scripts/test-highlights.sh python
#
# Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

# legacy syntax: pythonComment, pythonDocstring
# Treesitter: @comment, @string.documentation
"""Module docstring for pythonDocstring."""

# legacy syntax: pythonImport, pythonInclude
# Treesitter: @keyword.import, @module
import json
import os.path
from dataclasses import dataclass
from typing import Any, Iterable, Iterator

# legacy syntax: pythonFunction, pythonDefName
# Treesitter: @function, @keyword.function
def helper(value: int, *args: Any, **kwargs: Any) -> int:
	# legacy syntax: pythonStatement, pythonReturn
	summed = value + sum(args)
	return summed


# legacy syntax: pythonDecorator, pythonDecoratorName
# Treesitter: @attribute, @function
@dataclass(frozen=True)
class Theme:
	"""Class docstring for pythonDocstring."""

	# legacy syntax: pythonClassName, pythonClass
	# Treesitter: @type, @type.definition
	name: str
	version: int = 1

	# legacy syntax: pythonSelf, pythonAttribute, pythonDot
	# Treesitter: @variable.builtin, @variable.member, @property
	def describe(self) -> str:
		return f"{self.name} v{self.version}"

	@property
	def label(self) -> str:
		return self.name.upper()


# legacy syntax: pythonConditional, pythonRepeat, pythonException, pythonOperator
# Treesitter: @keyword.conditional, @keyword.repeat, @keyword.return
def control_flow(items: Iterable[int]) -> list[int]:
	result: list[int] = []

	for item in items:
		if item is None:
			continue
		if item < 0:
			break
		result.append(item)
	else:
		result.append(0)

	while len(result) > 3:
		result.pop()

	try:
		value = 1 / (len(result) or 1)
	except ZeroDivisionError as error:
		raise ValueError("bad input") from error
	finally:
		result.sort()

	match len(result):
		case 0:
			return []
		case 1 | 2:
			return result
		case _:
			return result[:2]

	# legacy syntax: pythonConstant, pythonBoolean, pythonNone, pythonNumber
	# Treesitter: @constant.builtin, @boolean, @number
	truthy = True
	falsy = False
	nothing = None
	integer = 42
	hex_number = 0xFF
	float_number = 3.14
	complex_number = 1 + 2j


# legacy syntax: pythonString, pythonRawString, pythonBytes, pythonFString
# legacy syntax: pythonStrFormat, pythonStrFormatting, pythonStrInterpRegion, pythonEscape
# Treesitter: @string, @punctuation.special
def literals(name: str) -> list[str]:
	plain = "plain string"
	escaped = "line\nquote\"tab\tunicode\u00e9"
	f_string = f"Hello, {name!r}: {len(name):03d}"
	raw = r"raw \n stays literal"
	bytes_value = b"bytes\x00"
	multiline = """first
second"""
	formatted = "{} {}".format(name, len(name))
	return [plain, escaped, f_string, raw, multiline, formatted]


# legacy syntax: pythonBuiltin, pythonBuiltinObj, pythonBuiltinFunc, pythonBuiltinType
# Treesitter: @function.builtin, @type.builtin, @constant.builtin
def builtins(values: list[int]) -> dict[str, int]:
	types = [str, int, float, bool, list, dict, object]
	result = {
		"len": len(values),
		"max": max(values or [0]),
		"min": min(values or [0]),
		"sum": sum(values),
	}
	_ = types
	return result


# Treesitter: @constructor, @function.call, @variable.parameter
def calls() -> None:
	theme = Theme("yugen-ash", version=2)
	print(theme.describe())
	print(theme.label)
	print(literals(theme.name))
	print(builtins([1, 2, 3]))
	print(helper(1, 2, 3))


# Treesitter: @variable, @variable.member, @property, @operator
def comprehensions(values: list[int]) -> Iterator[int]:
	scaled = [value * 2 for value in values if value > 0]
	mapping = {str(value): value for value in values}
	generator = (value for value in values)
	lambda_value = lambda item: item + 1

	_ = mapping
	_ = lambda_value
	yield from generator
	yield from scaled


# legacy syntax: pythonStatement, pythonConditional
def main() -> None:
	calls()
	print(list(comprehensions([1, 2, 3])))
	print(control_flow([1, 2]))


if __name__ == "__main__":
	main()
