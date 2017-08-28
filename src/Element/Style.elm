module Element.Style exposing (style)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)
import Html exposing (Html, node)
import Json.Encode as Encode 
import Html.Attributes as Html

style : Html msg
style =
    node "style"
        [ Html.property "innerHTML"
            (Encode.string <| .css <| compile [ css ])
        ]
        []

bgColor =
    hex "f2f2f2"

fgColor =
    hex "444444"

white =
    hex "ffffff"

css : Stylesheet
css =
    (stylesheet << namespace "dreamwriter")
    [ body
        [ margin2 (pct 5) auto
        , backgroundColor bgColor
        , color fgColor
        , fontSize (px 14)
        , lineHeight (pt 1.6)
        , textShadow4 (px 0) (px 1) (px 0) white
        , maxWidth (pct 73)
        , children
            [ header
                [ children
                    [ h1
                        [ children
                            [
                            ]
                        ]
                    ]
                ]
            
            ]
        ]
    ]
--body > div:nth-child(1) > div > header > h1 > a
{--
    body {
        font-family: 'Courier New';
        text-shadow: 0 1px 0 #ffffff;
        max-width: 73%;
    }
    code {background: white;}
    a {
        border-bottom: 1px solid #444444;
        color: #444444;
        text-decoration: none;
    }
    a:hover {border-bottom: 0;}
    h1, h2 {line-height: 1.3;}
--}