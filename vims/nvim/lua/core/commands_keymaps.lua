-- L command for nvim-tree
vim.api.nvim_create_user_command(
  'L',
  "NvimTreeToggle",
  {bang = false}
)

vim.api.nvim_create_user_command(
  'K',
  "NvimTreeResize 25",
  {bang = false}
)

-- P command for prototypes
vim.api.nvim_create_user_command(
  'P',
  "! ~/my_scripts/my_prototypes.sh",
  {bang = false}
)

-- M command for make
vim.api.nvim_create_user_command(
  'M',
  "make",
  {bang = false}
)


---------------------------------------
-- Q command for quit and Session
local function Save_Session()
    if (vim.fn.isdirectory('misc') == 1) then
        vim.cmd('mksession! misc/Session.vim')
	end
	vim.cmd("qa")
end

vim.api.nvim_create_user_command(
  'Q',
  Save_Session,
  {bang = false}
)
---------------------------------------


---------------------------------------------------
-- TERMINAL Commands
-- Remap to escape terminal mode
vim.api.nvim_set_keymap("t", "<leader><Esc>", "<C-\\><C-N>", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-w>", "<C-\\><C-N><C-w>", { noremap = true })

-- T command for vertical terminal
vim.api.nvim_create_user_command(
  'T',
  "botright vsplit term://zsh",
  {bang = false}
)

-- R command for horizontal terminal
vim.api.nvim_create_user_command(
  'R',
  "split term://zsh",
  {bang = false}
)

-- Automatic insert mode when entering a terminal
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "if &buftype == 'terminal' | :startinsert | endif"
})

-- Or only on new terminal:
--vim.api.nvim_create_autocmd("TermOpen", {
--	pattern = "*",
--	command = "startinsert"
--})
---------------------------------------------------



-- Set keymaps for Windows Navigation
function set_keymaps_all(new, old, noremap)
	vim.api.nvim_set_keymap("t", new, "<C-\\><C-N>" .. old, { noremap = noremap })
	vim.api.nvim_set_keymap("i", new, "<C-\\><C-N>" .. old, { noremap = noremap })
	vim.api.nvim_set_keymap("n", new, old, { noremap = noremap })
end

set_keymaps_all("<A-c>", "<C-w>c", true) -- Close
set_keymaps_all("<A-t>", "<C-w>t", true) -- Top
set_keymaps_all("<A-b>", "<C-w>b", true) -- Bottom
set_keymaps_all("<A-h>", "<C-w>h", true) -- Left
set_keymaps_all("<A-j>", "<C-w>j", true) -- Down
set_keymaps_all("<A-k>", "<C-w>k", true) -- Up
set_keymaps_all("<A-l>", "<C-w>l", true) -- Right
set_keymaps_all("<A-s>", "<C-w>s", true) -- Split
set_keymaps_all("<A-v>", "<C-w>v", true) -- Vertical Split
set_keymaps_all("<A-x>", "<C-w>x", true) -- Switch positions


-- -------- Change line number based on mode: --------------
-- for command mode: make it absolute for ranges etc
-- for normal mode: relative movements <3
local cmdline_group = vim.api.nvim_create_augroup("CmdlineLinenr", {})
-- debounce cmdline enter events to make sure we dont have flickering for non user cmdline use
-- e.g. mappings using : instead of <cmd>
local cmdline_debounce_timer

vim.api.nvim_create_autocmd("CmdlineEnter", {
    group = cmdline_group,
    callback = function()
        cmdline_debounce_timer = vim.uv.new_timer()
        cmdline_debounce_timer:start(100, 0, vim.schedule_wrap(function()
            if vim.o.number then
                vim.o.relativenumber = false
                vim.api.nvim__redraw({ statuscolumn = true })
            end
        end))
    end
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
    group = cmdline_group,
    callback = function()
        if cmdline_debounce_timer then
            cmdline_debounce_timer:stop()
            cmdline_debounce_timer = nil
        end
        if vim.o.number then
            vim.o.relativenumber = true
        end
    end
})


-- majT will open window in new tab
vim.api.nvim_set_keymap("n", "T", "<C-w>v<C-w>T", { noremap = true })

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "*.hpp" },
  callback = function()
    local filename = vim.fn.expand("%:t"):upper():gsub("[^A-Z0-9]", "_")
	local classname = vim.fn.expand('%:t'):gsub(".hpp", "")
    local guard = "__" .. filename .. "__"

    local lines = {
      "#ifndef " .. guard,
      "#define " .. guard,
      "",
	  "class " .. classname,
	  "{",
	  "}",
      "",
      "#endif // " .. guard
    }

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  end
})
