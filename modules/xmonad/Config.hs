import XMonad
import XMonad.Config.Kde
import qualified XMonad.StackSet as W -- to shift and float windows

main = xmonad kdeConfig
    { terminal   = "kitty"
    , modMask    = mod4Mask -- use the Windows button as mod
    , manageHook = manageHook kdeConfig
    }

