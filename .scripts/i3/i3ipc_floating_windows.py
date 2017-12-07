#!/usr/bin/python3

import i3ipc

i3 = i3ipc.Connection()
class_terminals = {'URxvt', 'Terminator', 'Termite', 'Xfce4-terminal'}

# Dynamically change windows title typeface to bold
def on_window_new(i3, event):
    ws = i3.get_tree().find_focused().workspace()
    leaves = ws.leaves()

    if event.container.window_class not in class_terminals:
        for leaf in leaves[:len(leaves)-1]:
            if event.container.window_class in leaf.window_class:
                event.container.command('floating toggle')

# Subscribe to events
i3.on("window::new", on_window_new)
# Start the main loop and wait for events to come in.
i3.main()
