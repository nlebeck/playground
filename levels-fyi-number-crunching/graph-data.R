# References:
#
# https://www.r-bloggers.com/passing-arguments-to-an-r-script-from-command-lines/
# https://ggplot2.tidyverse.org/reference/geom_boxplot.html
# https://stackoverflow.com/a/31408489
# https://ggplot2.tidyverse.org/reference/ggsave.html

library(ggplot2)

USAGE = "usage: Rscript graph-data.R processed-data-csv output-prefix"

args = commandArgs(trailingOnly=TRUE)
if (length(args) < 2) {
    stop(USAGE)
}
inputFile = args[1]
outputPrefix = args[2]

data = read.csv(inputFile, header=TRUE)

ggplot(data) +
    geom_violin(aes(x = name, y = base)) +
    scale_y_continuous(breaks = scales::pretty_breaks(n = 10)) +
    xlab("Role") +
    ylab("Base salary ($ / 1000)")
ggsave(paste0(outputPrefix, "-base.pdf"))

ggplot(data) +
    geom_violin(aes(x = name, y = stock)) +
    scale_y_continuous(breaks = scales::pretty_breaks(n = 10)) +
    xlab("Role") +
    ylab("Stock ($ / 1000)")
ggsave(paste0(outputPrefix, "-stock.pdf"))

ggplot(data) +
    geom_point(aes(x = base, y = stock, color = name)) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +
    scale_y_continuous(breaks = scales::pretty_breaks(n = 10)) +
    xlab("Base salary ($ / 1000)") +
    ylab("Stock ($ / 1000)")
ggsave(paste0(outputPrefix, "-base-vs-stock.pdf"))