library(dplyr)
library(rvest)
library(stringr)


#' Extract download links from one page search page in \href{https://www.reachresourcecentre.info/}{REACH Resource Centre (RC)}
#'
#' @param search_URL string with a search URL from REACH RC.
#'
#' @return list of links to files from the search
#' @export
#'
#' @examples
#' \dontrun{
#' RC_extract_onePage("https://www.reachresourcecentre.info/search/?search=1&initiative%5B%5D=reach&ptheme%5B%5D=cash&dates=&keywords=JMMI")
#' }
RC_extract_onePage <- function(search_URL){
  RC_links <- read_html(search_URL)%>%
    html_nodes(".document-download-link")%>%
    xml_attr("href")
  return(RC_links)
}


#' Extract download links from all pages from a search URL in \href{https://www.reachresourcecentre.info/}{REACH Resource Centre (RC)}
#'
#' @param search_URL string with a search URL from REACH RC.
#'
#' @return list of links to files from the search
#' @export
#'
#' @examples
#' \dontrun{
#' RC_extract_allPages("https://www.reachresourcecentre.info/search/?search=1&initiative%5B%5D=reach&ptheme%5B%5D=cash&dates=&keywords=JMMI")
#' }
RC_extract_allPages <- function(search_URL){
  
  URL_pages <- suppressWarnings(read_html(search_URL)%>%
    html_nodes(".outputs-filter")%>%
    str_extract(regex("(\\d+)(?!.*\\d)")))
  
  search_part_URL <- str_extract(search_URL, "\\?search.*$")
  
  list_urls <- lapply(rep(1:as.numeric(URL_pages)), function(x)paste0("https://www.reachresourcecentre.info/search/page/", x, "/", search_part_URL))
  
  extract_all <- lapply(list_urls, RC_extract_onePage)
  extract_all_unlisted <- unlist(extract_all)
  
  return(extract_all_unlisted)
}

#' Download file from \href{https://www.reachresourcecentre.info/}{REACH Resource Centre (RC)}
#'
#' @param file_url string URL to file
#' @param destination_folder string folder path to the destination folder where the data will be downloaded. If the folder does not exist, it will be created
#'
#' @return the file from the file_url
#' @export
#'
#' @examples
#' \dontrun{
#' file_url <- RC_extract_onePage("https://www.reachresourcecentre.info/search/?search=1&initiative%5B%5D=reach&ptheme%5B%5D=cash&dates=&keywords=JMMI")[1]
#' download_file(file_url, "data")
#' }
download_file <- function(file_url, destination_folder){
  if(!dir.exists(destination_folder)){
    dir.create(destination_folder)
  }
  
  file_name <- str_extract(file_url, "[^/]+$")
  download.file(file_url, paste0(destination_folder, "/", file_name), mode = "wb")
  Sys.sleep(1)
}

#' Download files from list of URLs from \href{https://www.reachresourcecentre.info/}{REACH Resource Centre (RC)}
#'
#' @param url_list list of URLs to files from the RC
#' @param destination_folder string folder path to the destination folder where the data will be downloaded. If the folder does not exist, it will be created
#'
#' @return files from the file_url
#' @export
#'
#' @examples
#' \dontrun{
#' file_urls <- RC_extract_onePage("https://www.reachresourcecentre.info/search/?search=1&initiative%5B%5D=reach&ptheme%5B%5D=cash&dates=&keywords=JMMI")
#' download_files(file_urls, "data")
#' }
download_files <- function(url_list, destination_folder){
  if(!dir.exists(destination_folder)){
    dir.create(destination_folder)
  }
  lapply(url_list, download_file, destination_folder = destination_folder)
    
}
