module Data.Post
    exposing
        ( Post
        , Description
        , Issue
        , simplePost
        )

import Date exposing (Date)
import Data.Page exposing (Title, Content, Url)


-- a fancy page


type alias Post =
    { title : Title
    , slug : Url
    , description : Maybe Description
    , content : Content
    , date : Date
    , discussion : Maybe Int
    , image : Maybe Url
    }


type alias Description =
    String


type alias Issue =
    String


simplePost : SimplePost -> Post
simplePost { title, slug, content, date } =
    { title = title
    , slug = slug
    , description = Nothing
    , content = content
    , date = date
    , discussion = Nothing
    , image = Nothing
    }



-- internals


type alias SimplePost =
    { title : Title
    , slug : Url
    , content : Content
    , date : Date
    }
