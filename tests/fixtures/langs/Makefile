# yugen-ash highlight showcase — Makefile
#
# Open with the theme:
#   nvim -u tests/minimal_init.lua tests/fixtures/langs/Makefile
#   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/Makefile
#
# Headless coverage check:
#   scripts/test-highlights.sh make
#
# Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

# legacy syntax: makeComment
# Treesitter: @comment
# Plain comment for makeComment.

# legacy syntax: makeIdent, makeOverride, makeExport
# Treesitter: @variable, @operator
NAME := showcase
VERSION = 1.0
CC ?= cc
CFLAGS += -Wall -Wextra
SRC = src/main.c src/theme.c
OBJ = $(SRC:.c=.o)
override PREFIX = /usr/local
export PATH := $(PREFIX)/bin:$(PATH)

# legacy syntax: makeInclude, makePreCondit
include config.mk
ifdef DEBUG
CFLAGS += -g -O0
else
CFLAGS += -O2
endif

# legacy syntax: makeDefine
define greet
	@echo "hello $(1)"
endef

# legacy syntax: makeSpecialTarget, makeTarget, makeSpecTarget
# legacy syntax: makeCommands, makeCmdNextLine
.PHONY: all clean install
all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ \
		$(LDFLAGS)

# legacy syntax: makeImplicit
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# legacy syntax: makeDString, makeSString, makeBString, makeSpecial
install: $(NAME)
	install -d "$(DESTDIR)$(PREFIX)/bin"
	install -m 0755 $(NAME) '$(DESTDIR)$(PREFIX)/bin/$(NAME)'
	@echo "installed $$(basename $(NAME))"

clean:
	rm -f $(OBJ) $(NAME)
	$(call greet,clean)
