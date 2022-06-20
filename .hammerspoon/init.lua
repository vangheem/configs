-- Reload the HammerSpoon config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)


-- WINDOWS --------------------------------------------------------------------

-- RIGHT, HALF-SCREEN
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Right", function()
    local win = hs.window.focusedWindow()
    -- full screen apps should not behave like floating apps
    if win:isFullScreen() then
        return
    end

    local f = win:frame()
    local screen = win:screen()
    local sf = screen:frame()

    f.x = sf.x + (sf.w / 2)
    f.y = sf.y
    f.w = sf.w / 2
    f.h = sf.h

    win:setFrame(f, 0)
end)

-- LEFT, HALF-SCREEN
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Left", function()
    local win = hs.window.focusedWindow()
    -- full screen apps should not behave like floating apps
    if win:isFullScreen() then
        return
    end

    local f = win:frame()
    local screen = win:screen()
    local sf = screen:frame()

    f.x = sf.x
    f.y = sf.y
    f.w = sf.w / 2
    f.h = sf.h

    win:setFrame(f, 0)
end)

-- CENTER, HALF-SCREEN
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Down", function()
    local win = hs.window.focusedWindow()
    -- full screen apps should not behave like floating apps
    if win:isFullScreen() then
        return
    end

    local f = win:frame()
    local screen = win:screen()
    local sf = screen:frame()

    f.x = sf.x + ((sf.w / 2) / 2)
    f.y = sf.y
    f.w = sf.w / 2
    f.h = sf.h

    win:setFrame(f, 0)
end)

-- CENTER, HALF-SCREEN
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Up", function()
    local win = hs.window.focusedWindow()
    -- full screen apps should not behave like floating apps
    if win:isFullScreen() then
        return
    end

    local f = win:frame()
    local screen = win:screen()
    local sf = screen:frame()

    f.x = sf.x
    f.y = sf.y
    f.w = sf.w
    f.h = sf.h

    win:setFrame(f, 0)
end)

-- Move to next screen on right/to the east
hs.hotkey.bind({"cmd", "ctrl", "alt"}, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local sf = screen:frame()

    local isfull = win:isFullScreen()
    local screen_east = screen:toEast()
    if not screen_east then
        return
    end

    local movewindow = function()
        hs.window.animationDuration = 0
        win:moveToScreen(screen_east)
        if isfull then
            hs.timer.doAfter(.2, function()
                if not win:setFullScreen(true) then
                    win:maximize()
                end
            end)
        end
    end

    if isfull then
        win:setFullScreen(false)
        hs.timer.doAfter(1, movewindow)
    else
        movewindow()
    end
end)

-- Move to next screen on left
hs.hotkey.bind({"cmd", "ctrl", "alt"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local sf = screen:frame()

    local isfull = win:isFullScreen()
    local screen_west = screen:toWest()
    if not screen_west then
        return
    end

    local movewindow = function()
        hs.window.animationDuration = 0
        win:moveToScreen(screen_west)
        if isfull then
            hs.timer.doAfter(.2, function()
                if not win:setFullScreen(true) then
                    win:maximize()
                end
            end)
        end
    end

    if isfull then
        win:setFullScreen(false)
        hs.timer.doAfter(1, movewindow)
    else
        movewindow()
    end
end)