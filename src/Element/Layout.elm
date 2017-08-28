module Element.Layout exposing (header, navbar, content, footer)

import Html
    exposing
        ( Html
        , nav
        , article
        , address
        , hr
        , ul
        , li
        , h1
        , small
        , a
        , text
        )

header : Html msg
header = 
    Html.header []
        [ h1 []
            [ a [] [ text "Chris" ]
            , small [] [ text "@kress @cferraz" ]
            ]
        ]

navbar : Html msg
navbar =
    let
        links =
            [ a [] [ text "Example" ]
            ]

    in
        links
            |> List.map (List.singleton >> li [])
            |> ul []
            |> List.singleton
            |> nav [] 

content : List (Html msg) -> Html msg
content =
    article []

footer : Html msg
footer =
    Html.footer []
        [ text "Footer"
        ]