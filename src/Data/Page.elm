module Data.Page
    exposing
        ( Page
        , Title
        , Content
        , Url
        )

-- the simplest data source


type alias Page =
    { title : Title
    , slug : Url
    , content : Content
    }


type alias Title =
    String


type alias Content =
    String


type alias Url =
    String
