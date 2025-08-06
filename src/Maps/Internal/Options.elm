module Maps.Internal.Options exposing
    ( Options
    , defaultOptions
    )


type alias Options =
    { enableDrag : Bool
    , enableZoom : Bool
    , enablePinch : Bool
    }


defaultOptions : Options
defaultOptions =
    { enableDrag = True
    , enableZoom = True
    , enablePinch = True
    }
