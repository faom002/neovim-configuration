vim.g.mapleader = " "

-- this for moving me back to directory
vim.keymap.set("n", "1", ":Ex<CR>")



--renaming variables quicker
vim.api.nvim_set_keymap('n', '<leader>r', [[:%s/\<<C-r><C-w>\>//gI<Left><Left>]], { noremap = true, silent = true })




-- Optional: Set up key mappings for navigating branches and commits
vim.api.nvim_set_keymap('n', '<leader>j',
    [[<cmd>lua require('telescope.builtin').git_branches({ action = require('telescope.actions').git_checkout })<CR>]],
    { noremap = true, silent = true })



-- Autocompleting with Ctrl + y (redo)
vim.keymap.set("n", "<C-y>", ":redo<CR>", { noremap = true, silent = true })


-- undo changes
vim.keymap.set("n", "`", ":undo<CR>", { noremap = true, silent = true })


-- this is for moving code line up and down in Visual mode only
vim.keymap.set("v", "j", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "k", ":m '<-1<CR>gv=gv")



-- deleting directory
vim.api.nvim_set_keymap("n", "8",
    ":let dirname = input('Enter directory name to delete: ') | execute ':!rm -r %:p:h/' . dirname<CR>",
    { noremap = true, silent = true })






-- making folder in curret directory
vim.api.nvim_set_keymap("n", "7",
    ":let dirname = input('Enter directory name: ') | execute ':!mkdir -p %:p:h/' . dirname<CR>",
    { noremap = true, silent = true })




-- empties the string quotes
vim.api.nvim_set_keymap("n", "<leader>4", [[:normal! ci"<CR>]], { noremap = true, silent = true })


-- scrolling up and down five lines in normal mode
vim.api.nvim_set_keymap('n', '<Up>', ':normal! 5k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', ':normal! 5j<CR>', { noremap = true, silent = true })


-- for moving left or right 4 lines
vim.api.nvim_set_keymap('n', '<Right>', ':normal! 5l<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', ':normal! 5h<CR>', { noremap = true, silent = true })


-- for making a file at the current path
vim.api.nvim_set_keymap('n', '<leader>s', '%', { noremap = true, silent = true })





-- debugging
vim.keymap.set('n', '-', function() require('dap').continue() end)
vim.keymap.set('n', '.', function() require('dap').step_over() end)
-- vim.keymap.set('n', '.', function() require('dap').step_into() end)
vim.keymap.set('n', '=', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<leader>=', function() require('dap').clear_breakpoints() end)

require("dapui").setup()



-- Show DAP UI
vim.keymap.set('n', '6', function()
    require("dapui").open()
end)

-- Hide DAP UI
vim.keymap.set('n', '<leader>6', function()
    require("dapui").close()
end)

local dap = require("dap")

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
}


dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
    },
}





-- (ctrl + w) for switching between tabs

-- (ctrl + y) for autocompleting autocompleting

-- (ctrl + p) for going next option in autocomplete
-- (ctrl + n) for next suggestion
-- (ctrl + e) for clearing out suggestion








-- Setup FTerm
require 'FTerm'.setup({
    border     = 'double',
    dimensions = {
        height = 0.9,
        width = 0.9,
    },
})




vim.api.nvim_set_keymap('n', '5', '<cmd>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })




-- exit normal mode in terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })


-- save changes
vim.keymap.set("n", "3", ":w<CR>")

-- search in directory
vim.keymap.set("n", "2", require("telescope.builtin").find_files, {})

-- for deleting a file or directory
vim.api.nvim_set_keymap('n', '4', ':Delete<Space>', { noremap = true, silent = false })

vim.cmd([[
  command! -nargs=1 Delete :call delete(expand("<args>")) | e
]])




-- prank makes the code fall
vim.keymap.set("n", ",", "<cmd>CellularAutomaton make_it_rain<CR>")




-- formatting file
vim.keymap.set("n", "<leader>1", function()
    require('conform').format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000,
    })
end, { desc = "Format file" })
