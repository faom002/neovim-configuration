vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "neovim/nvim-lspconfig" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        },
    })
    use("tpope/vim-fugitive")
    use("mbbill/undotree")
    use("laytan/cloak.nvim")
    use("folke/zen-mode.nvim")
    use("folke/trouble.nvim")
    use('doums/darcula')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'eandrju/cellular-automaton.nvim'


    -- themes
    use { "ellisonleao/gruvbox.nvim" }
    use 'folke/tokyonight.nvim'

    -- togglemodal
    use "numToStr/FTerm.nvim"




    -- Debugging
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- formatter
    use("stevearc/conform.nvim")

    use 'numToStr/Comment.nvim'
end)