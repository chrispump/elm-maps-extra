module Maps.Internal.Area exposing (Area, AreaStyle, at, border, fill, rotate, view)

import Maps.Internal.LatLng exposing (LatLng)
import Maps.Internal.Screen as Screen
import Svg exposing (Svg)
import Svg.Attributes exposing (width)


type alias AreaStyle =
    { fillColor : String
    , border : Maybe { width : Int, color : String }
    }


type alias Area =
    { corners : List LatLng
    , rotation : Float
    , style : AreaStyle
    }


defaultFillColor : String
defaultFillColor =
    "rgba(0, 128, 255, 0.4)"


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
    , style =
        { fillColor = defaultFillColor
        , border = Nothing
        }
    }


rotate : Float -> Area -> Area
rotate angle area =
    { area | rotation = angle }


border : { width : Int, color : String } -> Area -> Area
border { width, color } ({ style } as area) =
    { area | style = { style | border = Just { width = width, color = color } } }


fill : String -> Area -> Area
fill color ({ style } as area) =
    { area | style = { style | fillColor = color } }


view : (LatLng -> Screen.Offset) -> Area -> Svg msg
view toScreen { corners, rotation, style } =
    let
        points =
            corners
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

        rotatePointAroundCenter ( x, y ) =
            let
                angle =
                    degrees rotation

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

        pointsAttr =
            List.map rotatePointAroundCenter points
                |> List.map (\( x, y ) -> String.fromFloat x ++ "," ++ String.fromFloat y)
                |> String.join " "
    in
    Svg.polygon
        [ Svg.Attributes.points pointsAttr
        , Svg.Attributes.fill style.fillColor
        , Svg.Attributes.stroke (style.border |> Maybe.map .color |> Maybe.withDefault "none")
        , Svg.Attributes.strokeWidth (style.border |> Maybe.map .width |> Maybe.withDefault 0 |> String.fromInt)
        ]
        []
