#!/usr/bin/python3 -u

import i3ipc

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()


def update_window_name(i3, e):
    focused_window = i3.get_tree().find_focused()
    focused_workspace = focused_window.workspace()

    if focused_workspace.num < 4:
        if len(focused_workspace.nodes) == 0:
            print()
        else:
            print(focused_window.name)
    else:
        print()


i3.on('window::focus', update_window_name)
i3.on('window::title', update_window_name)
i3.on('window::close', update_window_name)
i3.on('workspace::focus', update_window_name)

i3.main()
