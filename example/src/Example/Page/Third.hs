module Example.Page.Third where

import Reflex
import Reflex.Dom

import Example.Session

layout :: DomBuilder t m => AppState -> m (Event t AppState)
layout _ = do
  el "div" $ text "Third"
  return never
