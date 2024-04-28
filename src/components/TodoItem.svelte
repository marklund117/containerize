<!-- TodoItem.svelte -->
<script>
    export let item = {};
    export let todoItems = [];
    let editing = false;
    let editText = '';

    function toggleComplete() {
        item.completed = !item.completed;
        todoItems = todoItems;
    }

    function editItem() {
        editing = true;
        editText = item.text;
    }

    function saveItem() {
        editing = false;
        item.text = editText;
        todoItems = todoItems;
    }

    function deleteItem() {
        todoItems = todoItems.filter(i => i.id !== item.id);
    }
</script>

<div class="flex items-center justify-between rounded-md shadow-sm p-4 mt-4 w-1/2 mx-auto bg-slate-200">
    <input class="mr-2" type=checkbox on:change={toggleComplete} checked={item.completed}>

    <div class="flex-grow text-center">
        {#if editing}
        <input class="w-full p-2 rounded-md border border-slate-300" type=text bind:value={editText}/>
        {:else}
        <p class:line-through={item.completed}>{item.text}</p>
        {/if}
    </div>

    <div class="ml-auto flex items-center">
        {#if editing}
        <button class="bg-teal-100 border border-slate-500 px-2 py-1 rounded-md hover:bg-teal-200" on:click={saveItem}>Save</button>
        {:else}
        <button class="bg-teal-100 border border-slate-500 px-2 py-1 rounded-md mr-2 hover:bg-teal-200" on:click={editItem}>Edit</button>
        <button class="bg-red-400 border border-slate-500 text-white px-2 py-1 rounded-md hover:bg-red-500" on:click={deleteItem}>Delete</button>
        {/if}
    </div>
</div>

