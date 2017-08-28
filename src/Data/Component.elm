module Data.Component exposing (Observer, Controller, apply, feedback)


type alias Observer model parent a =
    { a | apply : model -> parent }


type alias Controller model msg parent a =
    Observer model parent { a | feedback : model -> msg -> parent }


apply : Observer model parent a -> model -> parent
apply { apply } =
    apply


feedback : Controller model msg parent a -> model -> msg -> parent
feedback { feedback } =
    feedback
