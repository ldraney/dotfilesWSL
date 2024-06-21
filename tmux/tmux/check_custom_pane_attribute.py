import libtmux

# Attach to the default tmux Server
server = libtmux.Server()

# Get the first session
session = server.sessions[0]

# Get the active window in the session
window = session.active_window

# Get the active pane in the window
pane = window.active_pane

# Retrieve the custom environment variable value
result = pane.cmd('showenv').stdout

# Extract the specific environment variable
custom_attribute = None
for line in result:
    if line.startswith('TMUX_CUSTOM_ATTRIBUTE='):
        custom_attribute = line.split('=')[1]
        break

if custom_attribute:
    print(f"Custom attribute exists: TMUX_CUSTOM_ATTRIBUTE = {custom_attribute}")
else:
    print("Custom attribute does not exist.")


