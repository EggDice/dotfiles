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

import qualified XMonad.StackSet as W


main = xmonad $ defaultConfig {
  borderWidth = 1,
  modMask = mod4Mask,
  workspaces = myWorkspaces,
  manageHook = manageSpawn
    <+> composeAll myManagementHooks
    <+> manageHook defaultConfig,
  terminal = "urxvt",
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

myLayout = onWorkspace "9" Full $ avoidStruts $ tiled ||| Mirror tiled ||| multiCol [1] 1 0.01 (-0.5) ||| Full
    where
        tiled = Tall nmaster delta tiled_ratio
        nmaster = 1
        delta = 1/100
        tiled_ratio = 1/2
        dishes_ratio = 24/100

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myStartupHook = setWMName "LG3D"
                >> spawnHere "nm-applet"
                >> spawnHere "blueman-applet"
                >> spawnHere "feh --bg-scale $HOME/.xmonad/background.png"
                >> spawnHere "sleep 15; $HOME/.xmonad/brightness.sh"
                >> spawnOn "9" "whatsapp-for-linux"
                >> spawnOn "9" "slack"
                >> spawnOn "9" "stalonetray"
                >> spawnOn "8" "transmission-gtk"
                >> spawnOn "2" "urxvt"
                >> spawnOn "1" "google-chrome --force-dark-mode"

myManagementHooks :: [ManageHook]
myManagementHooks = [
    (className =? "transmission-qt") --> doF (W.shift "8"),
    (className =? "stalonetray") --> doF (W.shift "9"),
    (className =? "Slack") --> doF (W.shift "9")
  ]
