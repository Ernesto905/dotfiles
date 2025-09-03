return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  cmd = "CopilotChat",
  opts = function()
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      model = "gpt-5",
      auto_insert_mode = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.5,
      },
      temperature = 1,
      providers = {
        copilot = {
          disabled = true,
        },
        openai = {
          get_url = function(opts) return "https://api.openai.com/v1/chat/completions" end,
          get_headers = function()
            return {
              ["Authorization"] = "Bearer " ..
                  os.getenv("OPENAI_API_KEY")
            }
          end,
          get_models = function() return { { id = "gpt-5", name = "GPT-5 model" } } end,
          prepare_input = require('CopilotChat.config.providers').copilot.prepare_input,
          prepare_output = require('CopilotChat.config.providers').copilot.prepare_output,
        }
      }
    }
  end,
  keys = {
    { "<c-s>",     "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
    { "<leader>a", "",     desc = "+ai",        mode = { "n", "v" } },
    {
      "<leader>aa",
      function()
        return require("CopilotChat").toggle()
      end,
      desc = "Toggle (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ax",
      function()
        return require("CopilotChat").reset()
      end,
      desc = "Clear (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>aq",
      function()
        vim.ui.input({
          prompt = "Quick Chat: ",
        }, function(input)
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end)
      end,
      desc = "Quick Chat (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ap",
      function()
        require("CopilotChat").select_prompt()
      end,
      desc = "Prompt Actions (CopilotChat)",
      mode = { "n", "v" },
    },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })

    chat.setup(opts)
  end,
}
