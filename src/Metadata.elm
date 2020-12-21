module Metadata exposing (ArticleMetadata, Metadata(..), PageMetadata, decoder)

import Date exposing (Date)
import Json.Decode as Decode exposing (Decoder)


type Metadata
    = Page PageMetadata
    | Article ArticleMetadata
    | BlogIndex


type alias ArticleMetadata =
    { title : String
    , description : String
    , published : Date
    , author : Author
    , draft : Bool
    }


type alias Author =
    { name : String
    , bio : String
    }


type alias PageMetadata =
    { title : String }


decoder : Decoder Metadata
decoder =
    Decode.field "type" Decode.string
        |> Decode.andThen
            (\pageType ->
                case pageType of
                    "page" ->
                        Decode.field "title" Decode.string
                            |> Decode.map (\title -> Page { title = title })

                    "blog-index" ->
                        Decode.succeed BlogIndex

                    "blog" ->
                        Decode.map5 ArticleMetadata
                            (Decode.field "title" Decode.string)
                            (Decode.field "description" Decode.string)
                            (Decode.field "published"
                                (Decode.string
                                    |> Decode.andThen
                                        (\isoString ->
                                            case Date.fromIsoString isoString of
                                                Ok date ->
                                                    Decode.succeed date

                                                Err error ->
                                                    Decode.fail error
                                        )
                                )
                            )
                            (Decode.succeed
                                { name = "Yoshitaka Totsuka"
                                , bio = "Elm developer."
                                }
                            )
                            (Decode.field "draft" Decode.bool
                                |> Decode.maybe
                                |> Decode.map (Maybe.withDefault False)
                            )
                            |> Decode.map Article

                    _ ->
                        Decode.fail ("Unexpected page type " ++ pageType)
            )
