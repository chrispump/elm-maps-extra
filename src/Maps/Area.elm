module Maps.Area exposing
    ( Area
    , create
    )

{-| Work with rectangular map areas (polygons) defined by two corners and an optional rotation.

This module provides a simplified interface for creating and using rectangular areas on a map.
It wraps the internal polygon logic and exposes a clean public API.


# Types

@docs Area


# Create

@docs create

-}

import Maps.Geo
import Maps.Internal.Area as Area


{-| Represents a rectangular polygonal area on the map.
This type is opaque and should be created using the `create` function.
-}
type alias Area =
    Area.Area


{-| Create a rectangular area from a top-left and bottom-right coordinate,
with a rotation in degrees (clockwise, around the center of the rectangle).

    import Maps.Area
    import Maps.Geo exposing (latLng)

    myArea =
        Maps.Area.create
            (latLng 52.52 13.38)
            -- top-left
            (latLng 52.51 13.39)
            -- bottom-right
            30

    -- rotation in degrees

-}
create : Maps.Geo.LatLng -> Maps.Geo.LatLng -> Float -> Area
create topLeft bottomRight rotation =
    Area.at topLeft bottomRight
        |> Area.withRotation rotation
