vim.cmd([[packadd galaxyline.nvim]])
vim.cmd([[packadd nvim-web-devicons]])

local gl = require('galaxyline')
local gls = gl.section
local extension = require('galaxyline.provider_extensions')

local colors = {
    bg        = '282c34',
    line_bg   = '7D0AB2',
    fg        = '#8FBCBB',
    NameColor = '#5B4B70',
    fg_green  = '#65a380',
    cocColor  = '#1592A5',
    yellow    = '#fabd2f',
    cyan      = '#008080',
    darkblue  = '#081633',
    green     = '#AB47BC',
    orange    = '#FF8800',
    purple    = '#5d4d7a',
    magenta   = '#c678dd',
    blue      = '#51afef';
    red       = '#ec5f67'
}

-- =================================== Component
local separators = {
    "", " ", "·", " ● "
}
local sep = separators[2]

-- --------------------------------- Vim Mode Component
local vim_mode = function()
    local mode = {
        n     = " Normal"  , no = "  Normal-P" ,
        i     = " Insert"  , ic = " Insert"     ,
        v     = " Visual"  , V  = " Visual-L"   , [''] = " Visual-B" ,
        s     = " Select"  , S  = " Select-L"   , ["^S"] = " Select-B" ,
        c     = " Command" , cv = " Vim-Ex"     , ce     = " Ex"       ,
        r     = " Prompt"  , rm = " More"         , ["r?"] = " Confirm"  ,
        ["!"] = " Shell"   , t  = " Terminal"
    }
    -- return (mode[vim.fn.mode()] or ' '..vim.fn.mode()) .. sep
    return (mode[vim.fn.mode()] or ' '..vim.fn.mode()) .. sep
end
local Mode = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n     = colors.magenta  ,i       = colors.green     ,
                v     = colors.blue     ,['']  = colors.blue      ,
                V     = colors.blue     ,c       = colors.red       ,
                no    = colors.magenta  ,s       = colors.orange    ,
                S     = colors.orange   ,['']  = colors.orange    ,
                ic    = colors.yellow   ,R       = colors.violet    ,
                Rv    = colors.violet   ,cv      = colors.red       ,
                ce    = colors.red      ,r       = colors.cyan      ,
                rm    = colors.cyan     ,['r?']  = colors.cyan      ,
                ['!'] = colors.red      ,t       = colors.red
            }
            vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
            return vim_mode()
        end,
        highlight = {colors.red,colors.bg,'bold'},
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
    },
}

-- ------------------------------------ Fileinfo Component
-- Helpers
local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
    end
    return false
end
local LEFT = {
    BOOLNS = {
        provider = function()
        end,
        separator = '',
        condition = buffer_not_empty,
        separator_highlight = {colors.NameColor,colors.bg}
    }
}
local FileIcon ={
    FileIcon = {
        provider = 'FileIcon',
        icon = '',
        condition = buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.NameColor},
    },
}
local FileName = {
    FileName = {
        provider = {'FileName'},
        condition = buffer_not_empty,
        separator = ' ',
        separator_highlight = {colors.NameColor,colors.bg},
        highlight = {colors.fg,colors.NameColor,'bold'}
    }
}
local RIGHT = {
    BOOLNS = {
        provider = function()
        end,
        condition = buffer_not_empty,
        separator = '',
        separator_highlight = {colors.NameColor,colors.bg}
    }
}
local FileSize = {
    FileSize = {
        provider = 'FileSize',
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
        condition = buffer_not_empty,
        highlight = {colors.fg,colors.bg}
    }
}
local FileType = {
    BufferType = {
        provider = 'FileTypeName',
        condition = has_file_type,
        separator = '',
        separator_highlight = {colors.purple,colors.bg},
        highlight = {colors.fg,colors.purple}
    }
}
-- ----------------------------------- Line Component
local LineColumn = {
    LineInfo = {
        provider = 'LineColumn',
        highlight = {colors.fg,colors.bg},
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
    },
}
local LinePercent = {
    PerCent = {
        provider = 'LinePercent',
        highlight = {colors.fg,colors.bg,'bold'},
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
    }
}
local ScrollBar = {
    ScrollBar = {
        provider = 'ScrollBar',
        separator = ' ● ',
        separator_highlight = {colors.blue,colors.line_bg},
        highlight = {colors.yellow,colors.bg},
    }
}
local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return ' '
    else
        return nil
    end
end
TrailingSpace = trailing_whitespace
local TrailingWhiteSpace = {
    TrailingWhiteSpace = {
        provider = TrailingSpace,
        icon = '  ',
        highlight = {colors.yellow,colors.bg},
    }
}
local LeftEnd = {
    LeftEnd = {
        provider = function() return '' end,
        separator = ' ',
        separator_highlight = {colors.bg,colors.line_bg},
        highlight = {colors.line_bg,colors.line_bg}
    }
}

