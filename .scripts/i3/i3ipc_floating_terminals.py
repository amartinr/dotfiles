#!/usr/bin/python3
# -*- coding: utf-8 -*-

import i3ipc

i3 = i3ipc.Connection()

terminal_workspaces = [ 1 ]
class_terminals = {'URxvt', 'Terminator', 'Termite', 'Xfce4-terminal'}

def is_terminal_workspace(ws):
    leaves = ws.leaves()

    if ws.props.num in terminal_workspaces:
        return True
    else:
        for leaf in leaves:
            if leaf.window_class not in class_terminals:
                return False
        return True 

def is_ws_empty(ws):
    if len(ws.leaves()) <= 1:
        return True

    return False


# Dynamically change windows title typeface to bold
def on_window_new(i3, event):
    ws = i3.get_tree().find_focused().workspace()

    if not is_ws_empty(ws):
        if not is_terminal_workspace(ws):
            if event.container.window_class in class_terminals:
                event.container.command('floating toggle')
                #event.container.command('focus floating')
                #event.container.command('layout tabbed')

# Subscribe to events
i3.on("window::new", on_window_new)
# Start the main loop and wait for events to come in.
i3.main()
