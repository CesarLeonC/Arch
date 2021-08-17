----------------------------------------------------------------
--	Name:		      Cesar Leon
--	Type:		      Haskell Script
--	E-mail:		    leoncesaralejandro@gmail.com
--	Date:		      August, the 15th/ 2021
--	Description:	XMONAD CONFIGURATION FILE
----------------------------------------------------------------

----------------------------------------------------------------
-- 1. Imports
-- General modules used in the script
-- (THIS SECTION SHOULD BE AT THE BEGINNING OF THE SCRIPT)
----------------------------------------------------------------

import XMonad

import XMonad.Actions.MouseResize
import XMonad.Actions.RotSlaves
import qualified XMonad.Actions.FlexibleResize as Flex

import XMonad.Layout.Grid
import XMonad.Layput.Spacing
import XMonad.Layput.LayoutModifier
import XMonad.Layout.WindowArranger

import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

----------------------------------------------------------------
-- 2. Variables
-- Defining variables used in various hooks and configs
----------------------------------------------------------------

myFont = "xft:"
myModMask = mod4Mask
myTerminal = "alacritty"
myBrowser = "brave-browser"
myIDE = "emacsclient -c -a 'emacs'"
myBorderWidth = 2
myNormColor = "#282c34"
myFocusColor = "#46d9ff"
myWorkspaces = [" broken "," work "," rec "," ide "," vbox "]

----------------------------------------------------------------
-- 3. Keybindings
-- Custom shortcuts to optimize time around xmonad methods.
-- Ordered alphabetically to ensure readability.
-- Keybindings should relate the key with the method.
----------------------------------------------------------------

myKeybindings = [ ("M-t", spawn (myTerminal))                   -- Open Terminal
                , ("M-d", spawn "dmenu_run -i -p \"Run: \"")    -- Open Dmenu
                ]

----------------------------------------------------------------
-- 4. Hooks
-- Using hooks to distinguish from configs in main function.
-- This sections is for Hooks only, no Configs allowed
----------------------------------------------------------------

-- Open apps at startup hook
myStartupHook = do
    spawnOnce "lxsession &"
    spawnOnce "picom -f &"                      -- compositor with fade effect
    spawnOnce "nm-applet &"                     -- network manager applet
    spawnOnce "volumeicon &"                    -- alsamixer volume icon
    spawnOnce "/usr/bin/emacs --daemon &"       -- emacs daemon
    spawnOnce "nitrogen --restore &"            -- wallpaper

-- Layput of windows and xmobar
myBaseLayoutHook = avoidStruts $ Grid ||| tiled ||| Mirror tiled ||| Full
   where
      tiled          = Tall nmaster delta ratio
      nmaster        = 1
      ratio          = 1/2
      delta          = 3/100
      
mySpacing i = spacingRaw        False
            ( Border i i i i )  True
            ( Border i i i i )  True
             
myLayoutHook = mySpacing 5
             $ myBaseLayoutHook
             
----------------------------------------------------------------
-- 5. Configs
-- Personal configs using previously definded data
----------------------------------------------------------------

myConfig = def
           { modMask        = myModMask
           , terminal       = myTerminal
           , borderWidth    = myBorderWidth
           , workspaces     = myWorkspaces
           , startupHook    = myStartupHook
           , layoutHook     = myLayoutHook
           } `additionalKeysP` myKeybindings

myBar = spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc"

----------------------------------------------------------------
-- 5. Main function
-- Wrapping up the configuration, variables and all the other
-- stuff that is needed
----------------------------------------------------------------

main :: IO ()
main = do
  myBar
  xmonad $ docks myConfig
