This is a package made by Enya Liu for UW BIOST 561 (Spring 2025).
This package can generate an adjacency matrix with a partial clique and find a optimal maximal partial clique in the adjacency matrix or graph.

- The URL to the GitHub is: https://github.com/enya126/UWBiost561

- The URL to the Pkgdown webpage is: https:///enya126.github.io/UWBiost561

# How to install
This package is called `UWBiost561`. To install, run the following code (in R):
```R
library(devtools)
devtools::install_github("enya126/UWBiost561")
```
# Session info
This package was developed in the following environment
```R
> devtools::session_info()
─ Session info ────────────────────────────────────────────────────────────────────────────────────────────────
 setting  value
 version  R version 4.4.1 (2024-06-14 ucrt)
 os       Windows 11 x64 (build 22631)
 system   x86_64, mingw32
 ui       RStudio
 language (EN)
 collate  Chinese (Simplified)_China.utf8
 ctype    Chinese (Simplified)_China.utf8
 tz       Asia/Shanghai
 date     2025-06-13
 rstudio  2024.09.0+375 Cranberry Hibiscus (desktop)
 pandoc   3.2 @ D:/RStudio/resources/app/bin/quarto/bin/tools/ (via rmarkdown)
 quarto   ERROR: Unknown command "TMPDIR=C:/Users/umi/AppData/Local/Temp/RtmpoFtwHh/fileda1c5ce13038". Did you mean command "uninstall"? @ D:\\RStudio\\resources\\app\\bin\\quarto\\bin\\quarto.exe

─ Packages ────────────────────────────────────────────────────────────────────────────────────────────────────
 package     * version date (UTC) lib source
 askpass       1.2.1   2024-10-04 [1] CRAN (R 4.4.1)
 cachem        1.1.0   2024-05-16 [1] CRAN (R 4.4.1)
 callr         3.7.6   2024-03-25 [1] CRAN (R 4.4.1)
 cli           3.6.3   2024-06-21 [1] CRAN (R 4.4.1)
 credentials   2.0.2   2024-10-04 [1] CRAN (R 4.4.3)
 desc          1.4.3   2023-12-10 [1] CRAN (R 4.4.3)
 devtools      2.4.5   2022-10-11 [1] CRAN (R 4.4.3)
 digest        0.6.37  2024-08-19 [1] CRAN (R 4.4.1)
 ellipsis      0.3.2   2021-04-29 [1] CRAN (R 4.4.3)
 evaluate      1.0.1   2024-10-10 [1] CRAN (R 4.4.1)
 fansi         1.0.6   2023-12-08 [1] CRAN (R 4.4.1)
 fastmap       1.2.0   2024-05-15 [1] CRAN (R 4.4.1)
 fs            1.6.4   2024-04-25 [1] CRAN (R 4.4.1)
 gert          2.1.5   2025-03-25 [1] CRAN (R 4.4.3)
 glue          1.8.0   2024-09-30 [1] CRAN (R 4.4.1)
 htmltools     0.5.8.1 2024-04-04 [1] CRAN (R 4.4.1)
 htmlwidgets   1.6.4   2023-12-06 [1] CRAN (R 4.4.1)
 httpuv        1.6.15  2024-03-26 [1] CRAN (R 4.4.2)
 knitr         1.48    2024-07-07 [1] CRAN (R 4.4.1)
 later         1.4.1   2024-11-27 [1] CRAN (R 4.4.2)
 lifecycle     1.0.4   2023-11-07 [1] CRAN (R 4.4.1)
 magrittr      2.0.3   2022-03-30 [1] CRAN (R 4.4.1)
 memoise       2.0.1   2021-11-26 [1] CRAN (R 4.4.1)
 mime          0.12    2021-09-28 [1] CRAN (R 4.4.0)
 miniUI        0.1.1.1 2018-05-18 [1] CRAN (R 4.4.2)
 openssl       2.2.2   2024-09-20 [1] CRAN (R 4.4.1)
 pillar        1.9.0   2023-03-22 [1] CRAN (R 4.4.1)
 pkgbuild      1.4.7   2025-03-24 [1] CRAN (R 4.4.3)
 pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 4.4.1)
 pkgdown       2.1.1   2024-09-17 [1] CRAN (R 4.4.3)
 pkgload       1.4.0   2024-06-28 [1] CRAN (R 4.4.3)
 processx      3.8.4   2024-03-16 [1] CRAN (R 4.4.1)
 profvis       0.4.0   2024-09-20 [1] CRAN (R 4.4.3)
 promises      1.3.2   2024-11-28 [1] CRAN (R 4.4.2)
 ps            1.8.0   2024-09-12 [1] CRAN (R 4.4.1)
 purrr         1.0.2   2023-08-10 [1] CRAN (R 4.4.1)
 R6            2.5.1   2021-08-19 [1] CRAN (R 4.4.1)
 Rcpp          1.0.13  2024-07-17 [1] CRAN (R 4.4.1)
 remotes       2.5.0   2024-03-17 [1] CRAN (R 4.4.2)
 rlang         1.1.4   2024-06-04 [1] CRAN (R 4.4.1)
 rmarkdown     2.28    2024-08-17 [1] CRAN (R 4.4.1)
 rprojroot     2.0.4   2023-11-05 [1] CRAN (R 4.4.2)
 rstudioapi    0.16.0  2024-03-24 [1] CRAN (R 4.4.1)
 sessioninfo   1.2.3   2025-02-05 [1] CRAN (R 4.4.3)
 shiny         1.10.0  2024-12-14 [1] CRAN (R 4.4.2)
 sys           3.4.3   2024-10-04 [1] CRAN (R 4.4.1)
 tibble        3.2.1   2023-03-20 [1] CRAN (R 4.4.1)
 urlchecker    1.0.1   2021-11-30 [1] CRAN (R 4.4.3)
 usethis       3.1.0   2024-11-26 [1] CRAN (R 4.4.3)
 utf8          1.2.4   2023-10-22 [1] CRAN (R 4.4.1)
 vctrs         0.6.5   2023-12-01 [1] CRAN (R 4.4.1)
 withr         3.0.2   2024-10-28 [1] CRAN (R 4.4.3)
 xfun          0.48    2024-10-03 [1] CRAN (R 4.4.1)
 xtable        1.8-4   2019-04-21 [1] CRAN (R 4.4.1)
 yaml          2.3.10  2024-07-26 [1] CRAN (R 4.4.1)

 [1] D:/R-4.4.1/library
```