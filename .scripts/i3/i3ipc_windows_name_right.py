#!/usr/bin/python3 -u

import i3ipc

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()


def update_window_name(i3, e):
    focused_window = i3.get_tree().find_focused()
    focused_workspace = focused_window.workspace()

    if focused_window.name is None:
        return

    if focused_workspace.num >= 4:
        if focused_window.parent.layout in ('tabbed', 'stacked'):
            if len(focused_window.parent.nodes) > 1:
                print()
            else:
                print(focused_window.name)
        else:
            if len(focused_workspace.nodes) == 0:
                print()
            else:
                print(focused_window.name)
    else:
        print()


def layout_change(i3, e):
    focused_window = i3.get_tree().find_focused()
    # focused_workspace = focused_window.workspace()

    command = e.binding.command.split(None, 1)

    if command[0] == 'layout':
        layout = command[1]
        if layout in ('tabbed', 'stacking', 'stacked'):
            if len(focused_window.parent.nodes) > 1:
                print()
            else:
                print(focused_window.name)
        elif layout in ('toggle split', 'splith', 'splitv'):
            print(focused_window.name)
    elif command[0] == 'split':
        print(focused_window.name)


i3.on('window::focus', update_window_name)
i3.on('window::title', update_window_name)
i3.on('window::close', update_window_name)
i3.on('workspace::focus', update_window_name)
i3.on('binding::run', layout_change)

i3.main()
