require("minuet").setup({
  provider = 'openai_fim_compatible',
  n_completions = 3,
  request_timeout = 15,
  provider_options = {
    openai_fim_compatible = {
      api_key = 'TERM',
      name = 'LMStudio',
      end_point = 'http://localhost:1234/v1/completions',
      model = 'zed-industries_zeta-2',
      template = {
        prompt = function (context_before_cursor, context_after_cursor, _)
          return "<[fim-suffix]>"
            .. context_after_cursor
            .. "<[fim-prefix]>"
            .. context_before_cursor
            .. "<[fim-middle]>"
        end,
        suffix = false,
      },
      optional = {
          max_tokens = 128,
          top_p = 0.9,
      },
    },
    -- openai_compatible = {
    --   api_key = 'TERM',
    --   name = 'LMStudio',
    --   end_point = 'http://localhost:1234/v1/chat/completions',
    --   model = 'qwen/qwen3.6-27b',
    --   optional = {
    --       max_tokens = 56,
    --       top_p = 0.9,
    --   },
    -- },
  },
  duet = {
    provider = "openai_compatible",
    provider_options = {
      openai_compatible = {
        name = "LMStudio",
        end_point = "http://localhost:1234/v1/chat/completions",
        api_key = "TERM",
        model = 'zed-industries_zeta-2',
        optional = {
            max_tokens = 1024,
            top_p = 0.9,
        },
      }
    }
  }
})
