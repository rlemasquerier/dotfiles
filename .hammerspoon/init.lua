local log = hs.logger.new('main', 'info')
DEVELOPING_THIS = false -- set to true to ease debugging

HYPER = {'ctrl', 'shift', 'alt', 'cmd'}
LUNETTE_DEFAULT = {"cmd", "alt"}

-- Custom bindings
function setUpCustomScriptsBindings()
  hs.hotkey.bind(HYPER, 'e', function()
    local command = "echo 'rodolphe.l@campus.coach' | tr -d '\n' | pbcopy"
    local output, status, exitType, rc = hs.execute(command)
    if not status then
      hs.alert.show("Command failed with exit code: " .. tostring(rc))
    end
  end)
end

-- App bindings
function setUpAppBindings()
  hyperFocusOrOpen('i', 'Simulator')
  hyperFocusOrOpen('n', 'Notes')
  hyperFocusOrOpen('c', 'Code')
  hyperFocusOrOpen('a', 'Android Studio')
  hyperFocusOrOpen('x', 'Xcode')
  hyperFocusOrOpen('space', 'Finder')
  hyperFocusOrOpen('s', 'Slack')
  hyperFocusOrOpen('t', 'iTerm')
  hyperFocusOrOpen('g', 'Google Chrome')
  hyperFocusOrOpen('m', 'Spotify')
end

-- Window management
function setUpWindowManagement()
  hs.loadSpoon("Lunette")

  customBindings = {
    leftHalf = {
      {HYPER, "left"},
      {LUNETTE_DEFAULT, "left"},
    },
    rightHalf = {
      {HYPER, "right"},
      {LUNETTE_DEFAULT, "right"},
    },
    fullScreen = {
      {HYPER, "f"},
      {LUNETTE_DEFAULT, "f"},
    }
  }
  
  spoon.Lunette:bindHotkeys(customBindings)

  hs.hotkey.bind(HYPER, "q", hs.hints.windowHints)

  -- throw to other screen
  hs.hotkey.bind(HYPER, 'o', function()
    local window = hs.window.focusedWindow()
    window:moveToScreen(window:screen():next())
  end)
end

-- focus on the last-focused window of the application given by name, or else launch it
function hyperFocusOrOpen(key, app)
  local focus = mkFocusByPreferredApplicationTitle(true, app)
  function focusOrOpen()
    return (focus() or hs.application.launchOrFocus(app))
  end
  hs.hotkey.bind(HYPER, key, focusOrOpen)
end

-- focus on the last-focused window of the first application given by name
function hyperFocus(key, ...)
  hs.hotkey.bind(HYPER, key, mkFocusByPreferredApplicationTitle(true, ...))
end


-- focus on the last-focused window of every application given by name
function hyperFocusAll(key, ...)
  hs.hotkey.bind(HYPER, key, mkFocusByPreferredApplicationTitle(false, ...))
end


-- creates callback function to select application windows by application name
function mkFocusByPreferredApplicationTitle(stopOnFirst, ...)
  local arguments = {...} -- create table to close over variadic args
  return function()
    local nowFocused = hs.window.focusedWindow()
    local appFound = false
    for _, app in ipairs(arguments) do
      if stopOnFirst and appFound then break end
      log:d('Searching for app ', app)
      local application = hs.application.get(app)
      if application ~= nil then
        log:d('Found app', application)
        local window = application:mainWindow()
        if window ~= nil then
          log:d('Found main window', window)
          if window == nowFocused then
            log:d('Already focused, moving on', application)
          else
            window:focus()
            appFound = true
          end
        end
      end
    end
    return appFound
  end
end


function maybeEnableDebug()
  if DEVELOPING_THIS then
    log.setLogLevel('debug')
    log.d('Loading in development mode')
    -- automatically reload changes when we're developing
    hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', hs.reload):start()
    hs.alert('Hammerspoon config reloaded')
    log:d('Hammerspoon config reloaded')
  end
end

function setUpClipboardTool()
  ClipboardTool = hs.loadSpoon('ClipboardTool')
  ClipboardTool.show_in_menubar = false
  ClipboardTool:start()
  ClipboardTool:bindHotkeys({
    toggle_clipboard = {HYPER, "p"}
  })
end

-- Main

maybeEnableDebug()
setUpCustomScriptsBindings()
setUpAppBindings()
setUpWindowManagement()
-- setUpClipboardTool()