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

-- Layout management functions
local function create_default_layout()
  -- Close all windows except current
  vim.cmd("only")
  
  -- Open file tree on the left (30% width)
  vim.cmd("NvimTreeOpen")
  vim.cmd("wincmd H") -- Move tree to far left
  vim.cmd("vertical resize 40") -- Set width
  
  -- Move to main window
  vim.cmd("wincmd l")
  
  -- Create terminal at bottom (25% height)
  vim.cmd("split | terminal")
  vim.cmd("resize 12") -- Set height
  
  -- Go back to main editor window
  vim.cmd("wincmd k")
end

local function reset_to_single_buffer()
  -- Close NvimTree if open
  local nvim_tree_api = require("nvim-tree.api")
  if nvim_tree_api.tree.is_visible() then
    nvim_tree_api.tree.close()
  end
  
  -- Close all windows except current
  vim.cmd("only")
end

-- Map layout commands
map("n", "<leader>ld", create_default_layout, { desc = "Create default layout" })
map("n", "<leader>lr", reset_to_single_buffer, { desc = "Reset to single buffer" })
