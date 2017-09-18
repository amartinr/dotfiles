#!/usr/bin/env python3

import i3ipc
import sys

i3 = i3ipc.Connection()

def rename_workspace(i3, e):
    focused_workspace = i3.get_tree().find_focused().workspace()
    focused_window = i3.get_tree().find_focused()

    #ws_name =  "%s: %s" % (focused_workspace.num, focused_window.name)
    ws_num =  focused_workspace.num
    ws_name = focused_window.name

    max_length = 72
    if len(ws_name) > max_length:
        ws_name = '{}...'.format(ws_name[:max_length-3])

    ## bold
    i3.command('rename workspace to "%s:<b>%s: %s</b>"' % (ws_num, ws_num, ws_name))
    ## regular
    #i3.command('rename workspace to "%s:%s: %s"' % (ws_num, ws_num, ws_name))

    #print("-----------------------")
    #print()
    #print("focused workspace number: %s" % focused_workspace.num)
    #print("focused workspace name: %s" % focused_workspace.name)
    #print("focused window name: %s" % focused_window.name)
    #print("ws_name: %s" % ws_name)
    #print()

def clear_workspace(i3, e):
    focused_workspace = i3.get_tree().find_focused().workspace()
    if len(focused_workspace.nodes) == 0:
        i3.command('rename workspace to "%s:<b>%s</b>"' % (focused_workspace.num, focused_workspace.num))

def focus_workspace(i3, e):
    i3.command('rename workspace "%s" to "%s:%s"' % (e.old.name, e.old.num, e.old.num))
    i3.command('rename workspace "%s" to "%s:<b>%s</b>"' % (e.current.name, e.current.num, e.current.num))

i3.on('window::focus', rename_workspace)
i3.on('window::title', rename_workspace)
i3.on('window::move', clear_workspace)
i3.on('window::close', clear_workspace)
i3.on('workspace::focus', focus_workspace)

i3.main()
