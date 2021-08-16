----------------------------------------------------------------
--	Name:		Cesar Leon
--	Type:		Haskell Script
--	E-mail:		leoncesaralejandro@gmail.com
--	Date:		August, the 15th/ 2021
--	Description:	XMONAD CONFIGURATION FILE
----------------------------------------------------------------

----------------------------------------------------------------
-- 1. Imports
-- General modules used in the script
-- (THIS SECTION SHOULD BE AT THE BEGINNING OF THE SCRIPT)
----------------------------------------------------------------

import XMonad

import XMonad.Actions.MouseResize
import XMonad.Actions.WindowArranger
import XMonad.Actions.RotSlaves

import XMonad.Layout.Grid

import XMonad.Util.EZConfig
import XMonad.Util.Run
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

myKeybindings = [ ("M-t", spawn (myTerminal))			-- Open Terminal
                , ("M-d", spawn "dmenu_run -i -p \"Verga: \"")	-- Open Dmenu
                ]

----------------------------------------------------------------
-- 4. Hooks
-- Using hooks to distinguish from configs in main function.
-- 
----------------------------------------------------------------

-- Open apps at startup hook
myStartupHook = do
    spawnOnce "lxsession &"
    spawnOnce "picom -f &"			-- compositor with fade effect
    spawnOnce "nm-applet &"			-- network manager applet
    spawnOnce "volumeicon &"			-- alsamixer volume icon
    spawnOnce "/usr/bin/emacs --daemon &"	-- emacs daemon
    spawnOnce "nitrogen --restore &"		-- wallpaper
    setWMName "FirstWorkspace"			-- Name of Workspace

myLayoutHook = mouseResize
             $ windowArrange
             $ Grid


--myManageHooks = composeAll

----------------------------------------------------------------
-- 5. Configs
----------------------------------------------------------------

main :: IO ()
main = do
       {
       xbar0 <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc"
       xmonad $ ewmh def
           { modMask       = myModMask
           , terminal      = myTerminal
           , borderWidth   = myBorderWidth
           , workspaces    = myWorkspaces
           }
       } `additionalKeysP` myKeybindings
