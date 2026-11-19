<!-- yugen-ash highlight showcase — Svelte (.svelte)

  Open with the theme:
    nvim -u tests/minimal_init.lua tests/fixtures/langs/svelte.svelte
    YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/svelte.svelte

  Headless coverage check:
    scripts/test-highlights.sh svelte

  Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>
-->
<script lang="ts">
	// --- Treesitter: @comment, @keyword.import, @keyword ---
	import { onMount } from "svelte";
	import Card from "./Card.svelte";

	// --- Treesitter: @variable, @type, @string, @number ---
	let count: number = 0;
	let name = "yugen-ash";
	let enabled = true;
	let items: string[] = ["one", "two"];
	const ratio = 3.14;

	// --- Treesitter: @function, @variable.parameter ---
	function increment(step: number = 1): void {
		count += step;
	}

	// --- Treesitter: @function.call, @keyword.logical ---
	$: doubled = count * 2;
	$: label = enabled ? "on" : "off";

	onMount(() => {
		increment(0);
	});
</script>

<!-- legacy syntax: svelteTag, svelteTagName, svelteComponentName -->
<!-- Treesitter: @tag, @tag.builtin, @type -->
<svelte:head>
	<title>{name}</title>
</svelte:head>

<!-- legacy syntax: svelteAttribute, svelteAttributeName, svelteDirective -->
<!-- Treesitter: @tag.attribute, @tag.delimiter, @property -->
<div class="card" data-count={count} class:active={enabled}>
	<h1>{name} — {count}</h1>

	<!-- legacy syntax: svelteString -->
	<!-- Treesitter: @string, @punctuation.special -->
	<p>{"plain " + name}</p>

	<!-- legacy syntax: svelteBlockKeyword, svelteConditional -->
	<!-- Treesitter: @keyword.conditional, @punctuation.bracket -->
	{#if enabled}
		<p>enabled</p>
	{:else if count > 0}
		<p>positive</p>
	{:else}
		<p>disabled</p>
	{/if}

	<!-- legacy syntax: svelteRepeat, svelteKeyword -->
	<!-- Treesitter: @keyword.repeat, @variable -->
	{#each items as item, index (item)}
		<li>{index}: {item}</li>
	{/each}

	<!-- legacy syntax: svelteBraces -->
	<!-- Treesitter: @punctuation.special, @punctuation.bracket -->
	{#await Promise.resolve(items)}
		<p>loading</p>
	{:then loaded}
		<p>{loaded.length} items</p>
	{:catch error}
		<p>{error.message}</p>
	{/await}

	<!-- Treesitter: @tag, @tag.attribute -->
	<Card title={name} {count} on:increment={() => increment(1)} bind:value={name} use:tooltip />
	<button on:click={() => increment()} disabled={!enabled}>+1</button>
	<input bind:value={name} placeholder="name" />
</div>

<!-- Treesitter: @tag, @type -->
<style>
	.card {
		color: #d4d4d4;
	}
</style>
