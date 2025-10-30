# convenience functions

# requires tidyverse, readxl, opensxlx, here, glue
# to be added BEFORE running any scripts


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



## Read an Excel Data Table - assumes only one table per sheet

get_excel_data_table <- function ( wbobject, sheetname ) {
  # s/b relative path to project and/or folder in RStudio/Positron
  # the problem is that read_excel doesn't recognize very high range numbers
  # have to convert to A1:C format, using the entire columns.

    table =  getTables(wb, sheet=sheetname)
    if !exists (table[[1]]) {
      return NA
    }



}



getTables(wb, sheetnames[1])


  sheetnames[map_lgl(sheetnames, ~length(getTables(wb, .x)) > 0)]

length(getTables (wb, 2))

# If you know the table name
mydata <- openxlsx::read.xlsx(
  xlsxFile = here(xl_filename),
  sheet = 1,
  table = TRUE  # This reads the first table on the sheet
)

# Or specify table name explicitly
table_name <- getTables(wb, sheet = mysheet)
mydata <- read.xlsx(
  xlsxFile = xl_filename,
  sheet = mysheet,
  namedRegion = table_name
)
Option 2: Use the Table Range You Already Have
r
Copy code
library(openxlsx)

wb <- loadWorkbook(xl_filename)
sheetnames <- sheets(wb)
mysheet <- sheetnames[1]

# Get table reference
table_ref <- getTables(wb, mysheet)
table_range <- attr(table_ref, "refs")

# Read using that range
mydata <- read.xlsx(
  xlsxFile = xl_filename,
  sheet = mysheet,
  rows = NULL,  # Will be determined by range
  cols = NULL,
  namedRegion = table_ref  # Use the table name
)
Option 3: Simplest - Just Use table = TRUE
r
Copy code
library(openxlsx)

# Reads the first table found on the sheet
mydata <- read.xlsx(
  xlsxFile = xl_filename,
  sheet = 1,
  table = TRUE
)

library(openxlsx)
library(purrr)

wb <- loadWorkbook(xl_filename)
sheetnames <- sheets(wb)

# Function to read table from a sheet
read_sheet_table <- function(wb, sheet_name) {
  tables <- getTables(wb, sheet_name)

  if (length(tables) == 0) {
    message("No table found in sheet: ", sheet_name)
    return(NULL)
  }

  read.xlsx(
    xlsxFile = xl_filename,
    sheet = sheet_name,
    namedRegion = tables[1]  # Read first table
  )
}

# Read all tables
all_data <- map(sheetnames, ~read_sheet_table(wb, .x))
names(all_data) <- sheetnames

# Combine if they have same structure
combined_data <- bind_rows(all_data, .id = "sheet")
