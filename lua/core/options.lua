local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 设置 C 语言格式缩进
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 主题
opt.termguicolors = true
opt.signcolumn = "yes"


-- 自动缩进和C语言缩进
vim.api.nvim_exec([[
    autocmd FileType * setlocal autoindent
    autocmd FileType c,cpp setlocal cindent
]], false)
