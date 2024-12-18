-- quick tip, move your cursor over a link and press "gx" to open the link
-- in your browser
-- GITHUB: https://github.com/cyb3rkun/nvim
require("Cyb3rVim")
package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/?.lua"
require("lazy_init")
