import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Graphics.X11.ExtraTypes.XF86
import XMonad.Layout.MultiColumns
import XMonad.Layout.PerWorkspace
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.Loggers


import qualified XMonad.StackSet as W


main = xmonad
  . ewmhFullscreen
  . ewmh
  . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
  $ myConfig

myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

myConfig = def {
  borderWidth = 1,
  modMask = mod4Mask,
  workspaces = myWorkspaces,
  manageHook = manageSpawn
    <+> composeAll myManagementHooks
    <+> manageHook def,
  terminal = "urxvt -e /usr/bin/zsh",
  startupHook = myStartupHook,
  normalBorderColor = "#666666",
  layoutHook = myLayout,
  focusedBorderColor = "#000000"
  } `additionalKeys`
    [
      ((0, xF86XK_AudioLowerVolume), spawn "amixer -c 1 set Master 2%-"),
      ((0, xF86XK_AudioRaiseVolume), spawn "amixer -c 1 set Master 2%+"),
      ((0, xF86XK_AudioMute), spawn "amixer -D pulse set Master 1+ toggle"),
      ((0, xF86XK_AudioMicMute), spawn "amixer -D pulse set Capture toggle"),
      ((0, xF86XK_MonBrightnessUp), spawn "bright +"),
      ((0, xF86XK_MonBrightnessDown), spawn "bright -"),
      ((0, xK_Print), spawn "import png:- | xclip -selection clipboard -t image/png"),
      ((shiftMask, xK_Shift_R), spawn "(setxkbmap -query | grep -q 'layout:\\s\\+us') && setxkbmap hu qwerty || setxkbmap us")
    ]

myLayout = onWorkspace "1" Full
  $ onWorkspace "messages" Full
  $ onWorkspace "dev-run" (multiCol [1] 1 0.01 (-0.5))
  $ avoidStruts
  $ tiled ||| Mirror tiled ||| multiCol [1] 1 0.01 (-0.5) ||| Full
    where
        tiled = Tall nmaster delta tiled_ratio
        nmaster = 1
        delta = 1/100
        tiled_ratio = 1/2
        dishes_ratio = 24/100

myWorkspaces = ["browser", "dev-vim", "dev-run", "term", "5", "6", "7", "torrent", "messages"]

myStartupHook = setWMName "LG3D"
                >> spawnHere "nm-applet"
                >> spawnHere "blueman-applet"
                >> spawnHere "feh --bg-scale $HOME/.xmonad/background.png"
                >> spawnHere "sleep 15; $HOME/.xmonad/brightness.sh"
                >> spawnHere "xfce4-power-manager"
                >> spawnOn "messages" "whatsapp-for-linux"
                >> spawnOn "messages" "slack"
                >> spawnOn "messages" "discord"
                >> spawnOn "messages" "skypeforlinux"
                >> spawnOn "torrent" "transmission-gtk"
                >> spawnOn "dev-vim" "urxvt -e zsh -c 'cd ~/Projects/monorepo/; vim; zsh'"
                >> spawnOn "dev-run" "urxvt -e zsh -c 'cd ~/Projects/monorepo/; ls; zsh'"
                >> spawnOn "dev-run" "urxvt -e zsh -c 'cd ~/Projects/monorepo/; ls; zsh'"
                >> spawnOn "dev-run" "urxvt -e zsh -c 'cd ~/Projects/monorepo/; ls; zsh'"
                >> spawnOn "dev-run" "urxvt -e zsh -c 'cd ~/Projects/monorepo/; ls; zsh'"
                >> spawnOn "term" "urxvt -e zsh"
                >> spawnOn "browser" "google-chrome --force-dark-mode"
                >> broadcastMessage ToggleStruts

myManagementHooks :: [ManageHook]
myManagementHooks = [
    (className =? "transmission-qt") --> doF (W.shift "torrent"),
    (className =? "Slack") --> doF (W.shift "messages"),
    (className =? "discord") --> doF (W.shift "messages"),
    (className =? "skypeforlinux") --> doF (W.shift "messages"),
    (className =? "whatsapp-for-linux") --> doF (W.shift "messages")
  ]
