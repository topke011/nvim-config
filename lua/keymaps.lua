vim.keymap.set('t', '<S-Space>', '<Space>')
vim.api.nvim_set_keymap(  't'  ,  '<ESC>'  ,  '<C-\\><C-n>'  ,  {noremap = true}  )
vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accpet-word)')

