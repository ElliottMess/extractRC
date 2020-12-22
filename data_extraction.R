library(dplyr)
library(rvest)
library(stringr)


RC_extract_onePage <- function(search_URL){
  RC_links <- read_html(search_URL)%>%
    html_nodes(".document-download-link")%>%
    xml_attr("href")
  return(RC_links)
}


RC_extract_allPages <- function(search_URL){
  
  URL_pages <- read_html(search_URL)%>%
    html_nodes(".outputs-filter")%>%
    str_extract(regex("(\\d+)(?!.*\\d)"))
  
  search_part_URL <- str_extract(search_URL, "\\?search.*$")
  
  list_urls <- lapply(rep(1:as.numeric(URL_pages)), function(x)paste0("https://www.reachresourcecentre.info/search/page/", x, "/", search_part_URL))
  
  extract_all <- lapply(list_urls, RC_extract_onePage)
  extract_all_unlisted <- unlist(extract_all)
  
  return(extract_all_unlisted)
}

download_file <- function(file_url, destination_folder){
  file_name <- str_extract(file_url, "[^/]+$")
  download.file(file_url, paste0(destination_folder, "/", file_name), mode = "wb")
}

download_files <- function(url_list, destination_folder){
  if(!dir.exists(destination_folder)){
    dir.create(destination_folder)
  }
  lapply(url_list, download_file, destination_folder = destination_folder)
    
}
