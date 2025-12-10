
local input_var1
local input_win_id

function _G.input_buscador()
    input_var1 = vim.api.nvim_create_buf(false, true)

    local width, height = 20, 1
    local row, col = 0, vim.o.columns - width

    input_win_id = vim.api.nvim_open_win(input_var1, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })
    vim.api.nvim_buf_set_option(input_var1, "buftype", "prompt")
    vim.fn.prompt_setprompt(input_var1, "Buscar: ")
    vim.api.nvim_buf_set_keymap(
        input_var1,
        "i",
        "<Space>",
        [[<C-\><C-n>:lua _G.get_search_line()<CR>:lua _G.toggle_buscar_master()<CR>:lua _G.toggle_clear()<CR>]],
        { noremap = true, silent = true}
    )
    vim.cmd("startinsert")

end
function _G.off_light()
    vim.api.nvim_win_close(input_win_id, true)
    vim.fn.feedkeys(":noh\n","n")
end
_G.pal_buscar = "def" 
function _G.get_search_line()
        local line = vim.api.nvim_get_current_line()
        local input = line:gsub("^Buscar:%s*", "")
        pal_buscar = input 
        vim.api.nvim_win_close(input_win_id, true)
        -- Elimina el buffer completamente para que no quede “Palabra” abierto
        if input_var1 and vim.api.nvim_buf_is_valid(input_var1) then
        vim.api.nvim_buf_delete(input_var1, { force = true })
        end       
        vim.fn.feedkeys("/\\c" .. vim.fn.escape(input, "/\\") .. "\\zs\n", "n")
end
function _G.get_search_prev()
    vim.fn.feedkeys("?\\c" .. vim.fn.escape(pal_buscar, "/\\") .. "\\zs\n", "n")
end
 
vim.api.nvim_set_keymap("n", "h", ":lua _G.input_buscador()<CR>" ,{ noremap = true, silent= true})
 
  
function _G.auto_search_line()
  local palabra = vim.fn.expand("<cword>")  -- obtiene la palabra bajo el cursor
  vim.fn.feedkeys("/" .. palabra .. "\n", "n")
end

vim.api.nvim_set_keymap("n", "vt", ":lua _G.auto_search_line()<CR>", { noremap = true, silent = true })
