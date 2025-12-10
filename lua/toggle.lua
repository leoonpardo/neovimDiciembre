

_G.input_activo = false

function _G.toggle_input_relativo()
    local buf = vim.api.nvim_get_current_buf()
    local keys = { m= "1", n= "2", b= "3", u= "4", o= "5", p= "6", h= "7", j= "8", g= "9", l= "0" }

    if not _G.input_activo then
        for key, val in pairs(keys) do
            vim.api.nvim_buf_set_keymap(buf, "i", key, val, { noremap = true, silent = true })
        end
    else
        for key, _ in pairs(keys) do
            -- Solo eliminar si el mapeo existe
            if vim.fn.maparg(key, "i", false, true).buffer == 1 then
                vim.api.nvim_buf_del_keymap(buf, "i", key)
            end
        end
    end

    _G.input_activo = not _G.input_activo
end

vim.api.nvim_set_keymap("i", "<Tab><Space>", "<Esc>:lua _G.toggle_input_relativo()<CR>a", { noremap = true, silent = true })

_G.input_mayusculo = false

function _G.toggle_input_mayuscula()
    local buf = vim.api.nvim_get_current_buf()
    local keys = {
        a = "A", b = "B", c = "C", d = "D", e = "E", f = "F",
        g = "G", h = "H", i = "I", j = "J", k = "K", l = "L",
        m = "M", n = "N", o = "O", p = "P", q = "Q", r = "R",
        s = "S", t = "T", u = "U", v = "V", w = "W", x = "X",
        y = "Y", z = "Z"
    }

    if not _G.input_mayusculo then
        for key, val in pairs(keys) do
            vim.api.nvim_buf_set_keymap(buf, "i", key, val, { noremap = true, silent = true })
        end
    else
        for key, _ in pairs(keys) do
            local map_info = vim.fn.maparg(key, "i", false, true)
            if type(map_info) == "table" and map_info.buffer == 1 then
                vim.api.nvim_buf_del_keymap(buf, "i", key)
            end
        end
    end

    _G.input_mayusculo = not _G.input_mayusculo
end

vim.api.nvim_set_keymap("i", "<Tab><BackSpace>", "<Esc>:lua _G.toggle_input_mayuscula()<CR>a", { noremap = true, silent = true })

_G.toggle_buscar = false
 
function _G.get_search_next()
    vim.fn.feedkeys("/\\c" .. vim.fn.escape(pal_buscar, "/\\") .. "\\zs\n", "n")
end
 
function _G.toggle_buscar_master()
    local buf = vim.api.nvim_get_current_buf()
    if not _G.toggle_buscar then
        vim.api.nvim_set_keymap("n", ";", ":lua _G.get_search_next()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<Space>", ":lua _G.get_search_prev()<CR>" ,{ noremap = true, silent= true})
    else
        vim.api.nvim_set_keymap('n',';', 'i', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n','<Space>', 'v', { noremap = true, silent = true })
    end

    _G.toggle_buscar = not _G.toggle_buscar 
end

_G.toggle_buscar_clear = false

vim.api.nvim_set_keymap('n',';', 'i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<Space>', 'v', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v',';', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "z", "<C-f>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "z", "<Esc><C-d>v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "c", "<Esc><C-u>v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "c", "<C-b>", { noremap = true, silent = true })
function _G.toggle_clear()
    local buf = vim.api.nvim_get_current_buf()
    if not _G.toggle_buscar_clear then
        vim.api.nvim_set_keymap("n", "z", ":lua _G.toggle_buscar_master()<CR>:noh<CR>:lua _G.toggle_clear()<CR>", { noremap = true, silent = true })
    else
        vim.api.nvim_set_keymap("n", "z", "<C-f>", { noremap = true, silent = true })
    end

    _G.toggle_buscar_clear = not _G.toggle_buscar_clear 
end


