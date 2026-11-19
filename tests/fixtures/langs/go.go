// yugen-ash highlight showcase — Go (.go)
//
// Open with the theme:
//   nvim -u tests/minimal_init.lua tests/fixtures/langs/go.go
//   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/go.go
//
// Headless coverage check:
//   scripts/test-highlights.sh go
//
// Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

// legacy syntax: goComment
// Treesitter: @comment
// Plain comment for goComment.

// legacy syntax: goPackage, goImport
// Treesitter: @keyword, @keyword.import, @module
package showcase

import (
	"fmt"
	"strings"
)

// legacy syntax: goDirective
//go:generate stringer -type=Mode

// legacy syntax: goConst, goConstants, goPredefinedIdentifiers, goBoolean
// Treesitter: @constant, @constant.builtin, @boolean, @number
const (
	Name    = "yugen-ash"
	Version = 2
	Ratio   = 3.14
	Hex     = 0xFF
	Truthy  = true
	Falsy   = false
)

// legacy syntax: goType, goSignedInts, goUnsignedInts, goFloats, goComplexes
// Treesitter: @type, @type.builtin
type Alias = int
type Count int32
type Flags uint64
type Weight float64
type Signal complex128

// legacy syntax: goStruct, goStructDef, goField
// Treesitter: @type, @type.definition, @variable.member
type Theme struct {
	Name    string
	Version int
	Enabled bool
	Ratio   float64
	Tags    []string
}

// legacy syntax: goInterface
// Treesitter: @type, @type.definition
type Renderer interface {
	Render(prefix string) string
}

// legacy syntax: goFunction, goFunctionCall, goFunctionReturn, goReceiverType
// Treesitter: @function, @function.call, @constructor
func NewTheme(name string) *Theme {
	return &Theme{Name: name, Version: Version, Enabled: Truthy, Ratio: Ratio}
}

func (t *Theme) Render(prefix string) string {
	return fmt.Sprintf("%s%s:%d", prefix, t.Name, t.Version)
}

// legacy syntax: goVar, goLabel, goStatement, goDeclaration, goDeclType
// Treesitter: @variable, @label, @keyword
func (t *Theme) Update(values []string) (int, error) {
	total := 0

loop:
	for index, value := range values {
		if value == "" {
			continue loop
		}

		switch index {
		case 0:
			total += 1
		default:
			total += len(value)
		}
	}

	if total == 0 {
		return 0, fmt.Errorf("no values")
	}

	return total, nil
}

// legacy syntax: goConditional, goRepeat, goOperator, goBuiltins
// Treesitter: @keyword.conditional, @keyword.repeat, @operator
func main() {
	theme := NewTheme("yugen-ash")
	theme.Tags = append(theme.Tags, "editor", "colorscheme")

	for index := 0; index < 3; index++ {
		fmt.Println(theme.Render("> "))
	}

	if theme.Enabled && theme.Ratio > 0 {
		fmt.Println(strings.ToUpper(theme.Name))
	} else if theme.Name == "" {
		panic("missing name")
	} else {
		fmt.Println("disabled")
	}

	count := 0
	for count < 2 {
		count++
	}

	switch {
	case count > 0:
		fmt.Println("positive")
	default:
		fmt.Println("zero")
	}

	done := make(chan bool)
	go func() {
		done <- true
	}()
	<-done
	defer fmt.Println("done")

	// legacy syntax: goRawString, goString, goEscape, goSpecialString
	// Treesitter: @string, @string.special, @punctuation.special
	raw := `raw string with \n and "quotes"`
	quoted := "line\nquote\"tab\t"
	formatted := fmt.Sprintf("%s-%d", raw, Version)
	_ = formatted
	_ = quoted
}
