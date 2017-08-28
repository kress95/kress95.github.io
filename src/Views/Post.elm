module Views.Post exposing (view)

import Html exposing (Html, div, text)


view post =
    div [] [ text post.slug ]
