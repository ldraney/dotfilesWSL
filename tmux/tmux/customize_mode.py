import libtmux

def activate_customize_mode():
    # Attach to the default tmux Server
    server = libtmux.Server()

    # Get the first session
    session = server.sessions[0]

    # Get the active window in the session
    window = session.active_window

    # Get the active pane in the window
    pane = window.active_pane

    # Activate customize mode in the active pane
    pane.cmd('choose-tree', '-Z')  # Put the pane into customize mode

if __name__ == "__main__":
    activate_customize_mode()

