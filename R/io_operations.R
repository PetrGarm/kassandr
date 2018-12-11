
#' Read excel files saved from data stream
#'
#' Read excel files saved from data stream
#'
#' Read excel files saved from data stream
#' Transform bad column names
#'
#' @param filename name of the excel file from datastream
#' @param correct_names logical (TRUE) whether column names should be corrected
#' 
#' @return data frame 
#' @export
read_datastream = function(filename, correct_names = TRUE) {
  data = rio::import(filename, skip = 5)
  data_cols = rio::import(filename, skip = 4)
  colnames(data) = colnames(data_cols)
  if (correct_names) {
    colnames(data) = stringr::str_replace_all(colnames(data), "\\.", "_")
    colnames(data) = stringr::str_replace_all(colnames(data), "%", "p")
  }  
  return(data)
}


#' Write csv file for cyrillic MS office
#'
#' Write csv file for cyrillic MS office
#'
#' Write csv file for cyrillic MS office
#' Uses ";" as separator, CP1251 encoding, no column names.
#'
#' @param x data frame
#' @param path path to file
#' 
#' @return results of write operations
#' @export
#' @examples
#' test = dplyr::tibble(x = c("Привет", "Пока"), z = c(1, 2))
#' write_csv2_cp1251(test, path = tempfile())
write_csv2_cp1251 = function(x, path) {
  res = utils::write.table(x, file = path, sep = ";", fileEncoding = "CP1251", col.names = FALSE)
  return(invisible(res))
}