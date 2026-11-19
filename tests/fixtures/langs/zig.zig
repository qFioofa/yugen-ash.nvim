// yugen-ash highlight showcase — Zig (.zig)
//
// Open with the theme:
//   nvim -u tests/minimal_init.lua tests/fixtures/langs/zig.zig
//   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/zig.zig
//
// Headless coverage check:
//   scripts/test-highlights.sh zig
//
// Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

// legacy syntax: zigComment
// Treesitter: @comment
// Plain comment for zigComment.

//! documentation comment for zigDocComment

const std = @import("std");

// legacy syntax: zigConstant, zigBoolean, zigNull
// Treesitter: @constant, @constant.builtin, @boolean
const NAME: []const u8 = "yugen-ash";
const VERSION: u8 = 2;
const RATIO: f32 = 3.14;
const HEX: u32 = 0xFF;
const TRUTHY: bool = true;
const FALSY: bool = false;
const NOTHING: ?u8 = null;

// legacy syntax: zigKeyword, zigStorage, zigStructure, zigPubKeyword
// Treesitter: @keyword, @type, @type.definition
pub const Theme = struct {
	name: []const u8,
	version: u8,
	enabled: bool,

	// legacy syntax: zigConstant
	pub const DEFAULT_NAME = "yugen-ash";

	// legacy syntax: zigBuiltinType
	pub fn new(name: []const u8) Theme {
		return .{ .name = name, .version = VERSION, .enabled = TRUTHY };
	}

	// legacy syntax: zigBuiltinFn, zigBuiltin
	pub fn describe(self: Theme, allocator: std.mem.Allocator) ![]u8 {
		return std.fmt.allocPrint(allocator, "{s} v{d}", .{ self.name, self.version });
	}
};

pub const Mode = enum {
	light,
	dark,
	custom,
};

pub const Value = union(enum) {
	integer: i32,
	real: f64,
	nothing: void,
};

pub const Failure = error{
	OutOfMemory,
	InvalidInput,
};

// legacy syntax: zigConditional, zigRepeat, zigExecution, zigException
// Treesitter: @keyword.conditional, @keyword.repeat, @keyword
pub fn run(allocator: std.mem.Allocator) !void {
	var theme = Theme.new(NAME);

	if (theme.enabled and VERSION > 0) {
		theme.enabled = FALSY;
	} else if (theme.name.len == 0) {
		return Failure.InvalidInput;
	} else {
		theme.enabled = TRUTHY;
	}

	var count: usize = 0;
	while (count < 3) : (count += 1) {
		if (count == 1) continue;
	}

	for (0..3) |index| {
		_ = index;
	}

	switch (Mode.light) {
		.light => {},
		.dark => {},
		.custom => {},
	}

	const description = try theme.describe(allocator);
	defer allocator.free(description);

	// legacy syntax: zigOperator
	// Treesitter: @operator, @punctuation.special
	const value = @as(f32, @floatFromInt(count)) + RATIO;
	std.debug.print("{s} {d} {d} {d} {d} {d}\n", .{ description, value, HEX, TRUTHY, FALSY, NOTHING orelse 0 });
}

// legacy syntax: zigVarDecl, zigLabel
// Treesitter: @variable, @label
pub fn main() !void {
	var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};
	defer _ = general_purpose_allocator.deinit();
	const allocator = general_purpose_allocator.allocator();

	outer: for (0..2) |index| {
		if (index == 1) {
			break :outer;
		}
	}

	// legacy syntax: zigString, zigMultilineString, zigCharacter, zigStringEscape
	// Treesitter: @string, @string.escape, @punctuation.special
	const plain = "plain string";
	const escaped = "line\nquote\"tab\t";
	const multiline =
		\\multi
		\\line
	;
	const character = 'A';

	_ = plain;
	_ = escaped;
	_ = multiline;
	_ = character;

	try run(allocator);
}
