# This setting can be used to map keys to other keys. When the key used
# as dictionary-key is pressed, the binding for the key used as
# dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map Ctrl-[ to Escape. Note that
# when a key is bound (via `bindings.default` or `bindings.commands`),
# the mapping is ignored.
# Type: Dict
c.bindings.key_mappings = {}

normal = "normal"
insert = "insert"

############## Normal Mode
config.bind("<Alt-w>", "tab-close", normal)
config.bind("<Ctrl-Shift-J>", "tab-move +", normal)
config.bind("<Ctrl-Shift-K>", "tab-move -", normal)

# Pass
config.bind("zl", "spawn --userscript qute-pass -d 'rofi -dmenu -i -p Qute Pass' ", normal)
config.bind("zul", "spawn --userscript qute-pass --username-only -d 'rofi -dmenu -i -p Qute Pass' ", normal)
config.bind("zpl", "spawn --userscript qute-pass --password-only -d 'rofi -dmenu -i -p Qute Pass' ", normal)
config.bind("zol", "spawn --userscript qute-pass --otp-only -d 'rofi -dmenu -i -p Qute Pass' ", normal)

# Mpv
config.bind(",y1", "hint links spawn mpv --ytdl-format='bestvideo[height<=?144]+bestaudio/best' '{hint-url}'", normal)
config.bind(",y2", "hint links spawn mpv --ytdl-format='bestvideo[height<=?240]+bestaudio/best' '{hint-url}'", normal)
config.bind(",y3", "hint links spawn mpv --ytdl-format='bestvideo[height<=?360]+bestaudio/best' '{hint-url}'", normal)
config.bind(",y4", "hint links spawn mpv --ytdl-format='bestvideo[height<=?480]+bestaudio/best' '{hint-url}'", normal)
config.bind(",y7", "hint links spawn mpv --ytdl-format='bestvideo[height<=?720]+bestaudio/best' '{hint-url}'", normal)
config.bind(",y8", "hint links spawn mpv --ytdl-format='bestvideo[height<=?1080]+bestaudio/best' '{hint-url}'", normal)

# Translate
config.bind(';t', 'hint userscript link translate')
config.bind(';T', 'hint userscript all translate --text')
config.bind('<Ctrl+Space>', 'spawn --userscript translate --text')
config.bind('<Ctrl+Shift+Space>', 'spawn --userscript translate')

############## Insert Mode
config.bind("<Ctrl-e>", "edit-text' ", insert)
config.bind("<Ctrl-p>", "spawn --userscript qute-pass -d 'rofi -dmenu -i -p Qute Pass' ", insert)
