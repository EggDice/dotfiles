import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Graphics.X11.ExtraTypes.XF86

main = xmonad $ defaultConfig {
  borderWidth = 1,
  modMask = mod4Mask,
  workspaces = myWorkspaces,
  terminal = "urxvt",
  startupHook = myStartupHook,
  normalBorderColor = "#666666",
  focusedBorderColor = "#000000"
  } `additionalKeys`
    [
      ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 2%-"),
      ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 2%+"),
      ((0, xF86XK_AudioMute), spawn "amixer set Master toggle"),
      ((shiftMask, xK_Shift_R), spawn "(setxkbmap -query | grep -q 'layout:\\s\\+us') && setxkbmap hu || setxkbmap us")
    ]

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myStartupHook = setWMName "LG3D"
                >> spawnHere "nm-applet"
                >> spawnHere "feh --bg-scale $HOME/.xmonad/background.png"
                >> spawnHere "sleep 15; $HOME/.xmonad/brightness.sh"
                >> spawnOn "9" "slack"
                >> spawnOn "8" "stalonetray"
                >> spawnOn "2" "urxvt"
                >> spawnOn "1" "google-chrome"

