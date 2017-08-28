module Content.Pages.HelloWorld exposing (page)

import Date exposing (Month(Aug))
import Data.Page as Page exposing (Page)
import Misc exposing (date)


page : Page
page =
    { title = "Hello, World!"
    , slug = "hello-world"
    , content = content
    }



-- internals


content : Page.Content
content =
    """
    Hey, this is markdown.

    """
