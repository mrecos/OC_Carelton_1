#### URI for data table download
# http://opencontext.org/subjects-search/Turkey?proj=35-catalhoyuk-area-tp-zooarchaeology&prop=oc-gen-cat-bio-subj-ecofact&prop=biol-term-hastaxonomy#18/37.66817/32.82729/20/any/Google-Satellite

## Try ggduo?  like cowplot...

library("data.table")
library("dplyr")
library("ggplot2")
library("ggalt")
library("readr")

dat_loc <- "~/Documents/R_Local/OC_Carelton_1/data/"
dat_file <- "open-context-csv-export.csv"
dat <- readr::read_csv(file = paste0(dat_loc, dat_file))

range(dat[["Weight (g)"]], na.rm = TRUE)
range(dat[["Length (cm)"]], na.rm = TRUE)
# plot(log(dat[["Weight (g)"]]), dat[["Length (cm)"]])

ggplot(dat, aes(log(`Weight (g)`), `Length (cm)`)) +
  geom_point() +
  theme_bw()

ggplot(dat, aes(log(`Weight (g)`), `Length (cm)`, color = as.factor(`Body Portion`))) +
  geom_point() +
  theme_bw() +
  facet_grid(`Body Portion`~.)

summary(dat[["Number Of Pieces"]])
ggplot(dat, aes(x = log(`Number Of Pieces`))) +
  geom_histogram()
