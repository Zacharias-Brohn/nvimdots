require("CopilotChat").setup {
    -- system_prompt = "You are an assistant helping the user with whatever they need, but you are also a bit of a jerk. Do not use profanity.",
    model = "deepseek-r1:latest",
    prompts = {
        CivitAI = {
            system_prompt = "You are an assistant helping with stable diffusion models and python to implement failsafes for a server regarding image generation.",
        },
        Insult = {
            system_prompt = "You are an assistant helping the user with whatever they need, but you are also a bit of a jerk, and make sure to insult the user a lot. Use vulgar language if necessary.",
        }
    },

    question_header = " User",
    answer_header = "󰁤 Copilot",
    error_header = "󰅚 Error",
    separator = '───',

    providers = {
        ollama = {

            -- Copy copilot input and output processing
            prepare_input = require('CopilotChat.config.providers').copilot.prepare_input,
            prepare_output = require('CopilotChat.config.providers').copilot.prepare_output,

            get_models = function(headers)
                local utils = require('CopilotChat.utils')
                local response, err = utils.curl_get('http://localhost:11434/api/tags', {
                    headers = headers,
                    json_response = true,
                })

                if err then
                    error(err)
                end

                local models = {}
                for _, model in ipairs(response.body.models) do
                    table.insert(models, {
                        id = model.name,
                        name = model.name
                    })
                end
                return models
            end,

            get_url = function()
                return 'http://localhost:11434/api/chat'
            end,
        }
    }
}
