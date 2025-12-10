vim.keymap.set('n', 't', function()
  vim.fn.setreg('+', vim.fn.expand('%:p:h'))
end, { desc = "Copiar carpeta del buffer actual" })

vim.keymap.set("n", "i", function()
  local path = vim.fn.expand("%:p:h")   -- Carpeta del archivo actual
  vim.cmd("NnnExplorer " .. path)
end, { desc = "Abrir nnn en carpeta del buffer actual" })

vim.keymap.set('n', 'vj', function()
  -- Copiar al portapapeles la ruta del directorio del buffer actual
  vim.fn.setreg('+', vim.fn.expand('%:p:h'))
  -- Abrir terminal y ejecutar ./git
  vim.cmd('terminal ./git')
end, { noremap = true })
