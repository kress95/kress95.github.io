module Main exposing (main)

import Html exposing (Html, div, text)
import Navigation exposing (Location)
import Element.Style exposing (style)
import Misc exposing ((=>))
import Route exposing (Route(..))
import Views.Home as Home

type alias Model =
    { route : Maybe Route
    , view : Maybe View
    }


type View
    = HomeView Home.Model


type Msg
    = UrlChange Location
    | SetHome Home.Model
    | ForHome Home.Model Home.Msg


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- tea


init : Location -> ( Model, Cmd Msg )
init location =
    urlChange location
        { route = Nothing
        , view = Nothing
        }


view : Model -> Html Msg
view ({ view } as model) =
    let
        page =
            case view of
                Just (HomeView child) ->
                    Home.view integrate.home child
        
                _ ->
                    div [] [ text "hi" ]
    in
        div [] [page , style]
    


update : Msg -> Model -> ( Model, Cmd Msg )
update =
    let
        home child model =
            { model | view = Just <| HomeView child }

        update msg model =
            case msg of
                UrlChange location ->
                    urlChange location model

                SetHome child ->
                    home child model => Cmd.none

                ForHome child msg ->
                    home child model => Home.update integrate.home msg child
    in
        update


subscriptions : Model -> Sub Msg
subscriptions { route, view } =
    case view of
        Just (HomeView child) ->
            Home.subscriptions integrate.home child

        Nothing ->
            Sub.none



-- internals


integrate : { home : Home.Config Msg }
integrate =
    { home =
        { apply = SetHome
        , feedback = ForHome
        }
    }


urlChange : Location -> Model -> ( Model, Cmd Msg )
urlChange location model =
    let
        route =
            Route.fromLocation location

        load =
            case route of
                Just Home ->
                    Home.init integrate.home

                _ ->
                    Cmd.none
    in
        { model | route = route, view = Nothing } => load
