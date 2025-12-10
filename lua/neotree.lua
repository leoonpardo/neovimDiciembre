vim.keymap.set('n', 't', function()
  vim.fn.setreg('+', vim.fn.expand('%:p:h'))
end, { desc = "Copiar carpeta del buffer actual" })
vim.keymap.set('n', 'vj', function()
  -- Copiar al portapapeles la ruta del directorio del buffer actual
  vim.fn.setreg('+', vim.fn.expand('%:p:h'))
  -- Abrir terminal y ejecutar ./git
  vim.cmd('terminal ./git')
end, { noremap = true })

vim.keymap.set("n", "i", function()
  local path = vim.fn.expand("%:p:h")
  local width = math.floor(vim.o.columns / 3)

  -- Crear split a la izquierda
  vim.cmd("topleft " .. width .. "vsplit")

  -- Abrir Oil en esa ventana
  require("oil").open(path)

  -- Configurar comportamiento dentro de Oil
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil",
    callback = function()
      -- Abrir archivo en la ventana derecha
      vim.keymap.set("n", "e", function()
        local oil = require("oil")
        local entry = oil.get_cursor_entry()
        if entry and entry.type == "file" then
          local fullpath = oil.get_current_dir() .. entry.name
          vim.cmd("wincmd l")
          vim.cmd("edit " .. vim.fn.fnameescape(fullpath))
        end
      end, { buffer = true })

      -- Subir un nivel de carpeta (abrir directorio padre en Oil)
      vim.keymap.set("n", "w", function()
        local oil = require("oil")
        local entry = oil.get_cursor_entry()
        if entry and entry.type == "file" then
          local fullpath = oil.get_current_dir() .. entry.name
	local parent = vim.fn.fnamemodify(fullpath, ":h:h")
	-- Abrir Oil en ese directorio
	oil.open(parent)         
        end
      end, { buffer = true })
    end,
  })
end, { desc = "Abrir Oil en split vertical 1/3 izquierda" })
