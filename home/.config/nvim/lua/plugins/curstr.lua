vim.cmd([[packadd curstr.nvim]])

local custom = require("curstr.custom")

-- ToC
-- # Configuration
--  - openable
--  - togglable
--  - print
-- # Mappings

-- # Configuration
custom.source_aliases.swagger = {
    names = { "file/search" },
    opts = {
        source_pattern = "\\v^([^#]*)#(\\/[^/]*)*(\\w+)$",
        result_pattern = "\\1",
        search_pattern = "\\3:",
    },
    filetypes = { "yaml" },
}

custom.sources["vim/autoload_function"] = {
    opts = { include_packpath = true },
    filetypes = { "vim", "python", "lua" },
}

custom.source_aliases.openable = {
    names = {
        "vim/function",
        "lua",
        "file",
        "directory",
        "swagger",
        "vim/runtime",
    },
}

custom.source_aliases.camel_snake = {
    names = { "togglable/pattern" },
    opts = { patterns = { { "\\v_(.)", "\\u\\1" }, { "\\v\\C([A-Z])", "_\\l\\1" } } },
    filetypes = { "lua", "bash" },
}

custom.source_aliases.booltf = {
    names = { "togglable/word" },
    opts = { words = { "true", "false" }, normalized = true },
}
custom.source_aliases.boolnf = {
    names = { "togglable/word" },
    opts = { words = { "on", "off" }, normalized = true },
}
custom.source_aliases.boolnum = {
    names = { "togglable/word" },
    opts = { words = { "1", "0" }, normalized = true },
}
custom.source_aliases.booled = {
    names = { "togglable/word" },
    opts = { words = { "enable", "disable" }, normalized = true },
}
custom.source_aliases.tptobt = {
    names = { "togglable/word" },
    opts = { words = { "top", "bottom" }, normalized = true },
}
custom.source_aliases.lftorg = {
    names = { "togglable/word" },
    opts = { words = { "left", "right" }, normalized = true },
}

custom.source_aliases.togglable = {
    names = {
        "booltf",
        "boolnf",
        "boolnum",
        "booled",
        "lftorg",
        "tptobt",
        "camel_snake",
    },
}

custom.source_aliases.print_vim = {
    names = { "togglable/pattern" },
    opts = {
        patterns = { { "\\v^(\\s*)let\\s+([^=[:space:]]*).*$", "\\1echomsg string(\\2)" } }, 
    },
    filetypes = { "vim" },
}

custom.source_aliases.print_go = {
    names = { "togglable/pattern" },
    opts = { patterns = { { "\\v^(\\s*)([^=[:space:],]*).*$", "\\1fmt.Println(\\2)" } } },
    filetypes = { "go" },
}

custom.source_aliases.print_python = {
    names = { "togglable/pattern" },
    opts = { patterns = { { "\\v^(\\s*)([^=[:space:],]*).*$", "\\1print(\\2)" } } },
    filetypes = { "python" },
}

custom.source_aliases.print_js = {
    names = { "togglable/pattern" },
    opts = {
        patterns = {
            { "\\v^(\\s*)(let\\s+|const\\s+)?([^=[:space:],]*).*$", "\\1console.log(\\3)" }, 
        },
    },
    filetypes = { "javascript" },
}

custom.source_aliases.print_ts = {
    names = { "togglable/pattern" },
    opts = {
        patterns = {
            { "\\v^(\\s*)(let\\s+|const\\s+)?([^=[:space:],:]*).*$", "\\1console.log(\\3)" }, 
        },
    },
    filetypes = { "typescript" },
}

custom.source_aliases.print_rust = {
    names = { "togglable/pattern" },
    opts = {
        patterns = {
            {
                "\\v^(\\s*)let\\s+(mut\\s+)?([^=[:space:],:]*).*$",
                "\\1println!(\"{:?}\", \\3);",
            },
        },
    },
    filetypes = { "rust" },
}

custom.source_aliases.print_lua = {
    names = { "togglable/pattern" },
    opts = {
        patterns = { { "\\v^(\\s*)(local\\s+)?([^=[:space:],]*).*$", "\\1print(vim.inspect(\\3))" } },
    },
    filetypes = { "lua" },
}

custom.source_aliases.print = {
    names = {
        "print_vim",
        "print_go",
        "print_python",
        "print_js",
        "print_ts",
        "print_rust",
        "print_lua",
    },
    opts = { is_line = true },
}

-- # Mappings
nnoremap({ "gf", "<Cmd>Curstr openable -action=open<CR>" })
nnoremap({ "gfg", "<Cmd>Curstr openable -action=vertical_open<CR>" })
nnoremap({ "gff", "<Cmd>Curstr openable -action=horizontal_open<CR>" })
nnoremap({ "<leader>,", "<Cmd>Curstr togglable<CR>" })
nnoremap({ "gp", "<Cmd>Curstr print -action=append<CR>" })
