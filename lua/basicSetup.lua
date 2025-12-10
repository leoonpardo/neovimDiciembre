vim.opt.foldmethod = 'indent'
vim.opt.fillchars = "fold: "
vim.opt.foldtext = "getline(v:foldstart)"
vim.opt.wrap = false
local indent_cache = ""
function CaptureIndent()
  local line = vim.api.nvim_get_current_line()
  indent_cache = line:match("^%s*") or ""
  print("Indentation captured")
end

-- Aplica la indentación capturada a la línea actual
function ApplyIndent()
  local line = vim.api.nvim_get_current_line()
  local new_line = indent_cache .. line:gsub("^%s*", "")
  vim.api.nvim_set_current_line(new_line)
  print("Indentation applied")
end
  
    
vim.api.nvim_set_keymap('n','q', 'zo', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','m', 'viw', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','f', 'ma', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','j', 'v`a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','y', 'zc', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','vq', 'zR', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','vy', 'zM', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','vi', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','b', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','vb', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','n', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','vn', '<C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i',';', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<F5>', ':', { noremap = true, silent = true })
 
vim.api.nvim_set_keymap('n', 'u', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'w', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'r', '"+dd', { noremap = true, silent = true })
  
vim.api.nvim_set_keymap('v', 'u', '"+yy<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'r', '"+dd<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<BackSpace>', '<Del>', { noremap = true, silent = true })
 
vim.api.nvim_set_keymap('n', 'p', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'o', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'e', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'vw', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'vr', '$a', { noremap = true, silent = true })
vim.keymap.set("n", "<BackSpace>", ":call append(line('.'), repeat(' ', indent('.')))<CR>j", { noremap = true, silent = true })
  
vim.api.nvim_set_keymap('n', 's', ':w!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd', 'u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'a', '<C-r>', { noremap = true, silent = true })
 
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<Space>", "<gv", { noremap = true, silent = true })
 
  
vim.api.nvim_set_keymap('i',"<Tab><CR>", '<Right><Esc>:lua CaptureIndent()<CR>i<CR><Esc>:lua ApplyIndent()<CR><Up>o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>i', '+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>t', '*', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>v', '-', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>w', ',', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>e', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>r', '()<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>a', ':', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>s', '.', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>d', '=', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>f', '/', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>z', '<><Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>x', '&', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>c', '""<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>n', '\\', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>m', '|', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>b', '!', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>p', '[]<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>o', '@', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>u', ';', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>l', "''<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>g', '{}<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>j', '``<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>q', '#', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>y', '%', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>h', '?', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<Tab>k', '_', { noremap = true, silent = true })
