import "themes" as themes;

export let data = #{
    theme: themes::gruvbox_material,
};

export let eggs = #{
    kitty: #{ 
        targets: "~/.config/kitty",
        templates: ["theme.conf"],
        enabled: true,
    },
    zsh: #{ 
        targets: #{
            ".zshrc": "~/.zshrc",
            ".zshenv": "~/.zshenv",
        },
        enabled: true,
    },
    eww: #{ 
        targets: "~/.config/eww",
        templates: ["eww.scss"],
        enabled: true,
    },
    zathura: #{ 
        targets: "~/.config/zathura",
        templates: ["theme"],
        enabled: true,
    },
    rofi: #{ 
        targets: "~/.config/rofi",
        templates: ["theme.rasi"],
        enabled: true,
    },
    dunst: #{ 
        targets: "~/.config/dunst",
        templates: ["dunstrc"],
        enabled: true,
    },
    xremap: #{ 
        targets: "~/.config/xremap",
        enabled: true,
    },
    zellij: #{ 
        targets: "~/.config/zellij",
        enabled: true,
    },
    tmux: #{ 
        targets: "~/.config/tmux",
        templates: ["tmux.conf"],
        enabled: false,
    },
    qutebrowser: #{ 
        targets: "~/.config/qutebrowser",
        templates: ["config.py"],
        enabled: true,
    },
    nvim: #{ 
        targets: "~/.config/nvim",
        templates: ["lua/plugins/ui/colorscheme.lua"],
        enabled: true,
    },
};
