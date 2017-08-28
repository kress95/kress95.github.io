module Content.Pages exposing (pages, fromSlug)

import Array exposing (Array)
import Dict exposing (Dict)
import Misc
import Data.Page as Page exposing (Page)
import Content.Pages.HelloWorld as HelloWorld


-- use pages for sidebar items


pages : Array Page
pages =
    Array.fromList
        [ HelloWorld.page
        ]


fromSlug : String -> Maybe Page
fromSlug str =
    Dict.get str index
        |> Maybe.andThen (flip Array.get pages)



-- internals


index : Dict String Int
index =
    Array.toIndexedList pages
        |> List.map (Misc.flipTuple >> Tuple.mapFirst .slug)
        |> Dict.fromList
