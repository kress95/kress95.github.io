module Views.Home
    exposing
        ( Config
        , Msg
        , Model
        , init
        , view
        , update
        , subscriptions
        )

import Array
import Html exposing (Html, div, h3, a, p, li, text)
import Task exposing (Task)
import Data.Component as Component
import Content.Posts as Posts
import Route exposing (Route(Post), href)


-- model


type alias Model =
    { page : Int }


type Msg
    = Todo


type alias Config msg =
    Component.Controller Model Msg msg {}



-- init


init : Config msg -> Cmd msg
init config =
    Task.perform config.apply <| Task.succeed { page = 0 }



-- update


update : Config msg -> Msg -> Model -> Cmd msg
update config msg model =
    case msg of
        Todo ->
            Task.perform config.apply <| Task.succeed model



-- view


view : Config msg -> Model -> Html msg
view config model =
    div [] <| posts config model


posts : Config msg -> Model -> List (Html msg)
posts =
    let
        title config { slug, title } =
            a [ href <| Post slug ] [ h3 [] [ text title ] ]

        description config { description } =
            description
                |> Maybe.map (text >> List.singleton >> p [])

        post config post =
            li []
                (List.filterMap identity
                    [ Just <| title config post
                    , description config post
                    ]
                )

        view config { page } =
            Posts.posts
                |> Array.slice page ((page + 1) * 20)
                |> Array.toList
                |> List.map (post config)
    in
        view



-- subscriptions


subscriptions : Config msg -> Model -> Sub msg
subscriptions config model =
    Sub.none
