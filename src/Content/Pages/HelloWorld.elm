module Content.Pages.HelloWorld exposing (page)

import Data.Page as Page exposing (Page)

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
