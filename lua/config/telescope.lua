
require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				["<C-d>"] = function(bufnr)
					require("telescope.state").get_status(bufnr).picker.layout_config.scroll_speed = nil
					return require("telescope.actions").preview_scrolling_down(bufnr)
				end,
				["<C-u>"] = function(bufnr)
					require("telescope.state").get_status(bufnr).picker.layout_config.scroll_speed = nil
					return require("telescope.actions").preview_scrolling_up(bufnr)
				end,
			},
		},
		pickers = {
			find_files = {
				path_display = filenameFirst,
			},
		},
	},
}

-- Enable telescope fzf native, if installed
 pcall(require('telescope').load_extension, 'fzf')

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end


-- require('telescopepickers').prettyGrepPicker({ picker = 'live_grep' })
-- require('telescopepickers').prettyGrepPicker({ picker = 'grep_string' })
-- -- require('telescopepickers').prettyFilesPicker({ picker = 'git_files' })
-- require('telescopepickers').prettyFilesPicker({ picker = 'find_files' })
-- require('telescopepickers').prettyFilesPicker({ picker = 'oldfiles' })

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', function() require('telescopepickers').prettyFilesPicker({ pickers = 'oldfiles' }) end, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find({
		layout = 'horizontal'
	})
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', function() require('telescopepickers').prettyFilesPicker({ picker = 'git_files' }) end, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', function() require('telescopepickers').prettyFilesPicker({ picker = 'find_files' }) end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', function() require('telescopepickers').prettyGrepPicker({ picler = 'grep_string' }) end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', function() require('telescopepickers').prettyGrepPicker({ picker = 'live_grep' }) end, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
