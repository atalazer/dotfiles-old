vim.cmd[[packadd curstr.nvim]]

local custom = require("curstr/custom")

custom.source_aliases.booltf = {
  names = {"togglable/word"},
  opts = {words = {"true", "false"}, normalized = true},
}
custom.source_aliases.boolnf = {
  names = {"togglable/word"},
  opts = {words = {"on", "off"}, normalized = true},
}

