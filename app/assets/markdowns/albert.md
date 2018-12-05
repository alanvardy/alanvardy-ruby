# 5. Albert

Last Updated: 5 Dec 2018

Albert is Linux's take on the MacOS's Alfred, an all in one launcher that can be heavily customized. The primary advantage is that your hands don't need to leave the keyboard as often to get things done!

Add repository and install:

```bash
wget -nv -O Release.key \
  https://build.opensuse.org/projects/home:manuelschneid3r/public_key
sudo apt-key add - < Release.key
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.10/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt-get update
sudo apt-get install -y albert
sudo apt-get install -y wmctrl
```

Edit ~/.config/albert/albert.conf

```bash
[General]
hotkey=Alt+Space
showTray=true
telemetry=true
terminal=terminator -x

[org.albert.extension.applications]
enabled=true
fuzzy=true

[org.albert.extension.calculator]
enabled=true

[org.albert.extension.chromebookmarks]
bookmarkfile=~/.config/chromium/Default/Bookmarks
enabled=true
fuzzy=true

[org.albert.extension.externalextensions]
enabled=false

[org.albert.extension.files]
enabled=true

[org.albert.extension.firefoxbookmarks]
enabled=false
fuzzy=true
openWithFirefox=true
profile=Profile0

[org.albert.extension.hashgenerator]
enabled=false

[org.albert.extension.mpris]
enabled=true

[org.albert.extension.python]
enabled=true
enabled_modules=Zeal

[org.albert.extension.snippets]
enabled=false

[org.albert.extension.system]
enabled=true

[org.albert.extension.terminal]
enabled=true

[org.albert.extension.websearch]
enabled=true

[org.albert.frontend.widgetboxmodel]
alwaysOnTop=true
clearOnHide=false
displayIcons=true
displayScrollbar=false
displayShadow=true
hideOnClose=false
hideOnFocusLoss=true
itemCount=10
showCentered=true
theme=Arc Dark Grey
```

```bash
sudo gedit /usr/share/albert/org.albert.extension.python/modules/SwitchApp.py
```

Copy in the following Python script

```py
# -*- coding: utf-8 -*-

"""
X11 window switcher - list and activate windows.
"""

import subprocess
from collections import namedtuple
from shutil import which

from albertv0 import *

Window = namedtuple("Window", ["wid", "desktop", "wm_class", "host", "wm_name"])

__iid__ = "PythonInterface/v0.1"
__prettyname__ = "Window Switcher"
__version__ = "1.2"
__trigger__ = None
__author__ = "Ed Perez, Manuel Schneider"
__dependencies__ = ["wmctrl"]

if which("wmctrl") is None:
    raise Exception("'wmctrl' is not in $PATH.")

def handleQuery(query):
    stripped = query.string.strip().lower()
    if stripped:
        results = []
        for line in subprocess.check_output(['wmctrl', '-l', '-x']).splitlines():
            win = Window(*[token.decode() for token in line.split(None,4)])
            if win.desktop != "-1"  and stripped in win.wm_class.split('.')[0].lower():
                results.append(Item(id="%s%s" % (__prettyname__, win.wm_class),
                                    icon=iconLookup(win.wm_class.split('.')[0]),
                                    text="%s  - <i>Desktop %s</i>" % (win.wm_class.split('.')[-1].replace('-',' '), win.desktop),
                                    subtext=win.wm_name,
                                    actions=[ProcAction("Switch Window",
                                                        ["wmctrl", '-i', '-a', win.wid] )]))
        return results
```

Use alt+space to activate
