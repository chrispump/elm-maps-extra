module Maps.Area exposing
    ( Area
    , create
    )

import Maps.Geo
import Maps.Internal.Area as Area


type alias Area =
    Area.Area


create : Maps.Geo.LatLng -> Maps.Geo.LatLng -> Float -> Area
create topLeft bottomRight rotation =
    Area.at topLeft bottomRight
        |> Area.withRotation rotation



-- Create an area from two LatLng points (top-left and bottom-right)
