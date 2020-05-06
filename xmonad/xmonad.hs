import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Graphics.X11.ExtraTypes.XF86

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
  focusedBorderColor = "#000000"
  } `additionalKeys`
    [
      ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 2%-"),
      ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 2%+"),
      ((0, xF86XK_AudioMute), spawn "amixer -D pulse set Master 1+ toggle"),
      ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10"),
      ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10"),
      ((shiftMask, xK_Shift_R), spawn "(setxkbmap -query | grep -q 'layout:\\s\\+us') && setxkbmap hu || setxkbmap us")
    ]

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myStartupHook = setWMName "LG3D"
                >> spawnHere "nm-applet"
                >> spawnHere "redshift-gtk"
                >> spawnHere "feh --bg-scale $HOME/.xmonad/background.png"
                >> spawnHere "sleep 15; $HOME/.xmonad/brightness.sh"
                >> spawnOn "8" "slack"
                >> spawnOn "8" "stalonetray"
                >> spawnOn "7" "transmission-qt"
                >> spawnOn "2" "urxvt"
                >> spawnOn "1" "google-chrome"

myManagementHooks :: [ManageHook]
myManagementHooks = [
    (className =? "transmission-qt") --> doF (W.shift "7"),
    (className =? "stalonetray") --> doF (W.shift "8"),
    (className =? "Slack") --> doF (W.shift "8")
  ]
