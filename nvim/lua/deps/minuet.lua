--- @type MiniDep
return {
    source = "milanglacier/minuet-ai.nvim",
    later = function()
        require("minuet").setup({
            cmp = { enable_auto_complete = false },
            blink = { enable_auto_complete = true },

            -- Tweaks to save money, this plugin burns through tokens
            context_window = 4000,
            throttle = 5000,
            debounce = 1000,
            n_completions = 1,

            -- LLM options
            provider = "codestral",
            provider_options = {
                codestral = {
                    model = "codestral-2501",
                    end_point = "https://api.mistral.ai/v1/fim/completions",
                    api_key = "MISTRAL_API_KEY",
                }
            }
        })
    end
}
