vim.cmd([[packadd curstr.nvim]])

require("curstr").setup({
    source_aliases = {
        swagger = {
            names = {"file/search"},
            opts = {
                source_pattern = "\\v^([^#]*)#(\\/[^/]*)*(\\w+)$",
                result_pattern = "\\1",
                search_pattern = "\\3:",
            },
            filetypes = {"yaml"},
        },
        openable = {names = {"vim/function", "lua", "file", "directory", "swagger", "vim/runtime"}},

        camel_snake = {
            names = { "togglable/pattern" },
            opts = { patterns = { { "\\v_(.)", "\\u\\1" }, { "\\v\\C([A-Z])", "_\\l\\1" } } },
            filetypes = { "lua", "bash" },
        },
        booltf = {
            names = { "togglable/word" },
            opts = { words = { "true", "false" }, normalized = true },
        },
        boolnf = {
            names = { "togglable/word" },
            opts = { words = { "on", "off" }, normalized = true },
        },
        boolnum = {
            names = { "togglable/word" },
            opts = { words = { "1", "0" }, normalized = true },
        },
        booled = {
            names = { "togglable/word" },
            opts = { words = { "enable", "disable" }, normalized = true },
        },
        tptobt = {
            names = { "togglable/word" },
            opts = { words = { "top", "bottom" }, normalized = true },
        },
        lftorg = {
            names = { "togglable/word" },
            opts = { words = { "left", "right" }, normalized = true },
        },
        togglable = {
            names = {
                "booltf", "boolnf",
                "boolnum", "booled",
                "lftorg", "tptobt",
                "camel_snake",
            },
        },

        print_vim = {
            names = {"togglable/pattern"},
            opts = {patterns = {{"\\v^(\\s*)let\\s+([^=[:space:]]*).*$", "\\1echomsg string(\\2)"}}},
            filetypes = {"vim"},
        },
        print_go = {
            names = {"togglable/pattern"},
            opts = {patterns = {{"\\v^(\\s*)([^=[:space:],]*).*$", "\\1fmt.Println(\\2)"}}},
            filetypes = {"go"},
        },
        print_python = {
            names = {"togglable/pattern"},
            opts = {patterns = {{"\\v^(\\s*)([^=[:space:],]*).*$", "\\1print(\\2)"}}},
            filetypes = {"python"},
        },
        print_js = {
            names = {"togglable/pattern"},
            opts = {
                patterns = {{"\\v^(\\s*)(let\\s+|const\\s+)?([^=[:space:],]*).*$", "\\1console.log(\\3)"}},
            },
            filetypes = {"javascript"},
        },
        print_ts = {
            names = {"togglable/pattern"},
            opts = {
                patterns = {{"\\v^(\\s*)(let\\s+|const\\s+)?([^=[:space:],:]*).*$", "\\1console.log(\\3)"}},
            },
            filetypes = {"typescript"},
        },
        print_rust = {
            names = {"togglable/pattern"},
            opts = {
                patterns = {
                    {"\\v^(\\s*)let\\s+(mut\\s+)?([^=[:space:],:]*).*$", "\\1println!(\"{:?}\", \\3);"},
                },
            },
            filetypes = {"rust"},
        },
        print_lua = {
            names = {"togglable/pattern"},
            opts = {
                patterns = {{"\\v^(\\s*)(local\\s+)?([^=[:space:],]*).*$", "\\1print(vim.inspect(\\3))"}},
            },
            filetypes = {"lua"},
        },
        print_dart = {
            names = {"togglable/pattern"},
            opts = {
                patterns = {
                    {"\\v^(\\s*)(var\\s+|const\\s+|final\\s+)?([^=[:space:],:]*).*$", "\\1print(\\3);"},
                },
            },
            filetypes = {"dart"},
        },
        print = {
            names = {
                "print_vim",
                "print_go",
                "print_python",
                "print_js",
                "print_ts",
                "print_rust",
                "print_lua",
                "print_dart",
            },
            opts = {is_line = true},
        },
    },
    sources = {
        ["vim/autoload_function"] = {
            opts = {include_packpath = true},
            filetypes = {"vim", "python", "lua"},
        },
    },
})

-- # Mappings
nnoremap({ "gf", "<Cmd>Curstr openable -action=open<CR>" })
nnoremap({ "gfg", "<Cmd>Curstr openable -action=vertical_open<CR>" })
nnoremap({ "gff", "<Cmd>Curstr openable -action=horizontal_open<CR>" })
nnoremap({ "<leader>,", "<Cmd>Curstr togglable<CR>" })
nnoremap({ "gp", "<Cmd>Curstr print -action=append<CR>" })

