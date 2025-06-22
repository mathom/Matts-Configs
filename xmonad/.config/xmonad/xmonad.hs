import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops
import Control.Monad (when)


screenBrightness adjustment = do
    let dev = "/sys/class/backlight/acpi_video0/brightness"
    contents <- readFile dev
    let original = read contents :: Integer
    let brightness = min 100 $ max 0 original + adjustment
    when (length contents > 0) $
      writeFile dev $ show brightness

fifoVolume = "$HOME/.local/fifo/xm_vol"

myKeyBinds =
  [ ("<XF86AudioLowerVolume>" , spawn "volume.sh 5%-")
  , ("<XF86AudioRaiseVolume>" , spawn "volume.sh 5%+")
  , ("<XF86AudioMute>"        , spawn "volume.sh toggle")
  , ("<XF86MonBrightnessUp>"  , spawn "brightness.sh 10")
  , ("<XF86MonBrightnessDown>", spawn "brightness.sh -10")
  , ("M-S-w", spawn "xfce4-screenshooter -c -r")
  , ("M-q"  , spawn "killall xmobar;xmonad --recompile;xmonad --restart")
  ]

myStartupHook = do
  spawnOnce "xmobar"

main :: IO ()
-- main = xmonad $ docks def
main = xmonad $ ewmhFullscreen $ ewmh $ xmobarProp $ def
  { terminal = "xfce4-terminal"
  -- , startupHook = myStartupHook
  , layoutHook = avoidStruts $ layoutHook def
  , manageHook = manageHook def <+> manageDocks
  }
  `additionalKeysP` myKeyBinds
