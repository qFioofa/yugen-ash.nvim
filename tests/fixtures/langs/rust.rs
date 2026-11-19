// yugen-ash highlight showcase — Rust (.rs)
//
// Open with the theme:
//   nvim -u tests/minimal_init.lua tests/fixtures/langs/rust.rs
//   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/rust.rs
//
// Headless coverage check:
//   scripts/test-highlights.sh rust
//
// Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

// legacy syntax: rustComment, rustCommentLine, rustCommentLineDoc
// Treesitter: @comment, @comment.documentation
// Plain comment for rustCommentLine.

/* block comment for rustCommentBlock */
/** documentation block for rustCommentBlockDoc */

// legacy syntax: rustKeyword, rustReservedKeyword, rustStorage, rustStructure
// Treesitter: @keyword, @keyword.import
use std::collections::HashMap;
use std::fmt::{self, Display};

// legacy syntax: rustAttribute, rustDerive
// Treesitter: @attribute
#[derive(Debug, Clone, PartialEq)]
#[allow(dead_code)]
pub struct Theme<'a> {
	// legacy syntax: rustIdentifier
	// Treesitter: @variable.member
	pub name: &'a str,
	pub version: u32,
	pub enabled: bool,
}

// legacy syntax: rustTrait
// Treesitter: @type, @type.definition
pub trait Renderer {
	fn render(&self) -> String;
}

// legacy syntax: rustEnum, rustEnumVariant
// Treesitter: @type, @constructor
pub enum Mode {
	Light,
	Dark,
	Custom(u8),
}

impl<'a> Theme<'a> {
	// legacy syntax: rustFuncName, rustFuncCall
	// Treesitter: @function, @constructor
	pub fn new(name: &'a str) -> Self {
		Self { name, version: 1, enabled: true }
	}

	// legacy syntax: rustSelf, rustOperator
	// Treesitter: @variable.builtin, @operator
	pub fn describe(&self) -> String {
		format!("{} v{}", self.name, self.version)
	}
}

impl<'a> Display for Theme<'a> {
	fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
		write!(formatter, "{}", self.name)
	}
}

// legacy syntax: rustType, rustModPath, rustModPathSep
// Treesitter: @type.builtin, @module, @type.definition
pub mod showcase {
	pub const DEFAULT_NAME: &str = "yugen-ash";
	pub const LIMIT: usize = 42;

	// legacy syntax: rustLifetime, rustLabel
	// Treesitter: @label, @operator
	pub fn find<'a>(items: &'a [&'a str], needle: &str) -> Option<&'a str> {
		'outer: for item in items {
			if *item == needle {
				return Some(item);
			}
			if item.is_empty() {
				continue 'outer;
			}
		}
		None
	}
}

// legacy syntax: rustConditional, rustRepeat, rustBoolean, rustConstant
// legacy syntax: rustDecNumber, rustHexNumber, rustOctNumber, rustBinNumber, rustFloat
// Treesitter: @keyword, @constant, @boolean, @number
fn main() {
	let mut map: HashMap<&str, Theme> = HashMap::new();
	let theme = Theme::new("yugen-ash");
	map.insert(theme.name, theme);

	let decimal = 42;
	let hex = 0xFF;
	let octal = 0o755;
	let binary = 0b1010;
	let ratio = 3.14;
	let truthy = true;
	let falsy = false;

	if truthy && !falsy {
		println!("decimal={decimal} hex={hex} octal={octal} binary={binary} ratio={ratio}");
	} else if decimal == 0 {
		println!("zero");
	} else {
		println!("other");
	}

	let mut count = 0;
	while count < 2 {
		count += 1;
	}

	loop {
		if count > 3 {
			break;
		}
		count += 1;
	}

	match Mode::Custom(2) {
		Mode::Light => println!("light"),
		Mode::Dark => println!("dark"),
		Mode::Custom(value) => println!("custom {value}"),
	}

	for (name, item) in &map {
		println!("{name}: {item}");
	}

	// legacy syntax: rustMacro, rustMacroVariable
	// Treesitter: @function.macro, @punctuation.special
	let formatted = format!("{:?}", theme);
	println!("{formatted}");

	// legacy syntax: rustString, rustStringRaw, rustCharacter, rustEscape, rustFormat
	// Treesitter: @string, @punctuation.special
	let plain = "plain string";
	let escaped = "line\nquote\"tab\t";
	let raw = r#"raw "string" with \n"#;
	let character = 'A';
	println!("{plain} {escaped} {raw} {character}");

	// legacy syntax: rustArrowCharacter, rustQuestionMark, rustSigil
	let parsed: Result<u32, _> = "42".parse::<u32>();
	let value = parsed.unwrap_or(0);
	println!("{value}");

	drop(map);
}
