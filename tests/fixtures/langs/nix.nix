# yugen-ash highlight showcase — Nix (.nix)
#
# Open with the theme:
#   nvim -u tests/minimal_init.lua tests/fixtures/langs/nix.nix
#   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/nix.nix
#
# Headless coverage check:
#   scripts/test-highlights.sh nix
#
# Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

# legacy syntax: nixComment
# Treesitter: @comment
# Plain comment for nixComment.

/* block comment
   spanning several lines */

{ lib, stdenv, fetchurl, optionalString ? false, ... }:

# legacy syntax: nixArgumentDefinition, nixArgOperator
# Treesitter: @variable.parameter, @variable.member, @operator
let
	name = "showcase";
	version = "1.0";
	inherit (lib) optionalString;
in
{
	# legacy syntax: nixAttribute, nixAttributeDot
	# Treesitter: @property, @variable.member
	pname = name;
	inherit version;

	# legacy syntax: nixSimpleString, nixString, nixStringDelimiter
	# legacy syntax: nixInterpolation, nixInterpolationDelimiter, nixInterpolationParam
	# Treesitter: @string, @punctuation.special
	description = "yugen-ash ${name}-${version}";
	homepage = "https://example.com/${name}";

	# legacy syntax: nixPath, nixHomePath, nixSearchPath, nixURI
	# Treesitter: @string.special.path, @string.special.uri
	src = fetchurl {
		url = "https://example.com/${name}-${version}.tar.gz";
		sha256 = "0000000000000000000000000000000000000000000000000000";
	};
	sourceRoot = ./.;
	homePath = ~/projects/showcase;

	# legacy syntax: nixBoolean, nixNull, nixInteger, nixFloat
	# Treesitter: @constant.builtin, @boolean, @number
	enable = true;
	disabled = false;
	nothing = null;
	port = 8080;
	ratio = 1.5;

	# legacy syntax: nixConditional
	# Treesitter: @keyword, @operator
	buildInputs = [ stdenv.cc ] ++ lib.optionals stdenv.isLinux [ stdenv.cc.cc ];
	postInstall = if enable then ''
		echo "installed"
	'' else "";

	# legacy syntax: nixBuiltin, nixSimpleBuiltin, nixNamespacedBuiltin
	# legacy syntax: nixFunctionCall, nixInherit
	# Treesitter: @function.builtin, @function.call, @keyword.import
	meta = with lib; {
		license = licenses.mit;
		maintainers = [ ];
		platforms = platforms.unix;
	};
}
