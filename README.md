# Running Lua Tests in Neovim Environment

This GitHub Action sets up a Neovim environment with Lua and Busted to run Lua tests. 

## Usage

Include the following workflow in your `.github/workflows` directory to use this action:

```yaml
on: [push]

jobs:
  run-lua-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: ./
        with:
          directory: 'lua/tests'

