import libtmux

def print_pane_attributes():
    # Attach to the default tmux Server
    server = libtmux.Server()

    # Get the first session
    session = server.sessions[0]

    # Get the active window in the session
    window = session.active_window

    # Get the active pane in the window
    pane = window.active_pane

    # Print all attributes of the pane
    for key, value in pane.show_window_options().items():
        print(f"{key}: {value}")

if __name__ == "__main__":
    print_pane_attributes()

