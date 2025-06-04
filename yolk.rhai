import "themes" as themes;

export let data = #{
    theme: themes::gruvbox,
};

export let eggs = #{
    kitty: #{ 
        targets: "~/.config/kitty",
        templates: ["theme.conf"],
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
};
