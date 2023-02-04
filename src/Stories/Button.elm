module Stories.Button exposing (main)

import Components.Button
import Html exposing (Html)
import Json.Decode
import Storybook.Component
import Storybook.Controls


type alias Controls =
    { label : String
    , isPrimary : Bool
    , size : Maybe Size
    }


type Size
    = Small
    | Medium
    | Large


decoder : Storybook.Controls.Decoder Controls
decoder =
    Storybook.Controls.new Controls
        |> Storybook.Controls.withText { id = "label" }
        |> Storybook.Controls.withBoolean { id = "primary" }
        |> Storybook.Controls.withSelect
            { id = "size"
            , options =
                [ ( "small", Small )
                , ( "medium", Medium )
                , ( "large", Large )
                ]
            }


main : Storybook.Component.Component Controls () Msg
main =
    Storybook.Component.new
        { controls = decoder
        , view = view
        }


type Msg
    = UserClickedButton



-- VIEW


view : Controls -> Html Msg
view controls =
    let
        withStyle : Components.Button.Button msg -> Components.Button.Button msg
        withStyle button =
            if controls.isPrimary then
                button

            else
                button
                    |> Components.Button.withStyleSecondary

        withSize : Components.Button.Button msg -> Components.Button.Button msg
        withSize button =
            case controls.size of
                Just Small ->
                    button
                        |> Components.Button.withSizeSmall

                Just Medium ->
                    button

                Just Large ->
                    button
                        |> Components.Button.withSizeLarge

                Nothing ->
                    button
    in
    Components.Button.new
        { label = controls.label
        }
        |> Components.Button.withOnClick UserClickedButton
        |> withStyle
        |> withSize
        |> Components.Button.view
