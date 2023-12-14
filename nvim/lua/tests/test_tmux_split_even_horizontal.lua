local tmux_split_even_horizontal = require('tmux_split_even_horizontal')

describe("tmux_split_even_horizontal", function()
    local tmux_split_even_horizontal = require('tmux_split_even_horizontal')

    it("should not throw errors", function()
        assert.has_no.errors(function()
            tmux_split_even_horizontal.tmux_split_even_horizontal()
        end)
    end)

    -- Additional tests can be added here
end)

