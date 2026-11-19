#!/usr/bin/env ruby
# frozen_string_literal: true

# yugen-ash highlight showcase — Ruby (.rb)
#
# Purpose: exercise every reachable group from groups/langs/ruby.lua plus the
# common base captures (comments, numbers, strings, keywords, functions, ...).
#
# Open with the theme:
#   nvim -u tests/minimal_init.lua tests/fixtures/langs/ruby.rb
#   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/ruby.rb
#
# Debug at the cursor:
#   :Inspect                 syntax / Treesitter / LSP / extmark groups
#   :InspectTree             Treesitter tree and captures
#   :YugenAshInspect         sources, priorities, winner, effective color
#   :YugenAshInspect @type.class.ruby
#   :YugenAshInspect!        include extmarks without hl_group
#   :hi rubyClass            definition / link
#   :verbose hi rubyClass    where the group was set
#   :lua =vim.inspect_pos()  raw inspection table
#   :lua =vim.treesitter.get_captures_at_pos(0, row, col)
#   :YugenAshCompile         rebuild the cache after editing theme sources
#
# Headless coverage check:
#   scripts/test-highlights.sh ruby
#
# Legacy operator groups need:
#   :let g:ruby_operators = 1 | let g:ruby_pseudo_operators = 1 | edit
#
# Sections are annotated with the groups they are meant to exercise. If a
# construct does not emit the expected group, inspect it and adjust the fixture
# or document the group in tests/expected/ruby.lua.

# --- legacy syntax: rubyComment, rubyDocumentation ---
# A plain comment.
# Another comment line with `inline code` and a URL: https://example.com

=begin
Documentation block for rubyDocumentation.
=end

# --- Treesitter: @keyword.import.ruby ---
require "json"

# --- legacy syntax: rubyModule, rubyClass, rubyDefine, rubyFunction, rubyMethodName ---
module Showcase
	class Widget
		include Comparable
		extend Forwardable

		# --- legacy syntax: rubyAttribute ---
		attr_accessor :name
		attr_reader :id
		attr_writer :label

		# --- legacy syntax: rubyConstant, rubyPredefinedConstant, rubyPseudoVariable ---
		CONSTANT = 42
		PREDEFINED = __FILE__
		LINE_NUMBER = __LINE__

		# --- legacy syntax: rubyClassVariable, rubyInstanceVariable, rubyGlobalVariable ---
		@@count = 0
		@registry = {}
		$stdout.sync = true
		$custom = 1

		# --- legacy syntax: rubyKeyword (alias) ---
		alias label name

		def initialize(name, id: nil, &block)
			@name = name
			@id = id
			@@count += 1
			block&.call(self)
		end

		def <=>(other)
			name <=> other.name
		end

		# --- legacy syntax: rubyFunction, rubyMethodName, rubyBlock ---
		def greet(prefix = "Hello", punctuation: "!")
			message = "#{prefix}, #{@name}#{punctuation}"
			puts message
			self
		end

		# --- legacy syntax: rubyKeyword (yield, super), Treesitter @keyword ---
		def keyword_family
			yield if block_given?
			super
			callable = lambda { |value| value }
			callable.call(1)
		end

		# --- legacy syntax: rubyAccess ---
		private

		def secret
			:symbol
		end
	end
end

# --- legacy syntax: rubyConditional, rubyRepeat, rubyException, rubyKeyword ---
def control_flow(items)
	total = 0
	items.each do |item|
		next if item.nil?

		total += item
	end

	while total > 0
		total -= 1
		break if total == 2
	end

	unless total.zero?
		puts "nonzero"
	else
		puts "zero"
	end

	case total
	when 0 then :zero
	when 1..3 then :small
	else :large
	end

	begin
		raise ArgumentError, "boom" if total.negative?
	rescue ArgumentError => error
		warn error.message
	ensure
		total = 0
	end

	total
end

# --- legacy syntax: rubyString, rubyStringDelimiter, rubyInterpolation, rubyInterpolationDelimiter ---
# --- legacy syntax: rubyRegexp, rubyRegexpDelimiter, rubySymbol, rubyBoolean, rubyNumber, rubyOperator ---
def literals(name)
	single = 'single quoted'
	double = "double quoted"
	interpolated = "Hello, #{name}!"
	escaped = "tab:\t newline:\n quote:\""
	regexp = /\A[a-z]+\z/i
	percent = %w[one two three]
	symbol = :symbol
	quoted_symbol = :"quoted symbol"
	heredoc = <<~TEXT
		Heredoc for #{name}
	TEXT

	[single, double, interpolated, escaped, regexp, percent, symbol, quoted_symbol, heredoc]
end

# --- legacy syntax: rubyNumber, rubyBoolean, rubyOperator, rubyPseudoVariable ---
def values
	integer = 42
	float = 3.14
	hex = 0xFF
	binary = 0b1010
	octal = 0o755
	truthy = true
	falsy = false
	nothing = nil
	sum = integer + float
	comparison = integer == 42 && truthy || falsy

	[hex, binary, octal, nothing, sum, comparison]
end

# --- legacy syntax: rubyHash, rubyArrayDelimiter ---
def collections
	array = [1, 2, 3]
	hash = { name: "Widget", count: 2, :legacy => true }
	nested = { outer: { inner: [1, 2] } }
	doubled = array.map { |value| value * 2 }
	hash.fetch(:name, "unknown")

	[nested, doubled]
end

# --- Treesitter: @constructor, @function.call, @function.method, @function.builtin ---
# --- Treesitter: @property, @variable.member, @type, @type.definition ---
def calls
	widget = Widget.new("demo", id: 1)
	widget.greet("Hi")
	widget.name
	widget.name = "renamed"
	puts widget.name
	require "json"
	JSON.generate({ ok: true })
end

# --- Treesitter: @type.builtin, @constant.builtin, @label, @string.special.symbol ---
def builtin_values(value)
	types = [String, Integer, Float, Array, Hash, Symbol]
	constants = [RUBY_VERSION, RUBY_PLATFORM, ENV, ARGV]
	labels = { name: value, count: types.length }
	[types, constants, labels]
end

# --- Treesitter: @attribute, @comment.documentation ---
# Public API documentation for the showcase.
def documented
	:ok
end

# --- Treesitter: @keyword.function, @keyword.import, @operator, @punctuation.special ---
def self.build
	new("built")
end

# --- Treesitter: @variable.parameter, @variable.builtin, @variable, @property ---
def parameterized(value, other = nil)
	local = value
	[local, other, self]
end

# --- Common base groups: @comment, @number, @string, @boolean, @keyword ---
# --- Common base groups: @function, @operator, @punctuation.delimiter, @punctuation.bracket ---
# --- Common base groups: @constant, @type, @variable, @property, @variable.parameter ---
# The constructs above already cover the common set; this section is a compact
# smoke test for the same roles.
def common_base(input)
	count = 1
	label = "text"
	enabled = true
	result = input + count
	[result, label, enabled]
end
