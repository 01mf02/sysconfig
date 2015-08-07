import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Xfce
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig

-- let Whisker Menu float
--myManageHook = composeAll [ className =? "Wrapper-1.0" --> doFloat ]

main = xmonad $ xfceConfig
	{ startupHook = startupHook xfceConfig >>
	    -- make Java programs resize correctly by pretending we are a
	    -- different WM (camouflage)
	    setWMName "LG3D"

	--, manageHook    = myManageHook <+> manageHook xfceConfig

	  -- inherit layout from desktopConfig
	, layoutHook = desktopLayoutModifiers $
	    -- do not show window borders in fullscreen mode
	    smartBorders $
	    -- switch only between two tiling algorithms instead of three
	    -- as in the default configuration
	    Tall 1 (3/100) (1/2) ||| Full
	, terminal = "exo-open --launch TerminalEmulator"
	}
	`additionalKeys`
	[ ((0       , xK_Print), spawn "xfce4-screenshooter -f")
	, ((mod1Mask, xK_Print), spawn "xfce4-screenshooter -w")
	, ((mod1Mask .|. shiftMask, xK_End), spawn "systemctl poweroff")
	, ((mod4Mask, xK_f), spawn "exo-open --launch FileManager")
	, ((mod4Mask, xK_w), spawn "exo-open --launch WebBrowser")
	, ((mod4Mask, xK_m), spawn "exo-open --launch MailReader")
	, ((mod4Mask, xK_b), spawn "transmission-gtk")
	--, ((mod4Mask, xK_p), spawn "xfce4-display-settings")
	]
