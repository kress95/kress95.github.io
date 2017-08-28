module Content.Posts exposing (posts, fromSlug)

import Array exposing (Array)
import Dict exposing (Dict)
import Misc
import Data.Post as Post exposing (Post)
import Content.Posts.HelloWorld as HelloWorld


-- use posts for... err.. blog posts


posts : Array Post
posts =
    Array.fromList
        [ HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        , HelloWorld.post
        ]


fromSlug : String -> Maybe Post
fromSlug str =
    Dict.get str index
        |> Maybe.andThen (flip Array.get posts)



-- internals


index : Dict String Int
index =
    Array.toIndexedList posts
        |> List.map (Misc.flipTuple >> Tuple.mapFirst .slug)
        |> Dict.fromList
