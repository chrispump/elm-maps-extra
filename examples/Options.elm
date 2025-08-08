module Areas exposing (..)

import Browser
import Maps
import Maps.Map as Map
import Maps.Geo

flensburg : Maps.Geo.LatLng
flensburg =
    Maps.Geo.latLng 54.78827 9.43694

{-| This example how to use options to disable dragging and zooming of the map.
-}
init =
    ( Maps.defaultModel
        |> Maps.updateOptions (\o -> { o | enableDrag = False, enablePinch = False, enableZoom = False })
        |> Maps.updateMap (Map.setZoom 13 >> Map.moveTo flensburg)
        |> Maps.updateAreas (\_ -> areas)
    , Cmd.none
    )

main =
    Browser.element
        { init = \() -> init
        , update = Maps.update
        , subscriptions = Maps.subscriptions
        , view = Maps.view
        }


