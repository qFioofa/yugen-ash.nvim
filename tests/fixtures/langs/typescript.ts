// yugen-ash highlight showcase — TypeScript (.ts / .tsx)
//
// Open with the theme:
//   nvim -u tests/minimal_init.lua tests/fixtures/langs/typescript.ts
//   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/typescript.ts
//
// Headless coverage check:
//   scripts/test-highlights.sh typescript
//
// Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

// legacy syntax: typescriptComment
// Treesitter: @comment
// Plain comment for typescriptComment.

// legacy syntax: typescriptImport, typescriptExport, typescriptModule
// Treesitter: @keyword.import, @keyword.export, @module
import { readFile } from "node:fs/promises";
import type { Stats } from "node:fs";
export * from "./theme";
export { readFile };

// legacy syntax: typescriptType, typescriptTypeReference, typescriptInterfaceName
// Treesitter: @type, @type.definition, @type.builtin
export type ThemeName = string;
export type ThemeMap = Record<ThemeName, Theme>;
export type Result<T, E = Error> = { ok: true; value: T } | { ok: false; error: E };

export interface ThemeOptions {
	readonly name: string;
	version?: number;
	enabled: boolean;
}

// legacy syntax: typescriptDecorator
// Treesitter: @attribute, @decorator
function sealed(target: Function): void {
	void target;
}

// legacy syntax: typescriptClassKeyword, typescriptClassName, typescriptClassHeritage
// legacy syntax: typescriptStorage, typescriptModifier, typescriptAccessModifier
// Treesitter: @type, @constructor, @keyword
@sealed
export class Theme implements ThemeOptions {
	public readonly name: string;
	public version: number;
	public enabled = true;
	protected static count = 0;
	private ratio: number;

	constructor(options: ThemeOptions) {
		this.name = options.name;
		this.version = options.version ?? 1;
		this.ratio = 3.14;
		Theme.count++;
	}

	// legacy syntax: typescriptFuncKeyword, typescriptFuncName, typescriptCall
	// Treesitter: @function, @variable.parameter
	public describe(prefix: string = ">"): string {
		return `${prefix} ${this.name} v${this.version}`;
	}

	// legacy syntax: typescriptObjectLabel
	get label(): string {
		return this.name.toUpperCase();
	}

	set label(value: string) {
		(this as { name: string }).name = value;
	}
}

// legacy syntax: typescriptArrowFunc, typescriptArrowFuncArg
// Treesitter: @function, @variable.parameter
export const helper = (value: number, ...rest: number[]): number =>
	value + rest.reduce((sum, item) => sum + item, 0);

// legacy syntax: typescriptLabel
// Treesitter: @label
export function loop(values: number[]): number {
	let total = 0;

outer: for (const value of values) {
		if (value < 0) {
			continue outer;
		}
		total += value;
	}

	return total;
}

// legacy syntax: typescriptConditional, typescriptRepeat, typescriptExceptions
// legacy syntax: typescriptStatementKeyword, typescriptExceptions
// Treesitter: @keyword.conditional, @keyword.repeat, @keyword.exception
export async function controlFlow(values: number[]): Promise<number[]> {
	const result: number[] = [];

	for (const value of values) {
		if (value === 0) {
			continue;
		}
		if (value < 0) {
			break;
		}
		result.push(value);
	}

	let index = 0;
	while (index < result.length) {
		index++;
	}

	try {
		if (result.length === 0) {
			throw new Error("empty");
		}
	} catch (error) {
		if (error instanceof Error) {
			console.warn(error.message);
		}
	} finally {
		index = 0;
	}

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

// legacy syntax: typescriptBoolean, typescriptNull, typescriptNumber
// legacy syntax: typescriptGlobal, typescriptBuiltin, typescriptTemplateSB
// Treesitter: @boolean, @constant.builtin, @number, @string
export function values(name: string): unknown[] {
	const truthy: boolean = true;
	const falsy: boolean = false;
	const nothing: null = null;
	const missing: undefined = undefined;
	const integer = 42;
	const float = 3.14;
	const template = `Hello, ${name}!`;
	const globals = [Math, JSON, Object, Promise, console, globalThis];
	return [truthy, falsy, nothing, missing, integer, float, template, globals];
}

// legacy syntax: typescriptOperator, typescriptBinaryOp, typescriptEndColons, typescriptBraces
// legacy syntax: typescriptParens, typescriptCall, typescriptIdentifier
// Treesitter: @operator, @punctuation, @variable
export function operators(input: number[]): { total: number; kind: string } {
	const total: number = loop(input) ?? 0;
	const kind: string = total > 0 ? "positive" : "zero";
	const nested = { inner: { value: total } };
	return { total: nested.inner.value + (total & 1), kind };
}

// legacy syntax: typescriptObjectLabel
// Treesitter: @property, @type
export const config: ThemeOptions = {
	name: "yugen-ash",
	version: 2,
	enabled: true,
};

// legacy syntax: typescriptGlobal
export function stats(): Stats | null {
	return null;
}
