describe("toggle_line_numbers", function()
    local toggle_line_numbers = require('toggle_rel_abs_numbers').toggle_line_numbers

    it("toggles from relative to absolute line numbers", function()
        -- Mocking vim.wo
        vim = { wo = { relativenumber = true, number = true } }

        toggle_line_numbers()
        assert.is_false(vim.wo.relativenumber)
        assert.is_true(vim.wo.number)

        toggle_line_numbers()
        assert.is_true(vim.wo.relativenumber)
        assert.is_true(vim.wo.number)
    end)
end)

