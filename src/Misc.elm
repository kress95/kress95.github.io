module Misc exposing (..)

import Date exposing (Date, Month)
import Task exposing (Task)
import Date.Extra.Create as Date


type alias Year =
    Int


type alias DayOfMonth =
    Int


(=>) : a -> b -> ( a, b )
(=>) =
    (,)
infixl 0 =>


flipTuple : ( a, b ) -> ( b, a )
flipTuple ( a, b ) =
    ( b, a )


date : DayOfMonth -> Month -> Year -> Date
date day month year =
    Date.dateFromFields year month day 12 0 0 0
