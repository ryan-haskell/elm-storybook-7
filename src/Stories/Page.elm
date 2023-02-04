module Stories.Page exposing (main)

import Components.Layouts.Header
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Decode
import Storybook.Component
import Storybook.Controls
import Svg
import Svg.Attributes as Attr


type alias Controls =
    {}


decoder : Storybook.Controls.Decoder Controls
decoder =
    Storybook.Controls.new Controls


main : Storybook.Component.Component Controls Model Msg
main =
    Storybook.Component.sandbox
        { controls = decoder
        , init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    { isSignedIn : Bool
    }


init : Controls -> Model
init controls =
    { isSignedIn = False
    }



-- UPDATE


type Msg
    = UserClickedSignIn
    | UserClickedSignOut


update : Controls -> Msg -> Model -> Model
update _ msg model =
    case msg of
        UserClickedSignIn ->
            { model | isSignedIn = True }

        UserClickedSignOut ->
            { model | isSignedIn = False }



-- VIEW


view : Controls -> Model -> Html Msg
view controls model =
    Components.Layouts.Header.view
        { username =
            if model.isSignedIn then
                Just "Jane Doe"

            else
                Nothing
        , onSignIn = UserClickedSignIn
        , onSignOut = UserClickedSignOut
        , content = viewExamplePageContent
        }


viewExamplePageContent : Html msg
viewExamplePageContent =
    section
        []
        [ h2 [] [ text "Pages in Storybook" ]
        , p
            []
            [ text "We recommend building UIs with a "
            , a
                [ href
                    "https://blog.hichroma.com/component-driven-development-ce1109d56c8e"
                , target "_blank"
                , rel "noopener noreferrer"
                ]
                [ strong [] [ text "component-driven" ] ]
            , text " process starting with atomic components and ending with pages."
            ]
        , p
            []
            [ text
                "Render pages with mock data. This makes it easy to build and review page states without\n      needing to navigate to them in your app. Here are some handy patterns for managing page data\n      in Storybook:"
            ]
        , ul
            []
            [ li
                []
                [ text
                    "Use a higher-level connected component. Storybook helps you compose such data from the\n        \"args\" of child component stories"
                ]
            , li
                []
                [ text
                    "Assemble data in the page component from your services. You can mock these services out\n        using Storybook."
                ]
            ]
        , p
            []
            [ text "Get a guided tutorial on component-driven development at "
            , a
                [ href "https://storybook.js.org/tutorials/"
                , target "_blank"
                , rel "noopener noreferrer"
                ]
                [ text "Storybook tutorials" ]
            , text ". Read more in the "
            , a
                [ href "https://storybook.js.org/docs"
                , target "_blank"
                , rel "noopener noreferrer"
                ]
                [ text "docs" ]
            , text "."
            ]
        , div [ class "tip-wrapper" ]
            [ span [ class "tip" ] [ text "Tip " ]
            , text "Adjust the width of the canvas with the "
            , Svg.svg
                [ Attr.width "10"
                , Attr.height "10"
                , Attr.viewBox "0 0 12 12"
                , attribute "xmlns" "http://www.w3.org/2000/svg"
                ]
                [ Svg.g
                    [ Attr.fill "none", Attr.fillRule "evenodd" ]
                    [ Svg.path
                        [ Attr.d
                            "M1.5 5.2h4.8c.3 0 .5.2.5.4v5.1c-.1.2-.3.3-.4.3H1.4a.5.5 0\n            01-.5-.4V5.7c0-.3.2-.5.5-.5zm0-2.1h6.9c.3 0 .5.2.5.4v7a.5.5 0 01-1 0V4H1.5a.5.5 0\n            010-1zm0-2.1h9c.3 0 .5.2.5.4v9.1a.5.5 0 01-1 0V2H1.5a.5.5 0 010-1zm4.3 5.2H2V10h3.8V6.2z"
                        , Attr.id "a"
                        , Attr.fill "#999"
                        ]
                        []
                    ]
                ]
            , text " Viewports addon in the toolbar"
            ]
        ]
