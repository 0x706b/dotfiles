require("llama").setup({
  model = "glm-4.7-flash",
  model_options = {
    -- (int) Controls whether Mirostat sampling is used. Mirostat is
    -- a method for controlling perplexity. 0 means it's disabled, 
    -- 1 enables Mirostat, and 2 enables Mirostat 2.0. (Default: 0)
    mirostat = 0, 

    -- (float) Affects how quickly the Mirostat algorithm responds 
    -- to feedback from the generated text. Lower values result in 
    -- slower adjustments, higher values make the model more responsive. 
    -- (Default: 0.1)
    mirostat_eta = 0.1, 

    -- (float) Controls the trade-off between coherence and diversity.
    -- Lower values make text more focused and coherent. Higher values 
    -- increase diversity. (Default: 5.0)
    mirostat_tau = 5.0, 

    -- (int) The size of the context window, which determines how many
    -- tokens the model considers at once when generating new tokens. 
    -- Larger values allow the model to maintain context over a larger 
    -- range of tokens. (Default: 2048)
    num_ctx = 2048, 

    -- (int) Determines how far back the model looks to prevent repeating 
    -- the same phrases. If set to 0, repetition is disabled. Setting it to 
    -- -1 uses the entire context window. (Default: 64)
    repeat_last_n = 64, 

    -- (float) Controls how strongly the model penalizes repetition. 
    -- A higher value makes the model less likely to repeat itself.
    -- (Default: 1.1)
    repeat_penalty = 1.1, 

    -- (float) Controls the creativity of the model's responses. A 
    -- higher value results in more creative (and possibly more random) text.
    -- A lower value makes the text more focused and predictable. 
    -- (Default: 0.8)
    temperature = 0.8, 

    -- (int) Sets the random number seed for text generation. 
    -- A fixed seed ensures repeatable outputs for the same input. 
    -- (Default: 0)
    seed = 0, 

    -- (string[]|nil) Defines one or more stop sequences that will halt the 
    -- text generation when encountered. (Default: nil)
    stop = nil, 

    -- (int) Defines the maximum number of tokens to generate in a response. 
    -- Setting it to -1 means the generation is unlimited. A positive integer 
    -- will limit the output to the specified number of tokens.
    -- (Default: -1)
    num_predict = -1, 

    -- (int) This setting reduces the likelihood of generating nonsensical 
    -- text by limiting the possible next token choices. A higher value 
    -- allows more diversity, while a lower value makes the text more focused.
    -- (Default: 40)
    top_k = 40, 

    -- (float) This works together with `top_k`. It defines the cumulative 
    -- probability of the most likely tokens to consider for the next token. 
    -- A value of 0.9 means that the top 90% of token probabilities will 
    -- be considered, increasing diversity. (Default: 0.9)
    top_p = 0.9, 

    -- (float) This is an alternative to `top_p`, filtering out tokens 
    -- with probabilities lower than a minimum threshold. For example, with 
    -- `min_p = 0.05`, any token with less than 5% of the probability of 
    -- the most likely token is ignored. (Default: 0.0)
    min_p = 0.0,
  },
  -- (string) A system prompt used to initialize or guide the AI model's behavior.
  system_message = "",
  -- (bool) Whether to stream the output as it is generated or wait until 
  -- the entire response is ready. (Default: true)
  stream = true,
  chat = {
    -- (string) Specifies the position of the chat interface. Options are 
    -- "left" and "right". (Default: "right")
    position = "right",
    -- (float) The width of the chat window as a percentage of current 
    -- window width. (Default: 30.0)
    width = 30.0,
    -- (string) Title of the chat window. (Default: "LLAMA")
    title = "LLAMA",
    -- (string) The position of the title. Options are "left", "center", 
    -- and "right". (Default: "center")
    title_position = "center",
    -- (string|string[]) Defines the style of the border for the chat window. 
    -- Options are "none", "single", "double", "rounded", "solid", "shadow",
    -- or array. (Default: "rounded")
    border = "rounded",
    -- (string) Defines the color of the loading spinner, using a hex 
    -- color code. (Default: "#FFFFFF")
    spinner_color = "#FFFFFF",
  },
  prompt = {
    -- (string) Defines the position of the prompt input window
    -- relative to the chat window. Options are "top" and "bottom". 
    -- (Default: "bottom")
    position = "bottom",
    -- (string|string[]) Defines the style of the border for the chat window. 
    -- Options are "none", "single", "double", "rounded", "solid", "shadow",
    -- or array. (Default: "rounded")
    border = "rounded",
    -- (bool) Whether the prompt starts in insert mode. (Default: true)
    start_insert_mode = true,
    -- (string) Defines the color of the background highlight of user 
    -- prompts within the chat window, using a hex color code. 
    -- (Default: "#303030")
    highlight_color = "#303030",
  },
  keymaps = {
    -- Keymap for toggling the chat
    LlamaChat = {
      -- (table) Specifies the modes in which this keymap is active (e.g., "n", "v", "i", "t", etc.) (Default: Normal mode)
      mode = { "n" },
      -- (string) The key combination that triggers the action. (Default: Ctrl + l)
      lhs = "<C-l>",
    },
    -- Keymap for submitting a prompt (scoped to prompt buffer)
    LlamaSubmitPrompt = {
      -- (table) (Default: Normal and Insert modes )
      mode = { "n", "i" },
      -- (string) (Default: Enter/Return)
      lhs = "<CR>",
    },
  },
})
