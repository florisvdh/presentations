library(rprojroot)
gitroot <- find_root(is_git_root)
setwd(file.path(gitroot, "src/20210617_grass"))
xfun::Rscript_call(
    rmarkdown::render,
    list(input = "grass.Rmd",
         output_file= file.path(gitroot,
                                "docs/20210617_grass/index"))
)
