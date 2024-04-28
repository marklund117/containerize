<script>
	import TodoItem from '../components/TodoItem.svelte';

	let todoItems = [
		{ id: 1, text: 'Write Webapps', completed: false },
		{ id: 2, text: 'Create Calzones', completed: true }
	];

	let newItemText = '';

	function addItem() {
		if (newItemText.trim() !== '') {
			const newItem = {
				id: todoItems.length + 1,
				text: newItemText.trim(),
				completed: false
			};
			todoItems = [...todoItems, newItem];
			newItemText = '';
		}
	}

	function clearCompleted() {
		todoItems = todoItems.filter((item) => !item.completed);
	}

	$: incompleteCount = todoItems.filter((item) => !item.completed).length;
</script>

<div class="min-h-screen w-full bg-slate-100 rounded-md p-4 flex flex-col">
	<div class="mx-auto w-1/2 bg-slate-200 rounded-md shadow-sm flex flex-col">
		<div class="flex justify-between items-center">
			<h1 class="text-slate-950 text-2xl p-4">Svelte To-Do App</h1>
			<form on:submit|preventDefault={addItem}>
				<input
					type="text"
					class="p-2 m-2 rounded-md border border-slate-300"
					placeholder="Enter a new task"
					bind:value={newItemText}
				/>
				<button
					type="submit"
					class="bg-teal-200 p-2 m-2 rounded-md border border-slate-500 hover:bg-teal-300"
				>
					Add Item
				</button>
			</form>
		</div>
		<div class="flex justify-between items-center bg-slate-200">
			<p class="p-4 text-orange-600">{incompleteCount} incomplete items remain</p>
			<button
				class="bg-teal-100 p-2 m-2 rounded-md border border-slate-500 hover:bg-teal-200"
				on:click={clearCompleted}
			>
				Clear Completed Items
			</button>
		</div>
	</div>
	{#each todoItems as item}
		<TodoItem {item} bind:todoItems />
	{/each}
</div>
