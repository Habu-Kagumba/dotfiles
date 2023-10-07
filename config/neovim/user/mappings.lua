-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- Show dashboard on close last buffer
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close Buffer"
    },
    ["<leader>T"] = { name = "Tests" },
    ["<leader>Tn"] = { function() require("neotest").run.run() end, desc = "Run nearest test" },
    ["<leader>Tf"] = { function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run current test file" },
    ["<leader>Ts"] = { function() require("neotest").run.stop() end, desc = "Stop nearest test" },
    ["<leader>Ta"] = { function() require("neotest").run.attach() end, desc = "Attach to nearest test" },
    ["<leader>Tw"] = { function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Watch tests" },
    ["<leader>To"] = { function() require("neotest").output_panel.toggle() end, desc = "Tests output" },
    ["<leader>Tm"] = { function() require("neotest").summary.toggle() end, desc = "Tests summary" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
