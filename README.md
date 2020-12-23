
# extractRC

<!-- badges: start -->

<!-- badges: end -->

The goal of extractRC is to easily extract files from [REACH’s Resource
Centre (RC)](https://www.reachresourcecentre.info/)

## Installation

You can install extractRC from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ElliottMess/RC_data_extraction")
```

## Example

**Extract all URLs to files associated with a research**

``` r
library(extractRC)
#> Loading required package: magrittr
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> Loading required package: rvest
#> Loading required package: xml2
#> Loading required package: stringr
#> Loading required package: knitr

search_URL <- "https://www.reachresourcecentre.info/search/?search=1&initiative%5B%5D=reach&ptype%5B%5D=dataset-database&dates=&keywords=JMMI"
all_URLs <- RC_extract_allPages(search_URL)

head(all_URLs)
#> [1] "https://www.impact-repository.org/document/reach/9b5f8f9b/2020-12_ETH_JMMI_dataset_tosubmit.xlsx"                                                
#> [2] "https://www.impact-repository.org/document/reach/d2350e23/REACH_ETH_JMMI_Dataset_Nov2020.xlsx"                                                   
#> [3] "https://www.impact-repository.org/document/reach/0a924d23/AFG_REACH_CVWG_JMMI_November2020-1.xlsx"                                               
#> [4] "https://www.impact-repository.org/document/reach/a7f4c531/reach_lby_dataset_joint_market_monitoring_initiative_jmmi_November_2020.xlsx"          
#> [5] "https://www.impact-repository.org/document/reach/0afe798b/reach_ssd_dataset_joint_market_monitoring_initiative_jmmi_November_2020.finalxlsx.xlsx"
#> [6] "https://www.impact-repository.org/document/reach/b5096e22/33.REACH_YEM_Dataset_Joint-Market-Monitoring-Initiative-JMMI_November2020.xlsx"
```

**Download documents based on the research URLs**

``` r
## For one file:
# download_file(all_URLs[1], "data")

## For all files in list:
# download_files(all_URLs, "data")
```
