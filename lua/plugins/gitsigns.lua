return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup({
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                -- Hunks
                vim.keymap.set("n", "<leader>ghd", gitsigns.preview_hunk, { desc = "Hunk Preview" })
                vim.keymap.set('n', '<leader>ghu', gitsigns.undo_stage_hunk, { desc = "Hunk Undo Staging" })
                vim.keymap.set('n', '<leader>ghs', gitsigns.stage_hunk, { desc = "Hunk Stage" })
                vim.keymap.set("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Hunk Reset" })
                vim.keymap.set('v', '<leader>ghs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Hunk Stage" })
                vim.keymap.set('v', '<leader>ghr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Hunk Reset" })
                vim.keymap.set('n', '<leader>ghn', function () gitsigns.nav_hunk('next') end, { desc = "Hunk Next" })
                vim.keymap.set('n', '<leader>ghp', function () gitsigns.nav_hunk('prev') end, { desc = "Hunk Previous" })

                -- Buffers
                vim.keymap.set('n', '<leader>gbs', gitsigns.stage_buffer, { desc = "Buffer Stage" })
                vim.keymap.set('n', '<leader>gbr', gitsigns.reset_buffer, { desc = "Buffer Reset" })

                -- Toogles
                vim.keymap.set('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = "Toggle Line Blame" })
                vim.keymap.set('n', '<leader>gtd', gitsigns.toggle_deleted, { desc = "Toggle Deleted" })
                vim.keymap.set('n', '<leader>gtw', gitsigns.toggle_word_diff, { desc = "Toggle Word Diff" })

                -- Diff
                vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = "Diff" })
            end
        }, { desc = "" })
    end
}
