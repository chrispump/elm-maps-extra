module Example exposing (..)

import Browser
import Maps


main =
    Browser.element
        { init = \() -> ( Maps.defaultModel, Cmd.none )
        , subscriptions = Maps.subscriptions
        , update = Maps.update
        , view = Maps.view
        }
