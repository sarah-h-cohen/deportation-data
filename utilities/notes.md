Read "Building a team of internal R packages" by Emily Riederer \*
Utilities - abstraction layer for connecting to data, etc. \* Analysis -
guiding a curated set of methods to answer common questions \* Developer
tools : Better outputs with building blocks like ggplot themes, quarto
templates, Shiny modules.

Example of simple function to connect to local database.

```
get_database_conn <- function() {

conn <-
  DBI::dbConnect(
    drv = odbc::odbc(),
      driver = "driver name here",
      server = "server string here",
      UID = Sys.getenv("DB_USER"),
      PWD = Sys.getenv("DB_PASS"),
      port = "port number here"
  )

return(conn)

}
```

This abstracts the username and password into a sys environment
variable.

Use embedded R markdown templates – this is a style thing, not a
functional thing. I could add to the package to include defaults themes
for reactable tables, for example, which would be better than changing
the css definitions, I think.

Example function: create_bl_html() would have logos, css, etc. A
function that would copy them into the working directory.

R/inst/extdata/\_extensions folder - that quarto needs. Can have
whatever format you need. \_extensions is what Quarto uses.

-   Create \_extensions folder
-   copies files from inst folder in package
-   create new qmd file from the file name arg

meghan.rbind.io

Create internal package if you have one. Even if only to save a ggplot /
other templates. If multiple people are creating the docs, create a
template.
