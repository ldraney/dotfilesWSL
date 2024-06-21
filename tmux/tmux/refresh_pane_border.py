import libtmux

# Attach to the default tmux Server
server = libtmux.Server()

# Get the first session
session = server.sessions[0]

# Get the active window in the session
window = session.active_window

# Get the active pane in the window
pane = window.active_pane

# Get the custom user option value
custom_name = pane.cmd('show', '-v', 'user@pane_name').stdout[0]

# Set the pane border format to the custom attribute value
session.cmd('set-option', 'pane-border-format', custom_name)

print(f"Pane border format set to: {custom_name}")

