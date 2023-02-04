module Stories.Header exposing (main)

import Components.Header
import Html exposing (Html)
import Json.Decode
import Storybook.Component
import Storybook.Controls


type alias Controls =
    { username : String
    }


decoder : Storybook.Controls.Decoder Controls
decoder =
    Storybook.Controls.new Controls
        |> Storybook.Controls.withText { id = "username" }


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
    { isSignedIn = not (String.isEmpty controls.username)
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
    Components.Header.view
        { username =
            if model.isSignedIn then
                if String.isEmpty controls.username then
                    Just "Jane Doe"

                else
                    Just controls.username

            else
                Nothing
        , onSignIn = UserClickedSignIn
        , onSignOut = UserClickedSignOut
        }
