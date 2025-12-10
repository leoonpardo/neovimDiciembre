-- Cargar fzf-lua
local fzf = require("fzf-lua")

fzf.setup({
  winopts = {
    height = 0.85,
    width = 0.80,
    preview = {
      layout = "vertical", -- vista previa vertical
    },
  },
})

-- Atajos de teclado
vim.keymap.set("n", "xu", fzf.live_grep, { desc = "Grep en proyecto" })
vim.keymap.set("n", "xi", fzf.buffers, { desc = "Buffers abiertos" })
vim.keymap.set("n", "xa", fzf.oldfiles, { desc = "Archivos recientes" })
vim.keymap.set("n", "xj", function()
  require("fzf-lua").files({ cwd = "~" })
end, { desc = "Buscar archivos desde HOME" })
vim.keymap.set("n", "xk", function()
  require("fzf-lua").live_grep({ cwd = "~" })
end, { desc = "Grep desde HOME" })

vim.keymap.set("n", "xy", function()
  require("fzf-lua").files({
    cwd = vim.fn.expand("%:p:h"), -- carpeta del buffer actual
  })
end, { desc = "Buscar archivos en carpeta del buffer" })

vim.keymap.set("n", "xl", function()
  require("fzf-lua").live_grep({
    cwd = vim.fn.expand("%:p:h"), -- carpeta del buffer actual
  })
end, { desc = "Grep en carpeta del buffer" })

