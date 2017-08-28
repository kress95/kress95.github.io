module Content.Posts.HelloWorld exposing (post)

import Date exposing (Month(Aug))
import Data.Page as Page exposing (Page)
import Data.Post as Post exposing (Post)
import Misc exposing (date)


post : Post
post =
    { title = "Hello, World!"
    , slug = "hello-world"
    , date = date 25 Aug 2017
    , description = Just description
    , content = content
    , discussion = Nothing
    , image = Nothing
    }



-- internals


description : Post.Description
description =
    "My first post with this not-so-scalable blog."


content : Page.Content
content =
    """
    Hey, this is markdown.

    """
