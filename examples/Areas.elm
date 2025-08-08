module Areas exposing (..)

import Browser
import Maps
import Maps.Area as Area exposing (Area, AreaStyle)
import Maps.Map as Map
import Maps.Geo

flensburg : Maps.Geo.LatLng
flensburg =
    Maps.Geo.latLng 54.78827 9.43694

areas =
  [ ( Maps.Geo.latLng 54.797 9.425
    , Maps.Geo.latLng 54.794 9.435
    , { rotation = 0
    , border = { width = 2, color = "blue" }
    , fill = "rgba(0, 128, 255, 0.4)"
    }
    )
  , ( Maps.Geo.latLng 54.782 9.436
    , Maps.Geo.latLng 54.78 9.438
    , { rotation = 45
    , border = { width = 1, color = "red" }
    , fill = "rgba(255, 0, 0, 0.4)"
    }
    )
  , ( Maps.Geo.latLng 54.785 9.4365
    , Maps.Geo.latLng 54.783 9.441
    , { rotation = 90
    , border = { width = 3, color = "green" }
    , fill = "rgba(0, 255, 0, 0.4)"
    }
    )
  , ( Maps.Geo.latLng 54.811 9.452
    , Maps.Geo.latLng 54.809 9.456
    , { rotation = 30
    , border = { width = 2, color = "purple" }
    , fill = "rgba(128, 0, 128, 0.4)"
    }
    )
  , ( Maps.Geo.latLng 54.775 9.459
    , Maps.Geo.latLng 54.773 9.462
    , { rotation = 60
    , border = { width = 1, color = "orange" }
    , fill = "rgba(255, 165, 0, 0.4)"
    }
    )
  ]
    |> List.map
      (\( topLeft, bottomRight, style ) ->
        Area.create topLeft bottomRight
          |> Area.withRotation style.rotation
          |> Area.withBorder style.border
          |> Area.withFill style.fill
      )

init =
    ( Maps.defaultModel
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


