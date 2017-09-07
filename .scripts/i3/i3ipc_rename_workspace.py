#!/usr/bin/env python3

import i3ipc
import sys

i3 = i3ipc.Connection()

def rename_current_workspace(i3, e):
    focused_workspace = i3.get_tree().find_focused().workspace()
    focused_window = i3.get_tree().find_focused()

    print("-----------------------")
    print()
    print("focused workspace number: %s" % focused_workspace.num)
    print("focused workspace name: %s" % focused_workspace.name)
    print("focused window name: %s" % focused_window.name)
    
    ws_name =  "%s: %s" % (focused_workspace.num, focused_window.name)
    num = focused_workspace.num

    if len(ws_name) > 72:
        ws_name = '{}...'.format(ws_name[:69])

    print("ws_name: %s" % ws_name)
    print()
   
    i3.command('rename workspace to "%s"' % ws_name)

def clear_current_workspace(i3, e):
    focused_workspace = i3.get_tree().find_focused().workspace()
    i3.command('rename workspace to "%s"' % focused_workspace.num)

def rename_old_workspace(i3, e):
    i3.command('rename workspace "%s" to "%s"' % (e.old.name, e.old.num))

i3.on('window::focus', rename_current_workspace)
i3.on('window::title', rename_current_workspace)
i3.on('window::move', clear_current_workspace)
i3.on('window::close', clear_current_workspace)
i3.on('workspace::focus', rename_old_workspace)

i3.main()
