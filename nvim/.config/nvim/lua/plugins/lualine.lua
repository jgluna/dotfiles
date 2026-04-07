local filetype = { "filetype", icon_only = true }

local macro_recording = {
  function()
    local reg = vim.fn.reg_recording()
    if reg == "" then
      return ""
    end
    return "recording @" .. reg
  end,
}

local lsp_status = {
  "lsp_status",
  icon = "", -- f013
  symbols = {
    spinner = { "", "", "", "", "", "", "", "", "", "", "", "", "" },
    done = false,
    separator = " ",
  },
  -- List of LSP names to ignore (e.g., `null-ls`):
  ignore_lsp = {},
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = {
    error = " ",
    hint = " ",
    info = " ",
    warn = " ",
  },
  colored = true,
  update_in_insert = false,
  always_visible = false,
}

local diff = {
  "diff",
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,
  symbols = {
    added = "" .. " ",
    modified = "" .. " ",
    removed = "" .. " ",
  },
  colored = true,
  always_visible = false,
}

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'catppuccin/nvim' },
    opts ={
  options = {
    theme = "catppuccin",
    globalstatus = true,
    section_separators = "",
    component_separators = "",
    disabled_filetypes = { "mason", "lazy", "NvimTree" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { macro_recording },
    lualine_c = { "filename", lsp_status},
    lualine_x = { diff, diagnostics, filetype },
    lualine_y = {},
    lualine_z = {"location","searchcount"},
  },

    }
}
