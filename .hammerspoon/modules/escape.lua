local right_cmd = hs.hotkey.modal.new()
local inputEnglish = "com.apple.keylayout.ABC"

local on_right_cmd = function()
    right_cmd:enter()
end

local off_right_cmd = function()

    right_cmd:exit()

    local input_source = hs.keycodes.currentSourceID()

    if not (input_source == inputEnglish) then
        hs.keycodes.currentSourceID(inputEnglish)
    end
    hs.eventtap.keyStroke({}, 'escape')
end

hs.hotkey.bind({}, 'f13', on_right_cmd, off_right_cmd)

