return {
  {
    "SirVer/ultisnips",
    config = function()
      vim.cmd([[
       let g:UltiSnipsExpandTrigger = '<Tab>'
       let g:UltiSnipsJumpForwardTrigger = '<Tab>'
       let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
      ]])
    end,
  },
  {
    "lervag/vimtex",
    config = function()
      vim.cmd([[
        let g:tex_flavor='latex'
        let g:vimtex_view_method='zathura'
        let g:vimtex_quickfix_mode=0
        set conceallevel=1
        let g:tex_conceal='abdmg'
        let g:vimtex_view_general_viewer = 'preview'
      ]])
    end,
  },
  {
    "quangnguyen30192/cmp-nvim-ultisnips",
    config = function()
      -- optional call to setup (see customization section)
      require("cmp_nvim_ultisnips").setup({
        filetype_source = "ultisnips_default",
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",

    requires = {
      "quangnguyen30192/cmp-nvim-ultisnips",
      config = function()
        -- optional call to setup (see customization section)
        require("cmp_nvim_ultisnips").setup({})
      end,
      -- If you want to enable filetype detection based on treesitter:
      -- requires = { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      local cmp = require("cmp")
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "ultisnips" },
        }),
      })
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
