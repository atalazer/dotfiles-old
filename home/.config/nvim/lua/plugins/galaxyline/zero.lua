vim.cmd([[packadd galaxyline.nvim]])
vim.cmd([[packadd nvim-web-devicons]])

local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')

local colors = require("base.colorscheme.xresources") or require("xresources")

-- =================================== Component
local separators = {
    "", " ", "·", " ● "
}
local sep = separators[2]

local FirstElement = {
    RainbowRed = {
        provider = function() return '▊ ' end,
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.blue,colors.bg}
    },
}
local LastElement = {
    RainbowBlue = {
        provider = function() return ' ▊' end,
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.blue,colors.bg}
    },
}

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
                n     = colors.purple       , i       = colors.green        ,
                v     = colors.blue         , ['']  = colors.blue         ,
                V     = colors.blue         , c       = colors.red          ,
                no    = colors.purple       , s       = colors.yellow       ,
                S     = colors.yellow       , ['']  = colors.yellow       ,
                ic    = colors.yellow       , R       = colors.light_purple ,
                Rv    = colors.light_purple , cv      = colors.red          ,
                ce    = colors.red          , r       = colors.cyan         ,
                rm    = colors.cyan         , ['r?']  = colors.cyan         ,
                ['!'] = colors.red          , t       = colors.red
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
local FileName = {
    FileName = {
        provider = {'FileName'},
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
        condition = buffer_not_empty,
        highlight = {colors.green,colors.bg,'bold'}
    }
}
local FileIcon ={
    FileIcon = {
        provider = 'FileIcon',
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
        condition = buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
    },
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
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.blue,colors.bg,'bold'}
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
        highlight = {colors.green,colors.bg},
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
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
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
    }
}

local DiagnosticHint = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.cyan,colors.bg},
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
    }
}
local DiagnosticInfo = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue,colors.bg},
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
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
    icon = '   LSP: ',
    highlight = {colors.cyan,colors.bg,'bold'}
  }
}
-- ------------------------------------ Git Component
local GitIcon = {
    GitIcon = {
        provider = function() return ' ' end,
        condition = require('galaxyline.provider_vcs').check_git_workspace,
        highlight = {colors.light_purple,colors.bg,'bold'},
        separator = sep,
        separator_highlight = {'NONE',colors.bg},
    }
}
local GitBranch = {
    GitBranch = {
        provider = 'GitBranch',
        condition = require('galaxyline.provider_vcs').check_git_workspace,
        highlight = {colors.light_purple,colors.bg,'bold'},
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
        highlight = {colors.yellow,colors.bg},
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
    'LuaTree',
    'startify',
    'term',
    'packer'
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}

-- ========================= Setup
-- Left
local LeftSide = function()
    local components = {
        FirstElement,
        Mode,
        FileName, FileSize,
        GitIcon, GitBranch, DiffAdd, DiffModified, DiffRemove,
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
        ShowLspClient,
    }
    for i,_ in ipairs(components) do
        gls.mid[i] = components[i]
    end
end
-- Right
local RightSide = function()
    local components = {
        FileType,
        FileIcon,
        LineColumn, LinePercent,
        ScrollBar,
        LastElement
    }
    for i,_ in ipairs(components) do
        gls.right[i] = components[i]
    end
end

LeftSide()
-- Middle()
RightSide()

