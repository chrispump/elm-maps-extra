module Areas exposing (..)

import Browser
import Html exposing (Html, div, p, strong, text)
import Html.Attributes
import Html.Events
import Maps
import Maps.Area as Area exposing (Area)
import Maps.Geo
import Maps.Internal.Maps exposing (Msg(..))
import Maps.Map as Map
import Maps.Marker as Marker
import Round
import Svg exposing (Svg, g, path, svg)
import Svg.Attributes exposing (d, fill, height, transform, viewBox, width)
import Time


flensburg : Maps.Geo.LatLng
flensburg =
    Maps.Geo.latLng 54.78827 9.43694


areas =
    List.map
        (\( topLeft, bottomRight, rotation ) ->
            Area.create topLeft bottomRight rotation
        )
        [ ( Maps.Geo.latLng 54.797 9.425
          , Maps.Geo.latLng 54.794 9.435
          , 10
          )
        , ( Maps.Geo.latLng 54.782 9.436
          , Maps.Geo.latLng 54.78 9.438
          , -10
          )
        , ( Maps.Geo.latLng 54.785 9.4365
          , Maps.Geo.latLng 54.783 9.441
          , 20
          )
        , ( Maps.Geo.latLng 54.811 9.452
          , Maps.Geo.latLng 54.809 9.456
          , 5
          )
        , ( Maps.Geo.latLng 54.775 9.459
          , Maps.Geo.latLng 54.773 9.462
          , 30
          )
        ]


main =
    Browser.element
        { init = \() -> init
        , update = Maps.update
        , subscriptions = Maps.subscriptions
        , view = Maps.view
        }


init =
    ( Maps.defaultModel
        |> Maps.updateMap (Map.setZoom 13 >> Map.moveTo flensburg)
        |> Maps.updateAreas (\_ -> areas)
    , Cmd.none
    )
