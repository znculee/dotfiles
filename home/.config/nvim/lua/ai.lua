local ollama_model = os.getenv("OLLAMA_MODEL")

require("codecompanion").setup({
    display = {
        action_palette = {
            width = 95,
            height = 10,
            prompt = "Prompt ",
            provider = "telescope",
            opts = {
                show_default_actions = true,
                show_default_prompt_library = true,
            },
        },
    },
    strategies = {
        chat = {
            adapter = "ollama",
            slash_commands = {
                ["file"] = {
                    callback = "strategies.chat.slash_commands.file",
                    description = "Select a file using Telescope",
                    opts = {
                        provider = "telescope",
                        contains_code = true,
                    },
                },
            },
        },
        inline = {
            adapter = "ollama",
        },
    },
    adapters = {
        ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
                name = "ollama",
                schema = {
                    model = {
                        default = ollama_model,
                    },
                },
            })
        end,
    },
    opts = {
        system_prompt = function(opts)
            return ""
        end,
    },
})

vim.keymap.set('n', '<leader><leader>c', ':CodeCompanionChat<CR>', { silent = true })
vim.keymap.set('v', '<leader><leader>c', ':CodeCompanionChat<CR>', { silent = true })
vim.keymap.set('n', '<leader><leader><c-c>', ':CodeCompanion<CR>', { silent = true })
vim.keymap.set('v', '<leader><leader><c-c>', ':CodeCompanion<CR>', { silent = true })
vim.keymap.set('n', '<leader><leader><s-c>', ':CodeCompanionActions<CR>', { silent = true })
vim.keymap.set('v', '<leader><leader><s-c>', ':CodeCompanionActions<CR>', { silent = true })
