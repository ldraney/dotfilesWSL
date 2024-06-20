import libtmux

def set_hello_world():
    # Attach to the default tmux Server
    server = libtmux.Server()

    # Get the first session
    session = server.sessions[0]

    # Set the pane border format to "Hello World"
    session.cmd('set-option', 'pane-border-format', 'Hi mom')

if __name__ == "__main__":
    set_hello_world()

