require("neotest").setup {
  icons = {
    failed = "✗",
    passed = "✓",
    running = "⟳",
    skipped = "○",
    unknown = "?",
  },
  floating = {
    border = "rounded",
    max_height = 0.8,
    max_width = 0.8,
  },
  summary = {
    animated = true,
    open = "botright vsplit | vertical resize 50",
  },
  output = {
    open_on_run = false,
  },
  quickfix = {
    open = false,
  },
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = false },
      runner = "pytest",
      args = { "-vv", "--tb=short" },
    },
    require "neotest-jest" {
      jestCommand = "npx jest",
      jestConfigFile = function(file)
        if string.find(file, "/packages/") then
          return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
        end
        return vim.fn.getcwd() .. "/jest.config.ts"
      end,
      cwd = function()
        return vim.fn.getcwd()
      end,
    },
    require "neotest-go" {
      args = { "-v", "-race", "-count=1" },
    },
    require "neotest-rust" {
      args = { "--no-capture" },
    },
  },
}
