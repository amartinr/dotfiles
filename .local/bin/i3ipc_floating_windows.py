#!/usr/bin/python3

import i3ipc

i3 = i3ipc.Connection()
class_terminals = {'URxvt', 'Terminator', 'Termite', 'Xfce4-terminal'}
class_editors = {'Mousepad'}
class_browsers = {'Firefox-esr', 'Chromium', 'Firefox'}


# Make new children windows of existing ones floating except for editors,
# terminals and browsers
def on_window_new(i3, event):
    ws = i3.get_tree().find_focused().workspace()
    leaves = ws.leaves()

    wc_count = 0

    width = 1360
    height = 920

    #if event.container.window_class not in class_terminals | class_editors and wc_count <= 1:
    if event.container.window_class not in class_terminals:
        for leaf in leaves:
            parent = leaf.parent
            print("New leaf: {0} ({1}) [{2}]".format(leaf.window_class, leaf.window_role, wc_count))

            if event.container.window_role == "bubble":
                print("Toggling float for window {0}".format(event.container.window_role))
                event.container.command('floating toggle')
                break

            if event.container.window_class in leaf.window_class:
                wc_count = wc_count + 1

            if wc_count > 1:         
                print()
                print("== PARENT == class: {0}, instance: {1}, title: {2}, role: {3}".format(parent.window_class, parent.window_instance, parent.window_title, parent.window_role))
                print("== LEAF == class: {0}, instance: {1}, title: {2}, role: {3}".format(leaf.window_class, leaf.window_instance, leaf.window_title, leaf.window_role))
                print() 

                if event.container.window_role == "Dialog":
                    print("Toggling float for window {0}".format(event.container.window_title))
                    parent.command('floating toggle')
                    parent.command('move position center')
                    break
                #else:
                #    print("Toggling float and resizing window {0} (role: {1})".format(event.container.window_title, event.container.window_role))
                #   resize_command = 'resize set {0} {1}'.format(width, height)
                #   event.container.command('floating toggle')
                #   event.container.command('move position center')
                #   break


# Subscribe to events
i3.on("window::new", on_window_new)
# Start the main loop and wait for events to come in.
i3.main()
