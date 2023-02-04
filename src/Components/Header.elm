module Components.Header exposing (view)

import Components.Button
import Components.Logo
import Html exposing (..)
import Html.Attributes exposing (..)


view :
    { username : Maybe String
    , onSignIn : msg
    , onSignOut : msg
    }
    -> Html msg
view props =
    header []
        [ div [ class "wrapper" ]
            [ Components.Logo.view
            , case props.username of
                Just username ->
                    div []
                        [ span [ class "welcome" ]
                            [ text "Welcome, "
                            , b [] [ text username ]
                            , text "!"
                            ]
                        , Components.Button.new
                            { label = "Log out"
                            }
                            |> Components.Button.withOnClick props.onSignOut
                            |> Components.Button.withStyleSecondary
                            |> Components.Button.withSizeSmall
                            |> Components.Button.view
                        ]

                Nothing ->
                    Components.Button.new
                        { label = "Log in"
                        }
                        |> Components.Button.withOnClick props.onSignIn
                        |> Components.Button.withSizeSmall
                        |> Components.Button.view
            ]
        ]
