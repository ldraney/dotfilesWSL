import libtmux
import sys

if len(sys.argv) != 2:
    print("Usage: rename_pane.py <new_pane_name>")
    sys.exit(1)

new_name = sys.argv[1]

# Attach to the default tmux Server
server = libtmux.Server()

# Get the first session
session = server.sessions[0]

# Get the active window in the session
window = session.active_window

# Get the active pane in the window
pane = window.active_pane

# Rename the active pane (sending a command to set a title)
pane.cmd('select-pane', '-T', new_name)

# Set a custom environment variable with the new pane title, unique to each pane and window
window_id = window.get('window_id')
pane_id = pane.get('pane_id')
attribute_name = f'TMUX_CUSTOM_ATTRIBUTE_{window_id}_{pane_id}'
pane.cmd('setenv', attribute_name, new_name)

# Verify the change
# print(f"Pane renamed to: {new_name}")
# print(f"Custom attribute set: {attribute_name} = {new_name}")

# Set a new format for the pane border using the current pane title
pane.cmd('set-option', 'pane-border-format', new_name)

# print(f"Pane border format set to: {new_name}")

