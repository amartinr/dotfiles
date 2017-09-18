#!/usr/bin/env python3

import i3ipc

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()

# Dynamically change windows title typeface to bold
def on_window_focus(i3, e):
    leaves = i3.get_tree().leaves()
    for leaf in leaves:
        if leaf.focused:
            leaf.command('title_format "<b>%title</b>"')
        else:
            leaf.command('title_format "%title"')

        for child in leaf.parent.leaves():
            if child.focused:
                leaf.parent.command('title_format "<b>%title</b>"')
                break
            else:
                leaf.parent.command('title_format "%title"')

# Subscribe to events
i3.on("window::focus", on_window_focus)

# Start the main loop and wait for events to come in.
i3.main()
