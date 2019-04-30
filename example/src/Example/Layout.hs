{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE TypeFamilies #-}

module Example.Layout
  ( runLayout
  ) where

-----------------------------------------------------------------------------------------------------------------------
import Lens.Micro.Platform ( (^.) )
import Reflex
import Reflex.Dom
-----------------------------------------------------------------------------------------------------------------------
import Reflex.Dom.SpaRouter
-----------------------------------------------------------------------------------------------------------------------
import qualified Example.Page.Deeper as D
import qualified Example.Page.First as F
import qualified Example.Page.Second as S
import qualified Example.Page.Third as T
import Example.Nav.Routes
import Example.Session
import qualified Example.Nav as N
-----------------------------------------------------------------------------------------------------------------------

runLayout :: IO ()
runLayout = mainWidget body

body :: MonadWidget t m => m ()
body =
  elClass "div" "content" $ do
    rec
      dyR <- routePath "" . switchPromptlyDyn =<< holdDyn never evViews

      evViews <- dyn $ ffor dyR $ \as -> do
        evNav <- N.layout as
        evR <- elClass "div" "main" $
          case as ^. view of
            VFirst -> F.layout as
            VSecond -> S.layout as
            VThird -> T.layout as
            VDeeper -> D.layout as
            V404 -> N.pageNotFound as

        return $ leftmost [evNav, evR]
    return ()
