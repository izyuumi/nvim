vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

   use {
		 "nvim-telescope/telescope.nvim",
		 tag = "0.1.6",
		 requires = {{ "nvim-lua/plenary.nvim" }},
		 config = function()
			 require("telescope").setup{
				 defaults = {
					 file_ignore_patterns = {
						 "node_modules",
						 "target",
					 }
				 }
			 }
		 end

   }

   use ({
     "rose-pine/neovim",
     as = "rose-pine",
     config = function()
       vim.cmd("colorscheme rose-pine")
     end
   })

   use (
     "nvim-treesitter/nvim-treesitter",
     {
       run = ":TSUpdate"
     }
   )

   use "mbbill/undotree"

   use {
     'VonHeikemen/lsp-zero.nvim',
     branch = 'v2.x',
     requires = {
       {'neovim/nvim-lspconfig'},             -- Required
       {'williamboman/mason.nvim'},           -- Optional
       {'williamboman/mason-lspconfig.nvim'}, -- Optional

       -- Autocompletion
       {'hrsh7th/nvim-cmp'},     -- Required
       {'hrsh7th/cmp-nvim-lsp'}, -- Required
       {'L3MON4D3/LuaSnip'},     -- Required
     }
   }

 	use 'voldikss/vim-floaterm'

 	use {
 		"nvim-tree/nvim-tree.lua",
 		requires = {
 			"nvim-tree/nvim-web-devicons"
 		}
 	}

   use {
     "lewis6991/gitsigns.nvim"
   }

   use 'andweeb/presence.nvim'

 	use {'neoclide/coc.nvim', branch = 'release'}

 	use {
     'numToStr/Comment.nvim',
     config = function()
     	require('Comment').setup({
 				toggler = {
 					line = "<leader>/",
 				}
 			})
     end
 	}

 	use {
 		'akinsho/bufferline.nvim',
 		tag = "*",
 		requires = 'nvim-tree/nvim-web-devicons',
 	}

 	use {
     'goolord/alpha-nvim',
     config = function ()
         require'alpha'.setup(require'alpha.themes.dashboard'.config)
     end
 	}

	use "Shatur/neovim-session-manager"

	use {
		"elentok/format-on-save.nvim",
		config = function()
			local formatters = require("format-on-save.formatters")
			local vim_notify = require("format-on-save.error-notifiers.vim-notify")
			require("format-on-save").setup({
				error_notifier = vim_notify,
				exclude_path_patterns = {
					"/node_modules/",
					"/target/"
				},
				formatter_by_ft = {
					  rust = formatters.lsp,
						lua = formatters.lsp,
						yaml = formatters.lsp,
				},
				fallback_formatter = {
					formatters.remove_trailing_whitespace,
					formatters.remove_trailing_newlines,
					formatters.prettierd,
				},
			})
		end
	}
end)


