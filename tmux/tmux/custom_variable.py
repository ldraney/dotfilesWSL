import libtmux

# Initialize the tmux server and session
server = libtmux.Server()
session = server.find_where({"session_name": "your_session_name"})
window = session.attached_window
pane = window.attached_pane

# Setting a custom pane variable
custom_variable_name = "custom_pane_name"
custom_value = "MyCustomPaneName"
pane.cmd('set', '-p', custom_variable_name, custom_value)

# Retrieving the custom pane variable
pane_custom_name = pane.cmd('show', '-p', f'@{custom_variable_name}').stdout[0]
print(f"Custom Pane Name: {pane_custom_name}")

