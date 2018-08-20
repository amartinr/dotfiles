#!/usr/bin/env python3

import i3ipc
from html import escape

def format_string(string):
    max_length = 72

    if len(string) > max_length:
        string = '{}...'.format(string[:max_length-3])

    return '<b>{0}</b>'.format(escape(string))


def rename_workspace(i3, e):

    focused_window = i3.get_tree().find_focused()

    if focused_window.name is None:
        return

    focused_workspace = focused_window.workspace()

    ws_num = focused_workspace.num
    window_name = focused_window.name

    if focused_window.parent.layout in ('tabbed', 'stacked'):
        if len(focused_window.parent.nodes) > 1:
            ws_name = format_string(str(ws_num))
        else:
            ws_name = format_string(str(ws_num) + ': ' + window_name)
    else:
        ws_name = format_string(str(ws_num) + ': ' + window_name)

    i3.command('rename workspace to "%s:%s"' % (ws_num, ws_name))

def clear_workspace(i3, e):
    print("clear_workspace")
    focused_window = i3.get_tree().find_focused()
    focused_workspace = focused_window.workspace()

    ws_num = focused_workspace.num
    window_name = focused_window.name

    if len(focused_workspace.nodes) == 0:
        i3.command('rename workspace to "%s:%s"' % (ws_num, format_string(str(ws_num))))
    else:
        if focused_window.parent.layout in ('tabbed', 'stacked'):
            i3.command('rename workspace to "%s:%s"' % (ws_num, format_string(str(ws_num))))

        elif focused_window.parent.layout in ('splith', 'splitv'):
            i3.command('rename workspace to "%s:%s"' % (ws_num, format_string(str(ws_num) + ': ' + window_name)))


def focus_workspace(i3, e):
    print("{0} - old name: {1}".format("focus_workspace", e.old.name))
    # old workspace
    i3.command('rename workspace "%s" to "%s:%s"' % (e.old.name, e.old.num, e.old.num))
    # new workspace
    i3.command('rename workspace to "%s:%s"' % (e.current.num, format_string(str(e.current.num))))


def layout_change(i3, e):
    focused_window = i3.get_tree().find_focused()
    focused_workspace = focused_window.workspace()

    if focused_window.name is None:
        return

    ws_num = focused_workspace.num
    window_name = focused_window.name

    command = e.binding.command.split(None, 1)

    if command[0] == 'layout':
        print("layout_change (layout)")
        layout = command[1]
        if layout in ('tabbed', 'stacking', 'stacked'):
            if len(focused_window.parent.nodes) > 1:
                i3.command('rename workspace to "%s:%s"' % (ws_num, format_string(str(ws_num))))
            else:
                i3.command('rename workspace to "%s:%s"' % (ws_num, format_string(str(ws_num) + ': ' + window_name)))
        elif layout in ('toggle split', 'splith', 'splitv'):
            i3.command('rename workspace to "%s:%s"' % (ws_num, format_string(str(ws_num) + ': ' + window_name)))
    elif command[0] == 'split' and len(focused_workspace.nodes) > 0:
        print("layout_change (split)")
        i3.command('rename workspace to "%s:%s"' % (ws_num, format_string(str(ws_num) + ': ' + window_name)))

    else:
        print("command: {0}".format(command[0]))

i3 = i3ipc.Connection()

i3.on('window::focus', rename_workspace)
i3.on('window::title', rename_workspace)
i3.on('window::move', clear_workspace)
i3.on('window::close', clear_workspace)
i3.on('workspace::focus', focus_workspace)
i3.on('binding::run', layout_change)

i3.main()
