module Static.View exposing (siteFooter, siteHeader, viewArticle)

import Css exposing (..)
import Css.Global exposing (a, adjacentSiblings, blockquote, children, code, dd, descendants, details, div, dl, dt, each, h1, h2, h3, h4, h5, h6, hr, img, li, ol, p, selector, summary, td, th, tr, ul, withAttribute)
import Html.Styled as Html exposing (Attribute, Html, text)
import Html.Styled.Attributes exposing (css, href)


siteHeader : Html Never
siteHeader =
    Html.header
        [ css
            [ padding2 (px 20) (px 20)
            , backgroundColor (hex "#666")
            , color (hex "#fff")
            ]
        ]
        [ Html.h1
            [ css
                [ display block
                , width (px 620)
                , margin2 zero auto
                , fontSize (px 15)
                , fontWeight normal
                ]
            ]
            [ Html.a
                [ href "/"
                , css
                    [ textDecoration none
                    , color inherit
                    ]
                ]
                [ text "y047aka.space" ]
            ]
        ]


siteFooter : Html Never
siteFooter =
    Html.footer
        [ css
            [ padding2 (px 20) (px 20)
            , textAlign right
            , fontSize (px 15)
            , backgroundColor (hex "#666")
            , color (hex "#fff")
            ]
        ]
        [ Html.p
            [ css
                [ width (px 620)
                , margin2 zero auto
                ]
            ]
            [ text "© 2020 y047aka" ]
        ]


