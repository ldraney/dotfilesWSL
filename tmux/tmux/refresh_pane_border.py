import libtmux

def update_pane_border():
    # Attach to the default tmux Server
    server = libtmux.Server()

    # Get the first session
    session = server.sessions[0]

    # Get the active window in the session
    window = session.active_window

    # Get the active pane in the window
    pane = window.active_pane

    # Get the pane title
    pane_title = pane.current_pane_title

    # Set the pane border format using the current pane title
    session.cmd('set-option', 'pane-border-format', pane_title)

if __name__ == "__main__":
    update_pane_border()

