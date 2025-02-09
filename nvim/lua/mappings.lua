require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Helper functions
function livegrep_cword()
  local word = vim.fn.expand("<cword>")
  require('telescope.builtin').live_grep({ default_text = word })
end

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>t", ":NvimTreeToggle<CR>")
map("n", "<leader>gb",":Gitsigns blame<CR>")
