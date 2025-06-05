palette = {
    "background": "#202020",  # {< replace_color(data.theme.background) >}
    "background2": "#3c3836",  # {< replace_color(data.theme.background2) >}
    "foreground": "#ebdbb2",  # {< replace_color(data.theme.foreground) >}
    "black": "#3c3836",  # {< replace_color(data.theme.black) >}
    "red": "#fb4932",  # {< replace_color(data.theme.red) >}
    "green": "#b8bb26",  # {< replace_color(data.theme.green) >}
    "yellow": "#fabd2f",  # {< replace_color(data.theme.yellow) >}
    "blue": "#83a598",  # {< replace_color(data.theme.blue) >}
    "magenta": "#d3869b",  # {< replace_color(data.theme.magenta) >}
    "cyan": "#8ec07c",  # {< replace_color(data.theme.cyan) >}
    "white": "#928374",  # {< replace_color(data.theme.white) >}
}

config.load_autoconfig()

config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.preferred_color_scheme", "dark")
config.set("auto_save.session", True)
config.set("tabs.indicator.width", 0)
config.set("messages.timeout", 2000)
config.set("fonts.default_family", "JetBrainsMono NF Bold")
config.set("tabs.padding", {"top": 8, "bottom": 8, "left": 8, "right": 8})
config.set("statusbar.padding", {"top": 4, "bottom": 4, "left": 4, "right": 4})
config.set("tabs.title.format_pinned", "{audio} {index}")
config.set(
    "url.searchengines",
    {
        "DEFAULT": (
            f"https://duckduckgo.com/?q={{}}"
            f"&k7={palette['background'].strip("#")}"
            f"&k9={palette['foreground'].strip("#")}"
            f"&kaa={palette['blue'].strip("#")}"
            f"&k8={palette['foreground'].strip("#")}"
            f"&kx={palette['background2'].strip("#")}"
            f"&kj={palette['background'].strip("#")}"
        ),
        "g": "https://google.com/search?q={}",
    },
)

config.bind("<Ctrl-j>", "completion-item-focus next", mode="command")
config.bind("<Ctrl-k>", "completion-item-focus prev", mode="command")
config.bind("K", "tab-next")
config.bind("J", "tab-prev")
config.bind("<Ctrl-b>", "completion-item-focus prev", mode="command")
config.bind(
    "<Ctrl-m>",
    "set colors.webpage.darkmode.enabled true",
    mode="normal",
)
config.bind(
    "<Ctrl-l>",
    "set colors.webpage.darkmode.enabled false",
    mode="normal",
)

# completion {{{
## Background color of the completion widget category headers.
c.colors.completion.category.bg = palette["background"]
## Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = palette["background2"]
## Top border color of the completion widget category headers.
c.colors.completion.category.border.top = palette["foreground"]
## Foreground color of completion widget category headers.
c.colors.completion.category.fg = palette["green"]
## Background color of the completion widget for even and odd rows.
c.colors.completion.even.bg = palette["background"]
c.colors.completion.odd.bg = palette["background"]
## Text color of the completion widget.
c.colors.completion.fg = palette["foreground"]

## Background color of the selected completion item.
c.colors.completion.item.selected.bg = palette["background2"]
## Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = palette["background2"]
## Top border color of the completion widget category headers.
c.colors.completion.item.selected.border.top = palette["background2"]
## Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = palette["foreground"]
## Foreground color of the selected completion item.
c.colors.completion.item.selected.match.fg = palette["red"]
## Foreground color of the matched foreground in the completion.
c.colors.completion.match.fg = palette["foreground"]

## Color of the scrollbar in completion view
c.colors.completion.scrollbar.bg = palette["background"]
## Color of the scrollbar handle in completion view.
c.colors.completion.scrollbar.fg = palette["background2"]
# }}}

# downloads {{{
c.colors.downloads.bar.bg = palette["background"]
c.colors.downloads.error.bg = palette["background"]
c.colors.downloads.start.bg = palette["background"]
c.colors.downloads.stop.bg = palette["background"]

c.colors.downloads.error.fg = palette["red"]
c.colors.downloads.start.fg = palette["blue"]
c.colors.downloads.stop.fg = palette["green"]
c.colors.downloads.system.fg = "none"
c.colors.downloads.system.bg = "none"
# }}}

# hints {{{
## Background color for hints. Note that you can use a `rgba(...)` value
## for transparency.
c.colors.hints.bg = palette["yellow"]

## Font color for hints.
c.colors.hints.fg = palette["background2"]

## Hints
c.hints.border = "1px solid " + palette["background2"]

## Font color for the matched part of hints.
c.colors.hints.match.fg = palette["foreground"]
# }}}