viewArticle : List (Attribute Never) -> List (Html Never) -> Html Never
viewArticle attributes elements =
    Html.article
        (css
            [ property "-ms-text-size-adjust" "100%"
            , property "-webkit-text-size-adjust" "100%"
            , lineHeight (num 1.5)
            , color (hex "#24292e")
            , fontFamilies [ qt "-apple-system", qt "BlinkMacSystemFont", qt "Segoe UI", qt "Helvetica", qt "Arial,sans-serif", qt "Apple Color Emoji", qt "Segoe UI Emoji" ]
            , fontSize (px 16)
            , lineHeight (num 1.5)
            , property "word-wrap" "break-word"
            , descendants
                [ details
                    [ display block ]
                , summary
                    [ display listItem ]

                -- 中略
                , a
                    [ color (hex "#0366d6")
                    , textDecoration none
                    , hover
                        [ textDecoration underline ]
                    ]

                -- 中略
                , Css.Global.table
                    [ borderSpacing zero
                    , borderCollapse collapse
                    ]
                , each [ th, td ]
                    [ padding zero ]

                -- 中略
                , each [ h1, h2, h3, h4, h5, h6 ]
                    [ marginTop zero
                    , marginBottom zero
                    ]
                , h1
                    [ fontSize (px 32) ]
                , each [ h1, h2 ]
                    [ fontWeight (int 600) ]
                , h2
                    [ fontSize (px 24) ]
                , h3
                    [ fontSize (px 20) ]
                , each [ h3, h4 ]
                    [ fontWeight (int 600) ]
                , h4
                    [ fontSize (px 16) ]
                , h5
                    [ fontSize (px 14) ]
                , each [ h5, h6 ]
                    [ fontWeight (int 600) ]
                , h6
                    [ fontSize (px 12) ]
                , p
                    [ marginTop zero
                    , marginBottom (px 10)
                    ]
                , blockquote
                    [ margin zero ]
                , each [ ol, ul ]
                    [ paddingLeft zero
                    , marginTop zero
                    , marginBottom zero
                    ]
                , each
                    [ selector "ol ol"
                    , selector "ul ol"
                    ]
                    [ listStyleType lowerRoman ]
                , each
                    [ selector "ol ol ol"
                    , selector "ol ul ol"
                    , selector "ul ol ol"
                    , selector "ul ul ol"
                    ]
                    [ listStyleType lowerAlpha ]
                , dd
                    [ marginLeft zero ]
                , each [ code, Css.Global.pre ]
                    [ fontFamilies [ qt "SFMono-Regular", qt "Consolas", qt "Liberation Mono", qt "Menlo", monospace.value ]
                    , fontSize (px 12)
                    ]
                , Css.Global.pre
                    [ marginTop zero
                    , marginBottom zero
                    ]

                -- 中略
                , each
                    [ blockquote
                    , details
                    , dl
                    , ol
                    , p
                    , Css.Global.pre
                    , Css.Global.table
                    , ul
                    ]
                    [ marginTop zero
                    , marginBottom (px 16)
                    ]
                , hr
                    [ height (em 0.25)
                    , padding zero
                    , margin2 (px 24) zero
                    , backgroundColor (hex "#e1e4e8")
                    , border zero
                    ]
                , blockquote
                    [ padding2 zero (em 1)
                    , color (hex "#6a737d")
                    , borderLeft3 (em 0.25) solid (hex "#dfe2e5")
                    , children
                        [ selector ":first-child"
                            [ marginTop zero ]
                        , selector ":last-child"
                            [ marginBottom zero ]
                        ]
                    ]
                , each [ h1, h2, h3, h4, h5, h6 ]
                    [ marginTop (px 24)
                    , marginBottom (px 16)
                    , fontWeight (int 600)
                    , lineHeight (num 1.25)
                    ]
                , h1
                    [ fontSize (em 2) ]
                , each [ h1, h2 ]
                    [ paddingBottom (em 0.3)
                    , borderBottom3 (px 1) solid (hex "#eaecef")
                    ]
                , h2
                    [ fontSize (em 1.5) ]
                , h3
                    [ fontSize (em 1.25) ]
                , h4
                    [ fontSize (em 1) ]
                , h5
                    [ fontSize (em 0.875) ]
                , h6
                    [ fontSize (em 0.85)
                    , color (hex "#6a737d")
                    ]
                , each [ ol, ul ]
                    [ paddingLeft (em 2)
                    ]
                , each
                    [ selector "ol ol"
                    , selector "ol ul"
                    , selector "ul ol"
                    , selector "ul ul"
                    ]
                    [ marginTop zero
                    , marginBottom zero
                    ]
                , li
                    [ property "word-wrap" "break-all"
                    , children
                        [ p
                            [ marginTop (px 16) ]
                        ]
                    , adjacentSiblings
                        [ li
                            [ marginTop (em 0.25) ]
                        ]
                    ]
                , dl
                    [ padding zero
                    , descendants
                        [ dt
                            [ padding zero
                            , marginTop (px 16)
                            , fontSize (em 1)
                            , fontStyle italic
                            , fontWeight (int 600)
                            ]
                        , dd
                            [ padding2 zero (px 16)
                            , marginBottom (px 16)
                            ]
                        ]
                    ]
                , Css.Global.table
                    [ display block
                    , width (pct 100)
                    , overflow auto
                    , descendants
                        [ th
                            [ fontWeight (int 600) ]
                        , each [ th, td ]
                            [ padding2 (px 6) (px 13)
                            , border3 (px 1) solid (hex "#dfe2e5")
                            ]
                        , tr
                            [ backgroundColor (hex "#fff")
                            , borderTop3 (px 1) solid (hex "#c6cbd1")
                            , nthChild "2n"
                                [ backgroundColor (hex "#f6f8fa") ]
                            ]
                        ]
                    ]
                , img
                    [ maxWidth (pct 100)
                    , boxSizing initial
                    , backgroundColor (hex "#fff")
                    , withAttribute "align=right"
                        [ paddingLeft (px 20) ]
                    , withAttribute "align=left"
                        [ paddingRight (px 20) ]
                    ]
                , code
                    [ padding2 (em 0.2) (em 0.4)
                    , margin zero
                    , fontSize (pct 85)
                    , backgroundColor (rgba 27 31 35 0.05)
                    , borderRadius (px 3)
                    ]
                , Css.Global.pre
                    [ property "word-wrap" "normal"
                    , children
                        [ code
                            [ padding zero
                            , margin zero
                            , fontSize (pct 100)
                            , property "word-break" "normal"
                            , whiteSpace pre
                            , property "background" "transparent"
                            , border zero
                            ]
                        ]
                    ]
                , Css.Global.pre
                    [ padding (px 16)
                    , overflow auto
                    , fontSize (pct 85)
                    , lineHeight (num 1.45)
                    , backgroundColor (hex "#f6f8fa")
                    , borderRadius (px 3)
                    , descendants
                        [ code
                            [ display inline
                            , property "max-width" "auto"
                            , padding zero
                            , margin zero
                            , overflow visible
                            , lineHeight inherit
                            , property "word-wrap" "normal"
                            , backgroundColor initial
                            , border zero
                            ]
                        ]
                    ]
                ]
            ]
            :: attributes
        )
        elements