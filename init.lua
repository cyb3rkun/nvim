require("Cyb3rVim")
package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/?.lua"
require("lazy_init")
