import catppuccin

config.load_autoconfig()
catppuccin.setup(c, "theris", True)

config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.preferred_color_scheme", "dark")
config.set("auto_save.session", True)
config.set("tabs.indicator.width", 0)
config.set("messages.timeout", 2000)
config.set("fonts.default_family", "JetBrainsMono NF Bold")
config.set("tabs.padding", {"top": 8, "bottom": 8, "left": 8, "right": 8})
config.set("statusbar.padding", {"top": 4, "bottom": 4, "left": 4, "right": 4})
config.set("tabs.title.format_pinned", "{audio} {index}")

# theris start
config.set(
    "url.searchengines",
    {
        "DEFAULT": "https://duckduckgo.com/?q={}&k7=#0f1419&k9=#FF7733&kaa=#f07178&k8=#e6e1cf&kx=#253340&kj=#0f1419",
        "g": "https://www.google.com/search?q={}",
    },
)

# theris end

config.bind("<Ctrl-j>", "completion-item-focus next", mode="command")
config.bind("<Ctrl-k>", "completion-item-focus prev", mode="command")
config.bind("K", "tab-next")
config.bind("J", "tab-prev")
config.bind("<Ctrl-b>", "completion-item-focus prev", mode="command")
