# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {
    "q": "close",
    "qa": "quit",
    "w": "session-save",
    "wq": "quit --save",
    "wqa": "quit --save",
    "dl": "spawn --userscript open_download",
    "settings": "open -t qute://settings",
    "changelog": "open -t qute://help/changelog.html",
    "pass": "spawn --userscript qute-pass",
    "mpv": "spawn --userscript view_in_mpv",
    "reload-config": "config-source",
    "private": "set content.private_browsing true",
    "noprivate": "set content.private_browsing false",
    "open-private": "open -p",
    "adblock-off": "set content.blocking.enabled false",
    "adblock-on": "set content.blocking.enabled true",
}
