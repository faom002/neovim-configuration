-- Load Packer
vim.cmd([[packadd packer.nvim]])
local packer = require("packer")

-- Start defining plugins
return packer.startup(function(use)
    -- Packer itself
    use("wbthomason/packer.nvim")

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    -- LSP and related plugins
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
    })

    -- Git integration with Fugitive
    use("tpope/vim-fugitive")

    -- Visualize undo history
    use("mbbill/undotree")

    -- Cloak for hiding sensitive information
    use("laytan/cloak.nvim")

    -- Zen mode for distraction-free writing
    use("folke/zen-mode.nvim")

    -- Trouble for a quick overview of diagnostics
    use("folke/trouble.nvim")

    -- Statusline with Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Cellular automaton for a creative touch
    use('eandrju/cellular-automaton.nvim')

    -- Nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
    }

    -- theme jetbrain
    use 'ayu-theme/ayu-vim'
    -- FTerm for a toggleable terminal
    use("numToStr/FTerm.nvim")

    -- Neorg for note-taking
    use {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                },
            }
        end,
        run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim",
    }

    -- DAP for debugging
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- Formatter
    use("stevearc/conform.nvim")


    -- icons for telescope
    use 'nvim-tree/nvim-web-devicons'



    -- Commenting plugin
    use('numToStr/Comment.nvim')
end)
