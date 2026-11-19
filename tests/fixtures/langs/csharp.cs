// yugen-ash highlight showcase — C# (.cs)
//
// Open with the theme:
//   nvim -u tests/minimal_init.lua tests/fixtures/langs/csharp.cs
//   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/csharp.cs
//
// Headless coverage check:
//   scripts/test-highlights.sh csharp
//
// Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

// legacy syntax: csComment, csXmlComment, csXmlCommentLeader, csXmlTag
// Treesitter: @comment, @comment.documentation
using System;
using System.Collections.Generic;
using System.Text.Json;

// legacy syntax: csPreProcessor, csPreCondit, csRegion
#define SHOWCASE
#region Constants
#endregion

namespace YugenAsh.Showcase;

// legacy syntax: csAttribute, csClass, csModifier, csStorage
// Treesitter: @attribute, @keyword, @type.definition
[Serializable]
public sealed class Theme
{
	// legacy syntax: csType, csClassType, csUserType, csNewType
	// legacy syntax: csConstant, csNumber, csFloat, csBoolean, csNull
	// Treesitter: @type, @type.builtin, @constant, @number, @boolean
	public const string Name = "yugen-ash";
	public const int Version = 2;
	private readonly double ratio = 3.14;
	private bool enabled = true;
	private Theme? parent = null;

	// legacy syntax: csAccessModifier, csModifier
	// Treesitter: @property, @function, @constructor
	public Theme(string name, int version = 1)
	{
		Id = Guid.NewGuid();
		Label = name;
		Version = version;
	}

	public Guid Id { get; }
	public string Label { get; init; }
	public int Version { get; set; }

	// legacy syntax: csUserMethod, csConditional, csRepeat, csException
	// Treesitter: @keyword.conditional, @keyword.repeat, @keyword.return
	public string Describe(IEnumerable<string> tags)
	{
		var result = new List<string>();

		foreach (var tag in tags)
		{
			if (string.IsNullOrEmpty(tag))
			{
				continue;
			}

			result.Add(tag);
		}

		for (var i = 0; i < result.Count; i++)
		{
			Console.WriteLine(result[i]);
		}

		try
		{
			var json = JsonSerializer.Serialize(result);
			return json;
		}
		catch (JsonException error) when (error.Message.Contains("invalid"))
		{
			throw new InvalidOperationException("serialize failed", error);
		}
		finally
		{
			enabled = !enabled;
		}
	}

	// legacy syntax: csInterpolation, csInterpolationDelimiter
	// legacy syntax: csString, csVerbatimString, csQuote
	// Treesitter: @string, @punctuation.special
	public string Render(int count)
	{
		var plain = "plain string";
		var escaped = "line\nquote\"tab\t";
		var verbatim = @"C:\temp\folder";
		var interpolated = $"{Label}: {count} items";
		var raw = """
			raw
			text
			""";
		char letter = 'A';
		var numbers = new[] { 1, 2, 3 };
		var map = new Dictionary<string, int> { ["count"] = count };

		return $"{plain} {escaped} {verbatim} {interpolated} {raw} {letter} {numbers.Length} {map["count"]}";
	}

	// legacy syntax: csLogicSymbols, csOperator
	// Treesitter: @operator, @label
	public bool Check(int value)
	{
	retry:
		if (value > 0 && ratio > 0 || value == 0)
		{
			return true;
		}

		value--;
		goto retry;
	}
}

// legacy syntax: csUnspecifiedStatement, csContextualStatement
// Treesitter: @keyword, @type
public interface IThemeStore
{
	Theme? Find(string name);
}

public enum ThemeMode
{
	Light,
	Dark,
}

public record ThemeRecord(string Name, int Version);
