describe("toggle_line_numbers", function()
    local toggle_line_numbers

    -- Mock setup before each test
    before_each(function()
        _G.vim = { wo = { relativenumber = false, number = false } }
        package.loaded['toggle_rel_abs_numbers'] = nil  -- Unload the module
        toggle_line_numbers = require('toggle_rel_abs_numbers').toggle_line_numbers
    end)

    it("toggles from relative to absolute line numbers", function()
        toggle_line_numbers()
        assert.is_true(vim.wo.relativenumber)
        assert.is_true(vim.wo.number)

        toggle_line_numbers()
        assert.is_false(vim.wo.relativenumber)
        assert.is_true(vim.wo.number)
    end)
end)

