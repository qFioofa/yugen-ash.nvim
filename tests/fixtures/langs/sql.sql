-- yugen-ash highlight showcase — SQL (.sql)
--
-- Open with the theme:
--   nvim -u tests/minimal_init.lua tests/fixtures/langs/sql.sql
--   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/sql.sql
--
-- Headless coverage check:
--   scripts/test-highlights.sh sql
--
-- Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

-- legacy syntax: sqlComment
-- Treesitter: @comment
-- Plain comment for sqlComment.

/* block comment */

-- legacy syntax: sqlStatement, sqlKeyword, sqlType
-- Treesitter: @keyword, @type, @type.builtin
CREATE TABLE themes (
	id INTEGER PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	enabled BOOLEAN DEFAULT TRUE,
	ratio FLOAT,
	created_at TIMESTAMP WITH TIME ZONE,
	description TEXT
);

-- legacy syntax: sqlSpecial, sqlConditional, sqlOperator
-- Treesitter: @keyword, @operator
CREATE OR REPLACE VIEW enabled_themes AS
SELECT id, name, ratio
FROM themes
WHERE enabled = TRUE AND ratio > 0.5;

-- legacy syntax: sqlString, sqlNumber, sqlVariable
-- Treesitter: @string, @number, @boolean, @variable
INSERT INTO themes (name, enabled, ratio, description)
VALUES ('yugen-ash', TRUE, 1.5, 'A colorscheme'),
       ('fallback', FALSE, 0.0, NULL);

-- legacy syntax: sqlFunction, sqlTable, sqlColumn, sqlParen
-- Treesitter: @function, @function.call, @field, @punctuation
SELECT t.name AS theme,
       COUNT(*) AS total,
       MAX(t.ratio) AS best
FROM themes AS t
INNER JOIN enabled_themes AS e ON e.id = t.id
WHERE t.name LIKE 'yugen%'
GROUP BY t.name
HAVING COUNT(*) > 0
ORDER BY best DESC
LIMIT 10;

UPDATE themes
SET ratio = ratio + 0.1, enabled = NOT enabled
WHERE id IN (SELECT id FROM themes WHERE name = 'yugen-ash');

DELETE FROM themes WHERE enabled = FALSE;

-- legacy syntax: sqlConditional
-- Treesitter: @keyword.conditional
BEGIN;
SAVEPOINT before_update;
ROLLBACK TO SAVEPOINT before_update;
COMMIT;
