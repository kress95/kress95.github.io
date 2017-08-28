module Route exposing (Route(..), href, modifyUrl, fromLocation)

import Html exposing (Attribute)
import Html.Attributes as Attr
import Navigation exposing (Location)
import UrlParser as Url exposing (Parser, (</>), s, top, string, custom)
import Content.Pages as Pages
import Content.Posts as Posts
import Data.Page exposing (Url)


type Route
    = Home
    | Page Url
    | Post Url


href : Route -> Attribute msg
href route =
    Attr.href (toString route)


modifyUrl : Route -> Cmd msg
modifyUrl =
    toString >> Navigation.modifyUrl


fromLocation : Location -> Maybe Route
fromLocation location =
    Url.parseHash route location



-- internals


route : Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home top
        , Url.map Page (s "page" </> slug Pages.fromSlug)
        , Url.map Post (s "post" </> slug Posts.fromSlug)
        ]


slug : (String -> Maybe a) -> Parser (String -> b) b
slug base =
    let
        slugParser str =
            base str
                |> Result.fromMaybe ("page " ++ str ++ " not found")
                |> Result.map (always str)
    in
        custom "SLUG" slugParser


toString : Route -> String
toString route =
    let
        pieces =
            case route of
                Home ->
                    []

                Page slug ->
                    [ "page", slug ]

                Post slug ->
                    [ "post", slug ]
    in
        "#/" ++ String.join "/" pieces
