require('modules.inputsource_aurora')
require('modules.escape')

-- config reload
hs.hotkey.bind({'option', 'cmd'}, 'r',  hs.reload)

-- application focus
hs.hotkey.bind({'shift', 'option'}, 'C', function()
    hs.application.launchOrFocus('Google Chrome')
end)
hs.hotkey.bind({'shift', 'option'}, 'S', function()
    hs.application.launchOrFocus('Slack')
end)
hs.hotkey.bind({'shift', 'option'}, 'T', function()
    hs.application.launchOrFocus('iTerm')
end)
hs.hotkey.bind({'shift', 'option'}, 'I', function()
    hs.application.launchOrFocus('Intellij IDEA')
end)
hs.hotkey.bind({'shift', 'option'}, 'F', function()
    hs.application.launchOrFocus('Finder')
end)
hs.hotkey.bind({'shift', 'option'}, 'V', function()
    hs.application.launchOrFocus('GlobalProtect')
		hs.eventtap.keyStroke("enter")
end)

