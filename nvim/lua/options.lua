require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Auto-create default layout on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Only create layout if no files were passed as arguments
    if vim.fn.argc() == 0 then
      vim.defer_fn(function()
        -- Check if NvimTree is available
        local nvimtree_ok = pcall(require, "nvim-tree")
        if nvimtree_ok then
          -- Create the default layout
          vim.cmd("only")
          vim.cmd("NvimTreeOpen")
          vim.cmd("wincmd H")
          vim.cmd("vertical resize 40")
          vim.cmd("wincmd l")
          vim.cmd("vsplit")
          vim.cmd("vsplit | split | terminal")
        else
          print("NvimTree not loaded yet")
        end
      end, 500) -- Increased delay to ensure plugins are loaded
    end
  end,
  desc = "Create default layout on startup"
})
