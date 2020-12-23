
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

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
