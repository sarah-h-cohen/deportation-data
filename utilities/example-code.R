# Example code - Don't use this directly. Instead, copy and edit.
# these aren't functions - just example code for common problems


############## Excel tables in a workbook ########################

# use this library, not the openxlsx
library(openxlsx2)
library(purrr)


# get all of the tables in a workbook

wb <- loadWorkbook(xl_filename)
sheetnames <- sheets(wb)

# Read all tables
# obviously, just doo this with a sheet name rather than map if they want it.
# I'm not sure what happens if it has more than one table on a sheet.
all_data <- map(sheetnames, ~read_sheet_table(wb, .x))
names(all_data) <- sheetnames

# Combine if they have same structure
combined_data <- bind_rows(all_data, .id = "sheet")



