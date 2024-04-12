require('competitest').setup()-- to customize settings


local keyset = vim.keymap.set
keyset('n', '<C-1>', ':CompetiTest add_testcase<CR>')
keyset('n', '<C-2>', ':CompetiTest run<CR>')

-- 函数：删除当前目录下所有的.txt文件和可执行文件
function deleteFiles()
    local current_dir = vim.fn.getcwd() -- 获取当前工作目录
    local cmd_1
    cmd_1 = "rm " .. current_dir .. "/*.txt "  
    vim.cmd("silent !".. cmd_1)
end
keyset('n', '<C-3>', ':lua deleteFiles()<CR>', { noremap = true, silent = true })
keyset('n', '<C-4>', ':CompetiTest delete_testcase<CR>')

