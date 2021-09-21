import subprocess

def readXresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props
xrdb = readXresources("*")

x = {
    "bg":   xrdb["*background"],
    "fg":     xrdb["*foreground"],

    "black":   xrdb["*color0"],
    "red":     xrdb["*color1"],
    "green":   xrdb["*color2"],
    "yellow":  xrdb["*color3"],
    "blue":    xrdb["*color4"],
    "magenta": xrdb["*color5"],
    "cyan":    xrdb["*color6"],
    "white":   xrdb["*color7"],

    "light_black":   xrdb["*color8"],
    "light_red":     xrdb["*color9"],
    "light_green":   xrdb["*color10"],
    "light_yellow":  xrdb["*color11"],
    "light_blue":    xrdb["*color12"],
    "light_magenta": xrdb["*color13"],
    "light_cyan":    xrdb["*color14"],
    "light_white":   xrdb["*color15"],
}

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = [
    x["fg"],
    x["white"],
    x["fg"],
]

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = x["bg"]

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = x["bg"]

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = x["fg"]

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = x["bg"]

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = x["bg"]

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = x["bg"]

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = x["bg"]

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = x["blue"]

# Top border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.top = x["blue"]

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = x["blue"]

# Foreground color of the matched text in the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.match.fg = x["bg"]

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = x["yellow"]

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = x["blue"]

# Color of the scrollbar in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.bg = x["bg"]

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = x["bg"]

# Color gradient start for download text.
# Type: QtColor
c.colors.downloads.start.fg = x["blue"]

# Color gradient start for download backgrounds.
# Type: QtColor
c.colors.downloads.start.bg = x["bg"]

# Color gradient end for download text.
# Type: QtColor
c.colors.downloads.stop.fg = x["green"]

# Color gradient stop for download backgrounds.
# Type: QtColor
c.colors.downloads.stop.bg = x["bg"]

# Color gradient interpolation system for download text.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.downloads.system.fg = "rgb"

# Color gradient interpolation system for download backgrounds.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.downloads.system.bg = "rgb"

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = x["red"]

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = x["bg"]

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = x["yellow"]

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = x["black"]

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = x["yellow"]

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = x["fg"]

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = x["yellow"]

# Background color of the keyhint widget.
# Type: QssColor
c.colors.keyhint.bg = "rgba(0, 0, 0, 80%)"

# Foreground color of an error message.
# Type: QssColor
c.colors.messages.error.fg = x["fg"]

# Background color of an error message.
# Type: QssColor
c.colors.messages.error.bg = x["red"]

# Border color of an error message.
# Type: QssColor
c.colors.messages.error.border = x["red"]

# Foreground color of a warning message.
# Type: QssColor
c.colors.messages.warning.fg = x["black"]

# Background color of a warning message.
# Type: QssColor
c.colors.messages.warning.bg = x["yellow"]

# Border color of a warning message.
# Type: QssColor
c.colors.messages.warning.border = x["yellow"]

# Foreground color of an info message.
# Type: QssColor
c.colors.messages.info.fg = x["fg"]

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = x["bg"]

# Border color of an info message.
# Type: QssColor
c.colors.messages.info.border = x["bg"]

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = x["fg"]

# Border used around UI elements in prompts.
# Type: String
c.colors.prompts.border = "1px solid {}".format(x["black"])

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = x["bg"]

# Background color for the selected item in filename prompts.
# Type: QssColor
c.colors.prompts.selected.bg = x["magenta"]

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = x["fg"]

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = x["bg"]

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = x["bg"]

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = x["blue"]

# Foreground color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.fg = x["white"]

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = x["magenta"]

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = x["white"]

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = x["light_black"]

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = x["white"]

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = x["black"]

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = x["white"]

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = x["light_black"]

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = x["black"]

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = x["cyan"]

# Foreground color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.fg = x["black"]

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = x["yellow"]

# Background color of the progress bar.
# Type: QssColor
c.colors.statusbar.progress.bg = x["light_white"]

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = x["white"]

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = x["red"]

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = x["blue"]

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = x["fg"]
c.colors.statusbar.url.success.https.fg = x["fg"]

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = x["yellow"]

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = x["bg"]

# Color gradient start for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.start = x["blue"]

# Color gradient end for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.stop = x["green"]

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = x["red"]

# Color gradient interpolation system for the tab indicator.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.tabs.indicator.system = "rgb"

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = x["fg"]

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = x["bg"]

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = x["fg"]

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = x["bg"]

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = x["bg"]

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = x["blue"]

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = x["bg"]

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = x["blue"]

# Foreground color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.fg = x["bg"]

# Background color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.bg = x["fg"]

# Foreground color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.fg = x["bg"]

# Background color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.bg = x["fg"]

# Foreground color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.fg = x["bg"]

# Background color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.bg = x["blue"]

# Foreground color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.fg = x["bg"]

# Background color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.bg = x["blue"]

# Background color for webpages if unset (or empty to use the theme's
# color).
# Type: QtColor
# c.colors.webpage.bg = "#ffffff"

# Which algorithm to use for modifying how colors are rendered with darkmode.
# Type: String
c.colors.webpage.darkmode.algorithm = "lightness-cielab"

# Contrast for dark mode. This only has an effect when colors.webpage.darkmode.algorithm is set to lightness-hsl or brightness-rgb.
# Type: Float
# c.colors.webpage.darkmode.contrast = 0.9

# Render all web contents using a dark theme. Example configurations from Chromium’s chrome://flags:
# Type: Bool
c.colors.webpage.darkmode.enabled = False

# Render all colors as grayscale. This only has an effect when colors.webpage.darkmode.algorithm is set to lightness-hsl or brightness-rgb.
# Type: Bool
c.colors.webpage.darkmode.grayscale.all = True

# Desaturation factor for images in dark mode. If set to 0, images are left as-is. If set to 1, images are completely grayscale. Values between 0 and 1 desaturate the colors accordingly.
# Type: Float
c.colors.webpage.darkmode.grayscale.images = 0.7

# Which images to apply dark mode to. WARNING: With QtWebengine 5.15.0, this setting can cause frequent renderer process crashes due to a bug in Qt. Thus, the smart setting is ignored and treated like never in that case.
# Type: String
c.colors.webpage.darkmode.policy.images = "never"

# Which pages to apply dark mode to.
# Type: String
c.colors.webpage.darkmode.policy.page = "smart"
