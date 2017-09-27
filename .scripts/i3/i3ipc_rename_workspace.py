#!/usr/bin/env python3

import i3ipc


def rename_workspace(i3, e):
    focused_window = i3.get_tree().find_focused()
    focused_workspace = focused_window.workspace()

    ws_num = focused_workspace.num
    window_name = focused_window.name

    max_length = 72
    if len(window_name) > max_length:
        window_name = '{}...'.format(window_name[:max_length-3])

    if focused_window.parent.layout in ('tabbed', 'stacked'):
        if len(focused_window.parent.nodes) > 1:
            i3.command('rename workspace to "%s:<b>%s</b>"' % (ws_num, ws_num))
        else:
            i3.command('rename workspace to "%s:<b>%s: %s</b>"' % (ws_num,
                                                                   ws_num,
                                                                   window_name))
    else:
        i3.command('rename workspace to "%s:<b>%s: %s</b>"' % (ws_num,
                                                               ws_num,
                                                               window_name))


def clear_workspace(i3, e):
    focused_window = i3.get_tree().find_focused()
    focused_workspace = focused_window.workspace()

    ws_num = focused_workspace.num
    window_name = focused_window.name

    if len(focused_workspace.nodes) == 0:
        i3.command('rename workspace to "%s:<b>%s</b>"' % (ws_num, ws_num))
    else:
        if focused_window.parent.layout in ('tabbed', 'stacked'):
            i3.command('rename workspace to "%s:<b>%s</b>"' % (ws_num, ws_num))

        elif focused_window.parent.layout in ('splith', 'splitv'):
            i3.command('rename workspace to "%s:<b>%s: %s</b>"' % (ws_num, ws_num, window_name))


def focus_workspace(i3, e):
    i3.command('rename workspace "%s" to "%s:%s"' % (e.old.name, e.old.num, e.old.num))
    i3.command('rename workspace "%s" to "%s:<b>%s</b>"' % (e.current.name, e.current.num, e.current.num))


def layout_change(i3, e):
    focused_window = i3.get_tree().find_focused()
    focused_workspace = focused_window.workspace()

    ws_num = focused_workspace.num
    window_name = focused_window.name

    command = e.binding.command.split(None, 1)

    if command[0] == 'layout':
        layout = command[1]
        if layout in ('tabbed', 'stacking', 'stacked'):
            if len(focused_window.parent.nodes) > 1:
                i3.command('rename workspace to "%s:<b>%s</b>"' % (ws_num, ws_num))
            else:
                i3.command('rename workspace to "%s:<b>%s: %s</b>"' % (ws_num, ws_num, window_name))
        elif layout in ('toggle split', 'splith', 'splitv'):
            i3.command('rename workspace to "%s:<b>%s: %s</b>"' % (ws_num, ws_num, window_name))
    elif command[0] == 'split':
        i3.command('rename workspace to "%s:<b>%s: %s</b>"' % (ws_num, ws_num, window_name))


i3 = i3ipc.Connection()

i3.on('window::focus', rename_workspace)
i3.on('window::title', rename_workspace)
i3.on('window::move', clear_workspace)
i3.on('window::close', clear_workspace)
i3.on('workspace::focus', focus_workspace)
i3.on('binding::run', layout_change)


i3.main()
