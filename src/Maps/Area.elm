module Maps.Area exposing
    ( Area
    , AreaStyle
    , create
    , withRotation
    , withBorder
    , withFill
    )

{-| Work with rectangular map areas (polygons) defined by two corners and an optional rotation.

This module provides a simplified interface for creating and using rectangular areas on a map.
It wraps the internal polygon logic and exposes a clean public API.


# Types

@docs Area
@docs AreaStyle


# Create

@docs create
@docs withRotation
@docs withBorder
@docs withFill

-}

import Maps.Geo
import Maps.Internal.Area as Internal


{-| Represents a rectangular polygonal area on the map.
-}
type alias Area =
    Internal.Area


{-| Represents the style of an area, including fill color and optional border.
-}
type alias AreaStyle =
    Internal.AreaStyle


{-| Create a rectangular area from a top-left and bottom-right coordinate,
with a rotation in degrees (clockwise, around the center of the rectangle).

    import Maps.Area
    import Maps.Geo exposing (latLng)

    myArea =
        Maps.Area.create
            -- top-left
            (latLng 52.52 13.38)
            -- bottom-right
            (latLng 52.51 13.39)
            -- rotation in degrees
            30

-}
create : Maps.Geo.LatLng -> Maps.Geo.LatLng -> Area
create =
    Internal.at


{-| Set the rotation of an area in degrees (clockwise, around the center of the rectangle).

    import Maps.Area exposing (Area, withRotation)

    myArea : Area
    myArea =
        Maps.Area.create
            (Maps.Geo.latLng 52.52 13.38)
            (Maps.Geo.latLng 52.51 13.39)
            |> withRotation 45

-}
withRotation : Float -> Area -> Area
withRotation =
    Internal.rotate


{-| Set the border of an area with a specified width and color.

    import Maps.Area exposing (Area, withBorder)

    myArea : Area
    myArea =
        Maps.Area.create
            (Maps.Geo.latLng 52.52 13.38)
            (Maps.Geo.latLng 52.51 13.39)
            |> withBorder { width = 2, color = "blue" }

-}
withBorder : { width : Int, color : String } -> Area -> Area
withBorder =
    Internal.border


{-| Set the fill color of an area.

    import Maps.Area exposing (Area, withFill)

    myArea : Area
    myArea =
        Maps.Area.create
            (Maps.Geo.latLng 52.52 13.38)
            (Maps.Geo.latLng 52.51 13.39)
            |> withFill "rgba(0, 128, 255, 0.4)"

-}
withFill : String -> Area -> Area
withFill =
    Internal.fill
