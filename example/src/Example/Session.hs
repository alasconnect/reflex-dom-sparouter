{-# LANGUAGE
    FlexibleInstances
  , FlexibleContexts
  , FunctionalDependencies
  , MultiParamTypeClasses
  , TemplateHaskell
  , RankNTypes
#-}

module Example.Session where

-----
import Lens.Micro.Platform hiding ( view )
-----
import Reflex.Dom.SpaRouter
import Example.Nav.Routes
-----

data AppState
  = AppState
  { appStateView :: View
  , appStateTrigger :: Maybe Trigger
  }
makeLensesWith camelCaseFields ''AppState

instance SpaState AppState where
  defaultState = defaultAS
  toUrl as = (viewToUrl (as ^. view), as)
  fromUrl (parts, as) = set view (urlPartsToView parts) as

defaultAS :: AppState
defaultAS = AppState VFirst Nothing

setView :: View -> Maybe Trigger -> AppState -> AppState
setView v t = set view v . set trigger t
