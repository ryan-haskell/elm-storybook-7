module Components.Button exposing
    ( Button, new
    , view
    , withOnClick, withHref
    , withSizeSmall, withSizeLarge
    , withStyleSecondary
    )

{-|

@docs Button, new
@docs view

@docs withOnClick, withHref
@docs withSizeSmall, withSizeLarge
@docs withStyleSecondary

-}

import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events



-- BUTTON


type Button msg
    = Button
        { label : String
        , onClick : Maybe (Action msg)
        , style : Style
        , size : Size
        }


type Action msg
    = OpenUrl String
    | SendMsg msg


type Style
    = Primary
    | Secondary


type Size
    = Small
    | Medium
    | Large



-- NEW


new : { label : String } -> Button msg
new props =
    Button
        { label = props.label
        , onClick = Nothing
        , style = Primary
        , size = Medium
        }



-- MODIFIERS


withSizeSmall : Button msg -> Button msg
withSizeSmall (Button props) =
    Button { props | size = Small }


withSizeLarge : Button msg -> Button msg
withSizeLarge (Button props) =
    Button { props | size = Large }


withStyleSecondary : Button msg -> Button msg
withStyleSecondary (Button props) =
    Button { props | style = Secondary }


withOnClick : msg -> Button msg -> Button msg
withOnClick onClickMsg (Button props) =
    Button { props | onClick = Just (SendMsg onClickMsg) }


withHref : String -> Button msg -> Button msg
withHref url (Button props) =
    Button { props | onClick = Just (OpenUrl url) }



-- VIEW


view : Button msg -> Html msg
view (Button props) =
    viewElement props.onClick
        [ Attr.class "storybook-button"
        , Attr.classList
            [ ( "storybook-button--primary", props.style == Primary )
            , ( "storybook-button--secondary", props.style == Secondary )
            , ( "storybook-button--small", props.size == Small )
            , ( "storybook-button--medium", props.size == Medium )
            , ( "storybook-button--large", props.size == Large )
            ]
        ]
        [ Html.text props.label
        ]


viewElement :
    Maybe (Action msg)
    -> List (Html.Attribute msg)
    -> List (Html msg)
    -> Html msg
viewElement maybeAction attributes children =
    case maybeAction of
        Just (OpenUrl url) ->
            Html.a
                (Attr.href url :: attributes)
                children

        Just (SendMsg msg) ->
            Html.button
                (Html.Events.onClick msg :: attributes)
                children

        Nothing ->
            Html.button
                attributes
                children
