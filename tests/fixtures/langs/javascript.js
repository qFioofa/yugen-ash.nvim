// yugen-ash highlight showcase — JavaScript (.js / .mjs)
//
// Open with the theme:
//   nvim -u tests/minimal_init.lua tests/fixtures/langs/javascript.js
//   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/javascript.js
//
// Headless coverage check:
//   scripts/test-highlights.sh javascript
//
// Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

// legacy syntax: javaScriptComment
// Treesitter: @comment
// Plain comment for javaScriptComment.

/* block comment */

// legacy syntax: jsImport, jsFrom, jsExport, jsModuleKeyword
// Treesitter: @keyword.import, @keyword.export, @module
import { readFile } from "node:fs/promises";
import * as path from "node:path";
export { readFile };

// legacy syntax: jsClassDefinition, jsClassKeyword
// Treesitter: @type, @type.definition, @constructor
export class Theme {
	constructor(name, version = 1) {
		this.name = name;
		this.version = version;
		this.enabled = true;
	}

	// legacy syntax: jsFunction, jsObjectKey
	// Treesitter: @function, @property, @variable.member
	describe() {
		return `${this.name} v${this.version}`;
	}

	get label() {
		return this.name.toUpperCase();
	}

	set label(value) {
		this.name = value;
	}
}

// legacy syntax: jsArrowFunction, javaScriptFunction
// Treesitter: @function, @variable.parameter
const helper = (value, ...rest) => value + rest.reduce((sum, item) => sum + item, 0);

// legacy syntax: javaScriptConditional, javaScriptRepeat, javaScriptStatement
// Treesitter: @keyword.conditional, @keyword.repeat, @keyword
async function controlFlow(items) {
	const result = [];

	for (const item of items) {
		if (item == null) {
			continue;
		}
		if (item < 0) {
			break;
		}
		result.push(item);
	}

	let index = 0;
	while (index < result.length) {
		index++;
	}

	do {
		index--;
	} while (index > 0);

	switch (result.length) {
		case 0:
			return [];
		case 1:
		case 2:
			return result;
		default:
			return result.slice(0, 2);
	}
}

// legacy syntax: javaScriptException
// Treesitter: @keyword.exception, @keyword.return
async function readText(file) {
	try {
		const contents = await readFile(path.resolve(file), "utf8");
		return contents;
	} catch (error) {
		throw new Error(`cannot read ${file}: ${error.message}`);
	} finally {
		// cleanup
	}
}

// legacy syntax: javaScriptNull, javaScriptBoolean, javaScriptNumber, jsUndefined, jsNull
// legacy syntax: jsThis, jsSuper, jsGlobalObjects, jsGlobalNodeObjects, jsBuiltins
// Treesitter: @constant.builtin, @boolean, @number, @variable.builtin
export function values() {
	const nothing = null;
	const missing = undefined;
	const truthy = true;
	const falsy = false;
	const integer = 42;
	const float = 3.14;
	const hex = 0xff;
	const big = 9007199254740991n;
	const globals = [Math, JSON, Object, Array, Promise, console, process, globalThis];
	const builtins = [parseInt("42", 10), parseFloat("3.14"), isNaN(integer)];
	return [nothing, missing, truthy, falsy, integer, float, hex, big, globals, builtins];
}

// legacy syntax: javaScriptStringS, javaScriptStringD, jsTemplateString, jsTemplateBraces
// legacy syntax: jsObjectKey, jsObjectProp, jsDestructuringBlock
// Treesitter: @string, @string.template, @punctuation.special
export function literals(name) {
	const single = "double quoted";
	const backtick = `Hello, ${name}!`;
	const escaped = "line\nquote\"tab\t";
	const regex = /\A[a-z]+\z/gi;
	const { version, ...rest } = { version: 2, ratio: 3.14 };
	const object = { name, version, ["computed"]: true };
	const optional = object?.name ?? "unknown";
	return [single, backtick, escaped, regex, rest, object, optional];
}

// legacy syntax: javaScriptLabel, javaScriptOperator, jsTernaryIfOperator, jsOperatorKeyword
// Treesitter: @label, @operator
export function operators(input) {
	let count = 0;

outer: for (const value of input) {
		if (!value) {
			continue outer;
		}
		count += value > 0 ? value : -value;
	}

	const comparison = count === 0 || count !== 1;
	const bitwise = (count & 1) | (count ^ 2);
	return { count, comparison, bitwise, type: typeof count, chain: count instanceof Number };
}
