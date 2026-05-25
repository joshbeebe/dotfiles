
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

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({workspace = i, follow = false}))
end
