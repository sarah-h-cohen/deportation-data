
# if you want it to inherit from the pages, add something that
# says customStyles = list( color = "inherit")

create_react_theme <- function ( )

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

