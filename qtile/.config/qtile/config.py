from libqtile.config import EzKey, Key, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget

mod = 'mod1'

keys = [
    #EzKey('A-h', lazy.layout.left()),
    #EzKey('A-l', lazy.layout.right()),
    EzKey('A-j', lazy.layout.down()),
    EzKey('A-k', lazy.layout.up()),
    EzKey('A-S-h', lazy.layout.swap_left()),
    EzKey('A-S-l', lazy.layout.swap_right()),
    EzKey('A-S-j', lazy.layout.shuffle_down()),
    EzKey('A-S-k', lazy.layout.shuffle_up()),
    EzKey('A-l', lazy.layout.grow_main()),
    EzKey('A-h', lazy.layout.shrink_main()),
    EzKey('A-n', lazy.layout.normalize()),
    EzKey('A-o', lazy.layout.maximize()),
    EzKey('A-t', lazy.window.toggle_floating()),
    EzKey('A-<Tab>', lazy.layout.next()),
    EzKey('A-S-<Tab>', lazy.layout.next()),
    EzKey('A-S-<space>', lazy.layout.flip()),
    EzKey('A-<space>', lazy.next_layout()),
    EzKey('A-S-<Return>', lazy.spawn('x-terminal-emulator')),
    EzKey('A-w', lazy.window.kill()),
    EzKey('A-q', lazy.restart()),
    EzKey('A-S-q', lazy.shutdown()),
    EzKey('A-p', lazy.spawncmd())
]

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.append(
        Key([mod], i.name, lazy.group[i.name].toscreen())
    ),
    keys.append(
        Key([mod, 'shift'], i.name, lazy.window.togroup(i.name))
    )

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

layouts = [
    layout.xmonad.MonadTall(border_width=1),
    layout.Max(),
    #layout.Stack(num_stacks=2),
]

widget_defaults = dict(
    font='Arial',
    fontsize=16,
    padding=3,
)

