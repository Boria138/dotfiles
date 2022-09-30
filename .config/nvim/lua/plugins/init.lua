local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

require('packer').startup(function(use)

		-- Package manager
		use 'wbthomason/packer.nvim'

		-- Plenary
		use'nvim-lua/plenary.nvim'

			-- Theme inspired by Atom
			use {
				'navarasu/onedark.nvim',
				config = function()
					require('plugins.onedark')
				end
			}

		-- Treesitter
      use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require('plugins.treesitter')
      end
    }

		-- Icons
    use {
      'kyazdani42/nvim-web-devicons',
      config = function()
        require('nvim-web-devicons').setup({ default = true; })
      end
    }

		-- Statusline
    use {
      'nvim-lualine/lualine.nvim',
      config = function()
        require('plugins.lualine')
      end
    }

		-- Commentary
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

		-- Colorizer
    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('plugins.nvim-colorizer')
      end
    }

		-- BuferLine
    use 'romgrk/barbar.nvim'

		--Dashboard
		use {
			'goolord/alpha-nvim',
			config = function()
				require('plugins.alpha-nvim')
			end
		}

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }

  -- File explorer
  use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-telescope/telescope-file-browser.nvim'
		},
		config = function()
			require('plugins.telescope-nvim')
		end
	}

	-- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets'
    },
		config = function()
			require('plugins.lsp')
		end
  }

	-- Formats
	use {
		'jose-elias-alvarez/null-ls.nvim',
		config = function ()
			require('plugins.null-ls')
		end
	}
	use {
		'MunifTanjim/prettier.nvim',
		config = function ()
			require("prettier").setup()
		end
	}

	-- Matchtag
	use 'leafOfTree/vim-matchtag'


	if install_plugins then
		require('packer').sync()
  end
end)


