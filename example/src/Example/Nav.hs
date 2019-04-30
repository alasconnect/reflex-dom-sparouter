module Example.Nav where

import Reflex
import Reflex.Dom

import Example.Nav.Routes
import Example.Session

layout :: DomBuilder t m => AppState -> m (Event t AppState)
layout as = el "div" $ do
  evF <- button "First"
  evS <- button "Second"
  evT <- button "Third"
  evD <- button "Deeper"
  return $ leftmost
    [ setView VFirst Nothing as <$ traceEventWith (\_ -> "First") evF
    , setView VSecond Nothing as <$ traceEventWith (\_ -> "Second") evS
    , setView VThird Nothing as <$ traceEventWith (\_ -> "Third") evT
    , setView VDeeper Nothing as <$ traceEventWith (\_ -> "Fourth") evD
    ]

pageNotFound :: DomBuilder t m => AppState -> m (Event t AppState)
pageNotFound as = do
  el "div" $ text "We got 404 pages, but this ain't one."
  el "div" $ do
    evF <- button "First"
    return $ setView VFirst Nothing as <$ evF
