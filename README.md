# elm-maps-extra

An Elm library for interactive maps, originally developed by [kennib](https://github.com/kennib/elm-maps) and further modified by [4onen](https://github.com/4onen/elm-maps).

This library allows you to embed interactive, tile-based maps into your Elm applications with support for markers and now also polygonal areas, as well as various options to customize the map's behavior.

---

## 🚀 Getting Started

A simple map can be created like this:

```elm
import Browser
import Maps

main : Program () (Maps.Model msg) (Maps.Msg msg)
main =
    Browser.element
        { init = \_ -> ( Maps.defaultModel, Cmd.none )
        , update = Maps.update
        , view = Maps.view
        , subscriptions = Maps.subscriptions
        }
```

## 📦 Examples

Below are working examples showcasing the different features of the library:

| Example           | Source Code                                                                                             | Live Demo                                                        |
| ----------------- | ------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| Basic Map         | [Example.elm](https://github.com/chrispump/elm-maps-extra/blob/master/examples/Example.elm)             | [Live](https://kennib.github.io/elm-maps/examples/Example)       |
| Fullscreen Map    | [Fullscreen.elm](https://github.com/chrispump/elm-maps-extra/blob/master/examples/Fullscreen.elm)       | [Live](https://kennib.github.io/elm-maps/examples/Fullscreen)    |
| Map Markers       | [Markers.elm](https://github.com/chrispump/elm-maps-extra/blob/master/examples/Markers.elm)             | [Live](https://kennib.github.io/elm-maps/examples/Markers)       |
| Custom Markers    | [CustomMarkers.elm](https://github.com/chrispump/elm-maps-extra/blob/master/examples/CustomMarkers.elm) | [Live](https://kennib.github.io/elm-maps/examples/CustomMarkers) |
| Geocode Search    | [Search.elm](https://github.com/chrispump/elm-maps-extra/blob/master/examples/Search.elm)               | [Live](https://kennib.github.io/elm-maps/examples/Search)        |
| Geocode + Markers | [SearchMarkers.elm](https://github.com/chrispump/elm-maps-extra/blob/master/examples/SearchMarkers.elm) | [Live](https://kennib.github.io/elm-maps/examples/SearchMarkers) |
| Draw Areas        | [Areas.elm](https://github.com/chrispump/elm-maps-extra/blob/main/examples/Areas.elm)                   | -                                                                |
| Options           | [Options.elm](https://github.com/chrispump/elm-maps-extra/blob/main/examples/Areas.elm)                 | -                                                                |

---

## 📚 Documentation

You can find full documentation of the latest API on the [Elm package site](https://package.elm-lang.org/packages/kennib/elm-maps/latest/Maps).

---

## 🙏 Credits

- Original work by [kennib](https://github.com/kennib/elm-maps)
- Updated to Elm 19.0 by [4onen](https://github.com/4onen/elm-maps)
