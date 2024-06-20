import libtmux

# Attach to the default tmux Server
server = libtmux.Server()

# Get the first session
session = server.sessions[0]

# Get the active window in the session
window = session.active_window

# Get the active pane in the window
pane = window.active_pane

# Prompt for the new pane name
new_name = input("Enter the new pane name: ")

# Rename the active pane (sending a command to set a title)
pane.cmd('select-pane', '-T', new_name)

# Verify the change
print(f"Pane renamed to: {new_name}")

# Set a new format for the pane border using the current pane title
session.cmd('set-option', 'pane-border-format', new_name)

print(f"Pane border format set to: {new_name}")

