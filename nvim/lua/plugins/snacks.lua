
return {
    "folke/snacks.nvim",
    priority = 1000,
    ---@type snacks.Config
    opts = {
        indent = {
            enable = true,
            indent = {
                enabled = true,
                hl = "SnacksIndent",
            },
            scope = {
                enabled = true, -- enable highlighting the current scope
                priority = 200,
                char = "│",
                underline = false,    -- underline the start of the scope
                only_current = false, -- only show scope in the current window
                hl = "SnacksDashboardKey", ---@type string|string[] hl group for scopes
            },
            chunk = {
                enabled = true,
                hl = "SnacksDashboardKey",
            },
        },
        dashboard = {
            enabled = true,
            sections = {
                { text = { { [[ __  __                                             ]], hl = "SnacksDashboardKey" }, }, indent = 4 },
                { text = { { [[/\ \/\ \                          __                ]], hl = "SnacksDashboardKey" }, }, indent = 4 },
                { text = { { [[\ \ `\\ \     __    ___   __  __ /\_\    ___ ___    ]], hl = "SnacksDashboardKey" }, }, indent = 4 },
                { text = { { [[ \ \ , ` \  /'__`\ / __`\/\ \/\ \\/\ \ /' __` __`\  ]], hl = "SnacksDashboardKey" }, }, indent = 4 },
                { text = { { [[  \ \ \`\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]], hl = "SnacksDashboardKey" }, }, indent = 4 },
                { text = { { [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]], hl = "SnacksDashboardKey" }, }, indent = 4 },
                { text = { { [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]], hl = "SnacksDashboardKey" }, }, indent = 4, padding = 2 },
                { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')", padding = 1 },
                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert", padding = 1 },
                { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')", padding = 1 },
                { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')", padding = 1 },
                { icon = " ", key = "c", desc = "Config", action = ":e $MYVIMRC | :cd %:p:h", padding = 1 },
                { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil, padding = 1 },
                { icon = " ", key = "q", desc = "Quit", action = ":qa", padding = 1 },
                { icon = " ", desc = "Browse Repo", padding = 1, key = "b", action = function() Snacks.gitbrowse() end, },
                function()
                    local in_git = Snacks.git.get_root() ~= nil
                    local cmds = {
                        {
                            title = "Open Issues",
                            cmd = "gh issue list -L 3",
                            key = "i",
                            action = function()
                                vim.fn.jobstart("gh issue list --web", { detach = true })
                            end,
                            icon = " ",
                            height = 7,
                        },
                        {
                            icon = " ",
                            title = "Open PRs",
                            cmd = "gh pr list -L 3",
                            key = "P",
                            action = function()
                                vim.fn.jobstart("gh pr list --web", { detach = true })
                            end,
                            height = 7,
                        },
                        {
                            icon = " ",
                            title = "Git Status",
                            cmd = "git --no-pager diff --stat -B -M -C",
                            height = 10,
                        },
                    }
                    return vim.tbl_map(function(cmd)
                        return vim.tbl_extend("force", {
                            pane = 2,
                            section = "terminal",
                            enabled = in_git,
                            padding = 1,
                            ttl = 5 * 60,
                            indent = 3,
                        }, cmd)
                    end, cmds)
                end,
                { section = "startup" },
            },
        }
    }
}


