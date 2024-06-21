import libtmux

# Attach to the default tmux Server
server = libtmux.Server()

# Get the first session
session = server.sessions[0]

# Get the active window in the session
window = session.active_window

# Get the active pane in the window
pane = window.active_pane

# Retrieve the custom environment variable value for this specific pane and window
window_id = window.get('window_id')
pane_id = pane.get('pane_id')
attribute_name = f'TMUX_CUSTOM_ATTRIBUTE_{window_id}_{pane_id}'
result = pane.cmd('showenv').stdout

# Extract the specific environment variable
custom_attribute = None
for line in result:
    if line.startswith(f'{attribute_name}='):
        custom_attribute = line.split('=')[1]
        break

if custom_attribute:
    print(f"Custom attribute exists: {attribute_name} = {custom_attribute}")
    # Update the pane-border-format to the value of the custom attribute
    pane.cmd('set-option', 'pane-border-format', custom_attribute)
    print(f"Pane border format set to: {custom_attribute}")
else:
    print(f"Custom attribute does not exist for pane {pane_id} in window {window_id}.")

