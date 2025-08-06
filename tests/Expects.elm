module Expects exposing
    ( equalLatLng
    , equalMap
    , equalOffsets
    )

import Expect exposing (Expectation)
import Maps.Internal.LatLng exposing (LatLng)
import Maps.Internal.Map exposing (Map)
import Maps.Internal.Screen exposing (Offset)
import Maps.Internal.Utils exposing (wrap)


equalMap : Float -> Map -> Map -> Expectation
equalMap delta mapAs mapBs =
    Expect.all
        [ \( mapA, mapB ) -> Expect.equal mapA.tileServer mapB.tileServer
        , \( mapA, mapB ) -> Expect.equal mapA.zoom mapB.zoom
        , \( mapA, mapB ) -> equalLatLng delta mapA.center mapB.center
        , \( mapA, mapB ) -> Expect.equal mapA.width mapB.width
        , \( mapA, mapB ) -> Expect.equal mapA.height mapB.height
        , \( mapA, mapB ) -> Expect.equal mapA.tileSize mapB.tileSize
        ]
        ( mapAs, mapBs )


equalLatLng : Float -> LatLng -> LatLng -> Expectation
equalLatLng delta latLngA latLngB =
    let
        latDiff =
            abs <| latLngA.lat - latLngB.lat

        lngDiff =
            abs <| (latLngA.lng |> wrap -180 180) - (latLngB.lng |> wrap -180 180)
    in
    Expect.equal True <|
        latDiff
            < delta
            && lngDiff
            < delta


equalOffsets : Float -> Offset -> Offset -> Expectation
equalOffsets delta offsetA offsetB =
    let
        xDiff =
            abs <| offsetA.x - offsetB.x

        yDiff =
            abs <| offsetA.y - offsetB.y
    in
    Expect.equal True <|
        xDiff
            < delta
            && yDiff
            < delta
