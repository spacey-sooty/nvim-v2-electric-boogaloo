return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local builtin = require('telescope.builtin')
        require('telescope').load_extension('fzf')
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = { '.git/' },
            }
        })

        local project_files = function()
            local opts = {}

            local cwd = vim.fn.getcwd()
            builtin.find_files(opts)
        end

        local find_all = function()
            local opts = {
                hidden = true,
            }

            builtin.find_files(opts)
        end

        local project_grep = function()
            builtin.grep_string({ search = vim.fn.input('Grep > ') })
        end
        
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pc', builtin.git_commits, {})
        vim.keymap.set('n', '<leader>pa', find_all, {})
        vim.keymap.set('n', '<leader>pg', project_files, {})

        vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})

        vim.keymap.set('n', '<leader>ps', project_grep, {})
        vim.keymap.set('n', '<leader>pq', builtin.live_grep, {})
    end
}
