import libtmux
import sys

if len(sys.argv) != 2:
    print("Usage: set_pane_attribute.py <attribute_value>")
    sys.exit(1)

attribute_value = sys.argv[1]

# Attach to the default tmux Server
server = libtmux.Server()

# Get the first session
session = server.sessions[0]

# Get the active window in the session
window = session.active_window

# Get the active pane in the window
pane = window.active_pane

# Set a custom environment variable with the attribute value
pane.cmd('setenv', 'TMUX_CUSTOM_ATTRIBUTE', attribute_value)

# Verify the change
print(f"Custom attribute set: TMUX_CUSTOM_ATTRIBUTE = {attribute_value}")

