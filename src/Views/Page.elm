module Views.Page exposing (view)

import Html exposing (Html, div, text)


view page =
    div [] [ text page.slug ]
