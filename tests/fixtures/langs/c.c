/* yugen-ash highlight showcase — C (.c / .h)
 *
 * Open with the theme:
 *   nvim -u tests/minimal_init.lua tests/fixtures/langs/c.c
 *   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/c.c
 *
 * Headless coverage check:
 *   scripts/test-highlights.sh c
 *
 * Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>
 */

/* legacy syntax: cComment2, cCommentString, cCommentSkip */
/* Treesitter: @comment */
// Plain line comment for cComment2.
/* Block comment with a URL: https://example.com */

/* legacy syntax: cInclude, cPreCondit, cDefine, cMacro */
/* Treesitter: @preproc, @preproc.include, @preproc.define, @macro */
#include <stdio.h>
#include <stdlib.h>
#define VERSION "1.0"
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define DEBUG 0

#if DEBUG
#define LOG(msg) fprintf(stderr, "%s\n", msg)
#else
#define LOG(msg)
#endif

/* legacy syntax: cTypedef, cStructure, cType, cConstant */
/* Treesitter: @type, @type.definition, @structure, @constant */
typedef unsigned long size_t_alias;

struct Theme {
	const char *name;
	int version;
};

union Value {
	int integer;
	float real;
};

enum Mode {
	MODE_LIGHT = 1,
	MODE_DARK = 2,
};

/* legacy syntax: cStorageClass, cStatement */
/* Treesitter: @keyword, @keyword.storage, @keyword.function */
static const int GLOBAL_LIMIT = 42;

/* legacy syntax: cFunction */
/* Treesitter: @function, @constant */
static int compute(int value, const char *label)
{
	return value * 2;
}

/* legacy syntax: cLabel */
/* Treesitter: @label */
static void run_loop(int limit)
{
	int index = 0;

retry:
	if (index < limit) {
		index++;
		goto retry;
	}

	for (int i = 0; i < limit; i++) {
		if (i == 2) {
			continue;
		}
	}

	while (index > 0) {
		index--;
	}

	switch (index) {
	case 0:
		break;
	default:
		break;
	}
}

/* legacy syntax: cConditional, cRepeat, cException, cOperator */
/* Treesitter: @keyword.conditional, @keyword.repeat, @operator */
int main(void)
{
	int value = 42;
	unsigned int hex = 0xFFu;
	long binary = 0b1010L;
	double ratio = 3.14;
	char letter = 'A';
	const char *text = "escaped:\t\n\" snowman: \u2603";
	const char *wide = L"wide string";
	size_t_alias size = sizeof(struct Theme);
	union Value box = {.integer = 7};
	enum Mode mode = MODE_DARK;

	if (value > 0 && mode != MODE_DARK) {
		LOG("positive");
	} else if (binary == 0) {
		LOG("zero");
	} else {
		LOG("other");
	}

	do {
		value--;
	} while (value > 10);

	run_loop(3);

	printf("%s %d %u %ld %f %c %s %zu\n", VERSION, value, hex, binary, ratio, letter, text, size);
	(void)wide;
	(void)box;

	return EXIT_SUCCESS;
}
