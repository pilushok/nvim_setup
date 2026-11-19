return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'mfussenegger/nvim-dap',
            'mfussenegger/nvim-dap-python',
            'jbyuki/one-small-step-for-vimkind',
        },
        config = function()
            local dap = require 'dap'
            local dapui = require 'dapui'
            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set('n', '<F5>', function()
                dap.continue()
            end, { desc = 'Debug: Continue' })
            vim.keymap.set('n', '<F10>', function()
                dap.step_over()
            end, { desc = 'Debug: Step Over' })
            vim.keymap.set('n', '<F11>', function()
                dap.step_into()
            end, { desc = 'Debug: Step Into' })
            vim.keymap.set('n', '<F12>', function()
                dap.step_out()
            end, { desc = 'Debug: Step Out' })
            vim.keymap.set('n', '<leader>b', function()
                dap.toggle_breakpoint()
            end, { desc = 'Debug: Toggle Breakpoint' })

            -- Lua-specific configuration
            dap.configurations.lua = {
                {
                    type = 'nlua',
                    request = 'attach',
                    name = 'Attach to running Neovim instance',
                    host = function()
                        local value = vim.fn.input 'Host [127.0.0.1]: '
                        if value ~= '' then
                            return value
                        end
                        return '127.0.0.1'
                    end,
                    port = function()
                        local val = tonumber(vim.fn.input 'Port: ')
                        assert(val, 'Please provide a port number')
                        return val
                    end,
                },
            }

            dap.adapters.nlua = function(callback, config)
                callback { type = 'server', host = config.host, port = config.port }
            end

            -- cpp configuraion
            local install_path = vim.fn.stdpath 'data' .. '/mason/packages/codelldb/'
            local codelldb_path = install_path .. 'extension/adapter/codelldb'
            local liblldb_path = install_path .. 'extension/lldb/lib/liblldb.so'

            dap.adapters.codelldb = {
                type = 'server',
                port = '${port}',
                executable = {
                    command = codelldb_path,
                    args = { '--port', '${port}' },
                },
            }

            -- Lua configurations
            dap.configurations.cpp = {
                {
                    name = 'Launch file',
                    type = 'codelldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    ensure_installed = { 'codelldb' },
                    stopOnEntry = false,
                },
            }

            -- Python configurations
            require('dap-python').setup 'python3'
        end,
    },

    {
        'neovim/nvim-dap',
        dependencies = {
            {
                -- 'mason-org/mason-nvim-dap.nvim',
                -- ensure_installed = { 'codelldb', 'debugpy' },
                -- opts = {},
            },
        },
    },
}
