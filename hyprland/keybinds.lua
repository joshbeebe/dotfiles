
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.kill())
hl.bind("SUPER + M", hl.dsp.exit()) -- Update this to use hyprshutdown
hl.bind("SUPER + C", hl.dsp.exec_cmd("google-chrome-stable --hide-crash-restore-bubble"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("google-chrome-stable --restore-last-session"))
-- hl.bind = $mainMod, V, lockactivegroup 
hl.bind("SUPER + R", hl.dsp.exec_cmd("wofi -I --show drun"))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("wofi --show run"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + SHIFT + T", hl.dsp.workspace.toggle_special("FileManager"))

hl.bind("SUPER + F", hl.dsp.window.float("toggle"))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + P", hl.dsp.window.pin()) -- Pin a floating window

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({workspace = i, follow = false}))
end


-- Niri
hl.bind("SUPER + Space", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))

-- Fn1
hl.bind("mouse:277", hl.dsp.exec_cmd("ydotool click 0x42"))
hl.bind("mouse:277", hl.dsp.exec_cmd("ydotool click 0x82"), {release = true})
hl.bind("ALT + mouse:277", hl.dsp.exec_cmd("ydotool click 0x42"))
hl.bind("ALT + mouse:277", hl.dsp.exec_cmd("ydotool click 0x82"), {release = true})

--Fn 2
hl.bind("mouse:278", hl.dsp.exec_cmd("~/dotfiles/bin/mouse_wiggle press"))
hl.bind("mouse:278", hl.dsp.exec_cmd("~/dotfiles/bin/mouse_wiggle release"), {release = true})

-- Fn3
-- hl.bind("mouse:279", hl.dsp.exec_cmd("ydotool click 0x42"))
-- hl.bind("mouse:279", hl.dsp.exec_cmd("ydotool click 0x82"), {release = true})
hl.bind("mouse:279", hl.dsp.exec_cmd("~/dotfiles/bin/mouse_wiggle press"))
hl.bind("mouse:279", hl.dsp.exec_cmd("~/dotfiles/bin/mouse_wiggle release"), {release = true})