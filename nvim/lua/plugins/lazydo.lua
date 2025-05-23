-- TODO: Make it work
-- TODO: Make it work with lualine
return {
  {
    "Dan7h3x/LazyDo",
    branch = "devel",
    cmd = {"LazyDoToggle","LazyDoPin","LazyDoToggleStorage"},
    keys = { -- recommended keymap for easy toggle LazyDo in normal and insert modes (arbitrary)
	    {
        "<F7>","<ESC><CMD>LazyDoToggle<CR>",
        mode = {"n","i"},
	    },
    },
    event = "VeryLazy",
    opts = {
   storage = {
    startup_detect = false, -- Enable auto-detection of projects on startup
    silent = false,         -- Disable notifications when switching storage mode
    global_path = nil,      -- Custom storage path (nil means use default)
    project = {
      enabled = false,
      use_git_root = true,
      auto_detect = false,                                                     -- Auto-detect project and switch storage mode
      markers = { ".git", ".lazydo", "package.json", "Cargo.toml", "go.mod" }, -- Project markers
    },
    auto_backup = false,
    -- backup_count = 1,
    compression = true,
    encryption = false,
  },
    },
  },
}
