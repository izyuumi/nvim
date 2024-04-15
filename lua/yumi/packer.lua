vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

   use {
     "nvim-telescope/telescope.nvim", tag = "0.1.6",
     requires = {{ "nvim-lua/plenary.nvim" }}
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
end)

