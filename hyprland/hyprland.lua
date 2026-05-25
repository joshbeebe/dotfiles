-- Monitor Configuration
hl.monitor({
    output = "eDP-1",
    -- mode = "2256x1504@60",
    mode = "preferred",
    position = "0x0",
    scale = "1",
})

-- Startup
hl.on("hyprland.start", function()
    hl.exec_cmd("discord")
    hl.exec_cmd("code")
    hl.exec_cmd("ydotoold ~")
    hl.exec_cmd("dms run")
    -- hl.exec_cmd("waybar")
    -- hl.exec_cmd("dunst")
end)

-- Window rules
hl.window_rule({
    name = "Discord",
    match = {
        class = "discord"
    },
    workspace = "4 silent"
})

hl.window_rule({
    name = "VS Code",
    match = {
        class = "code"
    },
    workspace = "3 silent"
})

hl.window_rule({
    name = "DMS Windows",
    match = {
        class = "^(org.quickshell)$"
    },
    float = true
})

-- Config
hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 1,
        col = {
            active_border = "rgba(1affffee)",
            inactive_border = "rgba(595959aa)"
        },
        layout = "dwindle"
    },
    input = {
        kb_layout = "us",
        repeat_delay = 300,
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true,
            scroll_factor = 1.0
        },
        sensitivity = 0
    },
    decoration = {
        rounding = 10
    },
    dwindle = {
        preserve_split = true,
        smart_split = true -- Split follows mouse in X regions
    }
})

-- Device config
hl.device({
    name = "pixa3854:00-093a:0274-touchpad",
    sensitivity = 0.5,
    natural_scroll = true
})
hl.device({
    name = "ELECOM TrackBall Mouse HUGE TrackBall",
    sensitivity = 0.9
})
hl.device({
    name = "logitech-usb-trackball",
    sensitivity = 0.9,
    scroll_button = 275,
    scroll_method = "on_button_down"
})

require("keybinds")