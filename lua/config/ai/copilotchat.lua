require("CopilotChat").setup {
	-- system_prompt = "You are an assistant helping the user with whatever they need, but you are also a bit of an asshole.",
	prompts = {
	},

	headers = {
		user = ' You: ',
		assistant = ' Copilot: ',
		tool = '󰖷 Tool: ',
	},

	temperature = 0.2,

	providers = {
		tabby = {
			prepare_input = require('CopilotChat.config.providers').copilot.prepare_input,
			prepare_output = require('CopilotChat.config.providers').copilot.prepare_output,

			get_models = function(headers)
				local response, err = require('CopilotChat.utils').curl_get('http://localhost:5000/v1/models', {
					headers = headers,
					json_response = true
				})

				if err then
					error(err)
				end

				return vim.tbl_map(function(model)
					return {
						id = model.id,
						name = model.id,
					}
				end, response.body.data)
			end,

			get_url = function()
				return 'http://localhost:5000/v1/chat/completions'
			end,
		}
	}
}
