import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Graphics.X11.ExtraTypes.XF86

main = xmonad $ defaultConfig {
  borderWidth = 1,
  modMask = mod4Mask,
  terminal = "urxvt",
  startupHook = setWMName "LG3D",
  normalBorderColor = "#666666",
  focusedBorderColor = "#000000"
  } `additionalKeys`
    [
      ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 2%-"),
      ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 2%+"),
      ((0, xF86XK_AudioMute), spawn "amixer set Master toggle"),
      ((shiftMask, xK_Shift_R), spawn "(setxkbmap -query | grep -q 'layout:\\s\\+us') && setxkbmap hu || setxkbmap us")
    ]

