require('competitest').setup()-- to customize settings


local keyset = vim.keymap.set
keyset('n', '<C-1>', ':CompetiTest add_testcase<CR>')
keyset('n', '<C-2>', ':CompetiTest run<CR>')

-- 函数：删除当前目录下所有的.txt文件和可执行文件
function deleteFilesAndcpp()
    local current_dir = vim.fn.getcwd() -- 获取当前工作目录
    local cmd_1
    cmd_1 = "rm " .. current_dir .. "/*.txt "  
    vim.cmd("silent !".. cmd_1)

    -- 获取当前目录下的所有.cpp文件  
    local cpp_files = {}  
    for line in io.popen("find . -maxdepth 1 -name '*.cpp'"):lines() do  
        table.insert(cpp_files, line)  
    end  
  
    -- 遍历所有的.cpp文件  
    for _, cpp_file in ipairs(cpp_files) do  
        -- 提取基本文件名（不带扩展名）  
        local base_name = string.match(cpp_file, "(.-)%.cpp")  
        -- 构建可执行文件的路径（假设可执行文件在当前目录下）  
        local executable_path = base_name  
        -- 检查可执行文件是否存在  
        local file_exists = os.execute("test -f " .. executable_path) == 0  
        -- 如果存在，则删除它  
        if file_exists then  
            os.execute("rm " .. executable_path)  
        end  
    end    
end
keyset('n', '<C-3>', ':lua deleteFilesAndcpp()<CR>', { noremap = true, silent = true })
keyset('n', '<C-4>', ':CompetiTest delete_testcase<CR>')

