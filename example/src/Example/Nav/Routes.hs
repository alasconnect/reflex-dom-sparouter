module Example.Nav.Routes where

import Data.Text

data View
  = VFirst
  | VSecond
  | VThird
  | VDeeper

  | V404
  deriving (Show, Eq)

data Trigger
  = TPing
  | TPong
  deriving (Show, Eq)

urlPartsToView :: [Text] -> View
urlPartsToView ts =
  case ts of
    [""]                -> VFirst
    ["first"]           -> VFirst
    ["second"]          -> VSecond
    ["third"]           -> VThird
    ["first", "second"] -> VDeeper
    _                   -> V404

viewToUrl :: View -> Text
viewToUrl v =
  case v of
    VFirst  -> "first"
    VSecond -> "second"
    VThird  -> "third"
    VDeeper -> "first/second"
    _       -> "404"