-- ----------------------------------------- Diagnostic Component
local DiagnosticError = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red,colors.bg}
    }
}
local DiagnosticWarn = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.yellow,colors.bg},
    }
}

local DiagnosticHint = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.cyan,colors.bg},
    }
}
local DiagnosticInfo = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue,colors.bg},
    }
}

local ShowLspClient = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function ()
            local tbl = {['startify'] = true,['NvimTree'] = true}
            if tbl[vim.bo.filetype] then
            return false
            end
            return true
        end,
        icon = '  LSP: ',
        highlight = {colors.cyan,colors.bg,'bold'}
    }
}
-- ------------------------------------ Git Component
local GitIcon = {
    GitIcon = {
        provider = function() return ' ﯙ ' end,
        condition = require('galaxyline.provider_vcs').check_git_workspace,
        highlight = {colors.orange,colors.line_bg},
    }
}
local GitBranch = {
    GitBranch = {
        provider = 'GitBranch',
        condition = require('galaxyline.provider_vcs').check_git_workspace,
        highlight = {'#8FBCBB',colors.line_bg,'bold'},
    }
}

-- Helpers
local checkwidth = function()
    local squeeze_width  = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
    return true
    end
    return false
end

local DiffAdd = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = '  ',
        highlight = {colors.green,colors.bg},
    }
}
local DiffModified = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = ' 柳',
        highlight = {colors.orange,colors.bg},
    }
}
local DiffRemove = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = '  ',
        highlight = {colors.red,colors.bg},
    }
}

-- ========================= Short Line
gl.short_line_list = {
    'NvimTree',
    'packer'
}
gls.short_line_left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local alias = {
                n = '▋ ',
                i = '▋ ',
                c= '▋ ',
                V= '▋ ',
                [''] = '▋ ',
                v ='▋ ',
                c  = '▋ ',
                ['r?'] = '▋ ',
                rm = '▋ ',
                R  = '▋ ',
                Rv = '▋ ',
                s  = '▋ ',
                S  = '▋ ',
                ['r']  = '▋ ',
                [''] = '▋ ',
                t  = '▋ ',
                ['!']  = '▋ ',
            }
            local mode_color = {
                n = colors.green,
                i = colors.blue,v=colors.magenta,[''] = colors.blue,V=colors.blue,
                c = colors.red,no = colors.magenta,s = colors.orange,S=colors.orange,
                [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
                cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
                ['!']  = colors.green,t = colors.green,
                c  = colors.purple,
                ['r?'] = colors.red,
                ['r']  = colors.red,
                rm = colors.red,
                R  = colors.yellow,
                Rv = colors.magenta,
            }
            local vim_mode = vim.fn.mode()
            vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
            return alias[vim_mode] .. '  '
        end,
        highlight = {colors.red,colors.line_bg,'bold'},
    },
}
gls.short_line_left[2] = {
    BOOLNS = {
        provider = function()
        end,
        separator = '',
        condition = buffer_not_empty,
        separator_highlight = {colors.NameColor,colors.bg}
    }
}
function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end
gls.short_line_left[3] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = '',
        condition = has_file_type,
        separator_highlight = {colors.purple,colors.bg},
        highlight = {colors.fg,colors.purple}
    }
}
gls.short_line_right[1] = {
    BufferIcon = {
        provider= 'BufferIcon',
        separator = '',
        condition = has_file_type,
        separator_highlight = {colors.purple,colors.bg},
        highlight = {colors.fg,colors.purple}
    }
}
-- ========================= Setup
-- Left
local LeftSide = function()
    local components = {
        Mode,
        LEFT,
        FileIcon,
        FileName,
        -- RIGHT,
        FileSize,
        GitIcon, GitBranch, DiffAdd, DiffModified, DiffRemove,
        TrailingWhiteSpace, LeftEnd,
        DiagnosticHint, DiagnosticInfo,
        DiagnosticError, DiagnosticWarn,
    }
    for i,_ in ipairs(components) do
        gls.left[i] = components[i]
    end
end
-- Middle
local Middle = function()
    local components = {
        DiagnosticHint, DiagnosticInfo,
        ShowLspClient,
        DiagnosticError, DiagnosticWarn
    }
    for i,_ in ipairs(components) do
        gls.mid[i] = components[i]
    end
end
-- Right
local RightSide = function()
    local components = {
        FileType,
        RIGHT,
        -- FileIcon,
        LineColumn,
        LinePercent,
        -- ScrollBar,
    }
    for i,_ in ipairs(components) do
        gls.right[i] = components[i]
    end
end

LeftSide()
-- Middle()
RightSide()

