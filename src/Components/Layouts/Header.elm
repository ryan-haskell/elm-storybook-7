module Components.Layouts.Header exposing (view)

import Components.Header
import Html exposing (..)


view :
    { content : Html msg
    , username : Maybe String
    , onSignIn : msg
    , onSignOut : msg
    }
    -> Html msg
view props =
    article []
        [ Components.Header.view
            { username = props.username
            , onSignIn = props.onSignIn
            , onSignOut = props.onSignOut
            }
        , props.content
        ]
