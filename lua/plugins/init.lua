return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "typescript-language-server",
        "pyright",
        "rust-analyzer",
        "gopls",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "yaml-language-server",
        "tailwindcss-language-server",
        "prettier",
        "stylua",
        "black",
        "isort",
        "gofumpt",
        "shfmt",
        "debugpy",
        "delve",
        "js-debug-adapter",
        "codelldb",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css", "javascript", "typescript",
        "tsx", "json", "yaml", "toml", "markdown", "markdown_inline",
        "python", "rust", "go", "c", "cpp", "bash", "dockerfile",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
          },
        },
      }
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "right",
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<Tab>",
            accept_word = "<C-Right>",
            accept_line = "<C-Down>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = false,
          ["."] = false,
        },
        copilot_node_command = "node",
      }
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = { delay = 500 },
    },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup { timeout = 300, default_mappings = true }
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = true,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
  },

  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup {
        custom_textobjects = {
          a = false, -- defer to treesitter-textobjects for aa/ia
        },
      }
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      labels = "asdfghjklqwertyuiopzxcvbnm",
      search = { multi_window = true, forward = true, wrap = true },
      jump = { jumplist = true, pos = "start", autojump = false },
      label = { uppercase = false, rainbow = { enabled = false } },
      modes = {
        char = { enabled = true, jump_labels = true },
        search = { enabled = false },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup()
      vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add" })
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon 1" })
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon 2" })
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon 3" })
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon 4" })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope = { enabled = true, show_start = true },
    },
  },

  {
    "RRethy/vim-illuminate",
    event = "BufRead",
    config = function()
      require("illuminate").configure { delay = 200, under_cursor = true }
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufRead",
    opts = {
      user_default_options = {
        css = true,
        tailwind = true,
        mode = "virtualtext",
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      spec = {
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>a", group = "ai" },
        { "<leader>x", group = "trouble" },
        { "<leader>h", group = "harpoon" },
        { "<leader>q", group = "session" },
        { "<leader>s", group = "search" },
        { "<leader>c", group = "code" },
        { "<leader>t", group = "test/tree" },
        { "<leader>r", group = "refactor" },
        { "<leader>b", group = "buffer" },
        { "<leader>d", group = "debug" },
      },
    },
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
    },
    opts = {},
  },

  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup {
        mappings = { "<C-b>", "<C-f>", "zt", "zz", "zb" },
        hide_cursor = true,
        easing = "quadratic",
      }
    end,
  },

  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {
      default_file_explorer = false,
      view_options = { show_hidden = true },
    },
  },

  {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" },
  },

  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
      { "<leader>sr", '<cmd>lua require("spectre").open()<CR>', desc = "Search and Replace" },
    },
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    keys = {
      { "<leader>qs", '<cmd>lua require("persistence").load()<CR>', desc = "Restore Session" },
      { "<leader>ql", '<cmd>lua require("persistence").load({ last = true })<CR>', desc = "Restore Last Session" },
    },
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
      },
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input "Condition: ") end, desc = "Conditional breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue / Start" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step out" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run last" },
      { "<leader>dk", function() require("dapui").eval() end, desc = "Eval under cursor" },
      { "<leader>dk", mode = "v", function() require("dapui").eval() end, desc = "Eval selection" },
    },
    config = function()
      require "configs.dap"
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-go",
      "rouge8/neotest-rust",
    },
    keys = {
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>tT", function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run file tests" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle summary" },
      { "<leader>to", function() require("neotest").output.open { enter_window = true } end, desc = "Show output" },
      { "<leader>tp", function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run last test" },
      { "<leader>td", function() require("neotest").run.run { strategy = "dap" } end, desc = "Debug nearest test" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop test" },
    },
    config = function()
      require "configs.neotest"
    end,
  },

  {
    "stevearc/aerial.nvim",
    event = "BufRead",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Toggle code outline" },
      { "{", function() require("aerial").prev() end, desc = "Previous symbol" },
      { "}", function() require("aerial").next() end, desc = "Next symbol" },
    },
    opts = {
      backends = { "treesitter", "lsp", "markdown", "man" },
      layout = {
        min_width = 30,
        max_width = 40,
        default_direction = "right",
        placement = "edge",
      },
      show_guides = true,
      guides = {
        mid_item = "├─",
        last_item = "└─",
        nested_top = "│ ",
        whitespace = "  ",
      },
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        "Struct",
        "Type",
      },
      highlight_on_hover = true,
      autojump = true,
      close_on_select = false,
      attach_mode = "global",
      lsp = {
        diagnostics_trigger_update = true,
      },
    },
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>re", mode = "v", function() require("refactoring").refactor "Extract Function" end, desc = "Extract function" },
      { "<leader>rf", mode = "v", function() require("refactoring").refactor "Extract Function To File" end, desc = "Extract function to file" },
      { "<leader>rv", mode = "v", function() require("refactoring").refactor "Extract Variable" end, desc = "Extract variable" },
      { "<leader>ri", mode = { "n", "v" }, function() require("refactoring").refactor "Inline Variable" end, desc = "Inline variable" },
      { "<leader>rb", function() require("refactoring").refactor "Extract Block" end, desc = "Extract block" },
      { "<leader>rB", function() require("refactoring").refactor "Extract Block To File" end, desc = "Extract block to file" },
      { "<leader>rr", mode = "v", function() require("refactoring").select_refactor() end, desc = "Select refactor" },
    },
    config = true,
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require "notify"
      notify.setup {
        stages = "fade_in_slide_out",
        timeout = 3000,
        fps = 60,
        render = "compact",
        max_height = function()
          return math.floor(vim.o.lines * 0.5)
        end,
        max_width = function()
          return math.floor(vim.o.columns * 0.4)
        end,
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { zindex = 100 })
        end,
      }
      vim.notify = notify
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle zen mode" },
    },
    dependencies = {
      {
        "folke/twilight.nvim",
        opts = {
          dimming = { alpha = 0.4 },
          context = 15,
        },
      },
    },
    opts = {
      window = {
        backdrop = 1,
        width = 90,
        height = 0.9,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
      },
    },
  },
}