# keyhints {{{
## Background color of the keyhint widget.
c.colors.keyhint.bg = palette["background2"]

## Text color for the keyhint widget.
c.colors.keyhint.fg = palette["foreground"]

## Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = palette["foreground"]
# }}}

# messages {{{
## Background color of an error message.
c.colors.messages.error.bg = palette["foreground"]
## Background color of an info message.
c.colors.messages.info.bg = palette["foreground"]
## Background color of a warning message.
c.colors.messages.warning.bg = palette["foreground"]

## Border color of an error message.
c.colors.messages.error.border = palette["background2"]
## Border color of an info message.
c.colors.messages.info.border = palette["background2"]
## Border color of a warning message.
c.colors.messages.warning.border = palette["background2"]

## Foreground color of an error message.
c.colors.messages.error.fg = palette["red"]
## Foreground color an info message.
c.colors.messages.info.fg = palette["foreground"]
## Foreground color a warning message.
c.colors.messages.warning.fg = palette["yellow"]
# }}}

# prompts {{{
## Background color for prompts.
c.colors.prompts.bg = palette["background2"]

# ## Border used around UI elements in prompts.
c.colors.prompts.border = "1px solid " + palette["foreground"]

## Foreground color for prompts.
c.colors.prompts.fg = palette["foreground"]

## Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = palette["white"]

## Background color for the selected item in filename prompts.
c.colors.prompts.selected.fg = palette["red"]
# }}}

# statusbar {{{
## Background color of the statusbar.
c.colors.statusbar.normal.bg = palette["background"]
## Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = palette["background"]
## Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = palette["background"]
## Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = palette["background"]
## Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = palette["background"]

## Background color of the progress bar.
c.colors.statusbar.progress.bg = palette["background"]
## Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = palette["background"]

## Foreground color of the statusbar.
c.colors.statusbar.normal.fg = palette["foreground"]
## Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = palette["red"]
## Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = palette["foreground"]
## Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = palette["yellow"]
## Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = palette["yellow"]
## Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = palette["yellow"]

## Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = palette["red"]

## Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = palette["foreground"]

## Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = palette["cyan"]

## Foreground color of the URL in the statusbar on successful load
c.colors.statusbar.url.success.http.fg = palette["cyan"]

## Foreground color of the URL in the statusbar on successful load
c.colors.statusbar.url.success.https.fg = palette["green"]

## Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = palette["yellow"]

## PRIVATE MODE COLORS
## Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = palette["background2"]
## Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = palette["foreground"]
## Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = palette["background"]
## Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = palette["foreground"]

# }}}

# tabs {{{
## Background color of the tab bar.
c.colors.tabs.bar.bg = palette["background"]
## Background color of unselected even tabs.
c.colors.tabs.even.bg = palette["background"]
## Background color of unselected odd tabs.
c.colors.tabs.odd.bg = palette["background"]

## Foreground color of unselected even tabs.
c.colors.tabs.even.fg = palette["foreground"]
## Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = palette["foreground"]

## Color for the tab indicator on errors.
c.colors.tabs.indicator.error = palette["red"]

c.colors.tabs.indicator.start = palette["green"]
c.colors.tabs.indicator.stop = palette["green"]
## Color gradient interpolation system for the tab indicator.
## Valid values:
##	 - rgb: Interpolate in the RGB color system.
##	 - hsv: Interpolate in the HSV color system.
##	 - hsl: Interpolate in the HSL color system.
##	 - none: Don't show a gradient.
c.colors.tabs.indicator.system = "none"

# ## Background color of selected even tabs.
c.colors.tabs.selected.even.bg = palette["background2"]
# ## Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = palette["background2"]

# ## Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = palette["foreground"]
# ## Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = palette["foreground"]

c.colors.tabs.pinned.even.bg = palette["background"]
c.colors.tabs.pinned.even.fg = palette["foreground"]

c.colors.tabs.pinned.odd.bg = palette["background"]
c.colors.tabs.pinned.odd.fg = palette["foreground"]

c.colors.tabs.pinned.selected.even.bg = palette["background2"]
c.colors.tabs.pinned.selected.even.fg = palette["foreground"]

c.colors.tabs.pinned.selected.odd.bg = palette["background2"]
c.colors.tabs.pinned.selected.odd.fg = palette["foreground"]

# }}}

# context menus {{{
c.colors.contextmenu.menu.bg = palette["background"]
c.colors.contextmenu.menu.fg = palette["foreground"]

c.colors.contextmenu.disabled.bg = palette["background2"]
c.colors.contextmenu.disabled.fg = palette["foreground"]

c.colors.contextmenu.selected.bg = palette["foreground"]
c.colors.contextmenu.selected.fg = palette["red"]
# }}}

# background color for webpages {{{
c.colors.webpage.bg = palette["background"]
# }}}
