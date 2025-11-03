# convenience functions
# convenience functions
# dependencies: tidyverse, janitor, readxl, openxlsx2, here, glue

# count numbr of rows with missing values in the specified column, optionally
# filtered by a condition represented in a string.
missing_nrow <- function(df, missing_column, optional_filter = NULL) {
  if (!is.null(optional_filter)) {
    df = df |> dplyr::filter(!!rlang::parse_expr(optional_filter))
  }

  filtered_df = df |> dplyr::filter(is.na(.data[[missing_column]]))
  nrow(filtered_df)
}

# Round to nearest N means  you can use 500, not just 1, 100, 1000, etc.
# Uses R rounding method, which would take 449.5 to 448, not 500, but I don't think
# it matters here. There won't be anything that odd.
round_nearest_n <- function (x,  n ) {
  rounded_value = round ( x / n) * n
  return (formatC(rounded_value, format = "d", big.mark = ",") )
}

# Takes an optional  list of objects, a string vector, and a file name
# to save an Rda with objects renamed from the original.
# example: saveit (  master_xl, lookup_tables, df_recoded ,
#                   string = c("arrest_original", 'arrest_lookups', "arrest_recoded") ,
#                   file = "/data/processed/arrests.Rda")
# the number of items in the vector have to match the number provided in the unlisted list

saveit <- function(..., string, file) {
        x <- list(...)
        names(x) <- string
        save(list=names(x), file=file, envir=list2env(x))
    }

## Create custom reactable theme with my options
## Edit anything here that you want to change for a project
## This is colors and widths, not actual table options.

create_react_theme <- function ( )

# most of these can be mapped using the final colors using
# var(--gray-200) etc.
# also, the custom.scss has some of these colors. I'll have to check
# at some point to see which ones are

# My usual custom colors are:

# theme-teal, theme-blue, theme-red, theme-bg-subtle, theme-light, theme-dark
# tbl-header-sort, tbl-header-bg, tbl-header-col, tbl-striped-col

# also has rt-header color using tbl-header-bg, tbl-header-col, font-varian small-caps,
# which these will override.

# take a look at what I can do with scss instead of this.


    react_theme <-


      reactableTheme(
        color = "var(--gray-200)",
        borderColor = "var(--gray-500)",
        borderWidth = "1px",
        stripedColor = "#f6f8fa",
        cellPadding = "6 px",
        # instead of 15
        tableStyle = list(fontSize = "smaller"),
        headerStyle = list(
          borderWidth = "2px",
          backgroundColor = "#f8f5f0",
          color = "#7c7a78",
          transitionDuration = "0.5s",
          "&:hover[aria-sort]" = list(color = "#000000"),
          "&[aria-sort='ascending'], &[aria-sort='descending']" = list(color = "#000000"),
          fontSize = "16px"
        ),
        searchInputStyle = list(
          backgroundColor = "#ffffff",
          color = "#3e3f3a",
          borderColor = "#bcbfc1",
          "&:focus" = list(color = "#3e3f3a"),
          width = "100%"
        ),
        inputStyle = list(
          backgroundColor = "#ffffff",
          borderColor = "#bcbfc1",
          color = "#3e3f3a"
        ),
        rowSelectedStyle = list(backgroundColor = "#dfd7ca", color = "#8e8c84"),
        selectStyle = list(
          backgroundColor = "#dfd7ca",
          color = "#8e8c84",
          borderColor = "#ffffff",
          outlineColor = "#ffffff"
        ),
        pageButtonStyle = list(
          backgroundColor = "#f8f5f0",
          color = "#8e8c84",
          "&:hover" = list(backgroundColor = "#f3969a", color = "#8e8c84")
        ),
        pageButtonHoverStyle = list(backgroundColor = "#dfd7ca", color = "#8e8c84"),
        pageButtonActiveStyle = list(backgroundColor = "#dfd7ca", color = "#8e8c84"),
        pageButtonCurrentStyle = list(backgroundColor = "#dfd7ca", color = "#8e8c84")
      )


