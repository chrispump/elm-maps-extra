module Maps.Internal.Area exposing (Area, at, view, withRotation)

import Maps.Internal.LatLng exposing (LatLng)
import Maps.Internal.Screen as Screen
import Svg exposing (Svg, g, path, svg)
import Svg.Attributes exposing (d, fill, height, transform, viewBox, width)


type alias Area =
    { corners : List LatLng
    , rotation : Float
    }


at : LatLng -> LatLng -> Area
at topLeft bottomRight =
    let
        topRight =
            { lat = topLeft.lat, lng = bottomRight.lng }

        bottomLeft =
            { lat = bottomRight.lat, lng = topLeft.lng }
    in
    { corners = [ topLeft, topRight, bottomRight, bottomLeft ]
    , rotation = 0
    }


withRotation : Float -> Area -> Area
withRotation angle area =
    { area | rotation = angle }


view : (LatLng -> Screen.Offset) -> Area -> Svg msg
view toScreen area =
    let
        points =
            area.corners
                |> List.map toScreen
                |> List.map (\p -> ( p.x, p.y ))

        center =
            let
                xs =
                    List.map Tuple.first points

                ys =
                    List.map Tuple.second points
            in
            ( ((List.maximum xs |> Maybe.withDefault 0) + (List.minimum xs |> Maybe.withDefault 0)) / 2
            , ((List.maximum ys |> Maybe.withDefault 0) + (List.minimum ys |> Maybe.withDefault 0)) / 2
            )

        rotate ( x, y ) =
            let
                angle =
                    degrees area.rotation

                dx =
                    x - Tuple.first center

                dy =
                    y - Tuple.second center

                sinA =
                    Basics.sin angle

                cosA =
                    Basics.cos angle
            in
            ( Tuple.first center + dx * cosA - dy * sinA
            , Tuple.second center + dx * sinA + dy * cosA
            )

        rotatedPoints =
            List.map rotate points

        pointsAttr =
            rotatedPoints
                |> List.map (\( x, y ) -> String.fromFloat x ++ "," ++ String.fromFloat y)
                |> String.join " "
    in
    Svg.polygon
        [ Svg.Attributes.points pointsAttr
        , Svg.Attributes.fill "rgba(0, 128, 255, 0.4)"
        , Svg.Attributes.stroke "blue"
        , Svg.Attributes.strokeWidth "2"
        ]
        []
