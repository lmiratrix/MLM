# All libraries used in book

# I grepped for library and made a libraries file
# I then did a regexp of
# Search: .*library\(\W*([\w\._]*)\W*\).*
# Replace: $1
# in TextMate

# I finally pasted using datapasta into the following list, removing duplicates with a call to unique, and then re-pasting via:
# datapasta::vector_paste_vertical(sort( unique(packages)) )


packages <- c("Amelia",
              "arm",
              "blkvar",
              "broom",
              "broom.mixed",
              "clubSandwich",
              "dplyr",
              "faraway",
              "foreign",
              "ggeffects",
              "ggplot2",
              "ggthemes",
              "haven",
              "knitr",
              "lattice",
              "lme4",
              "lmerTest",
              "lmtest",
              "Lock5Data",
              "mice",
              "mosaicData",
              "multiwayvcov",
              "nlme",
              "optimx",
              "plyr",
              "sandwich",
              "sjPlot",
              "stargazer",
              "tableone",
              "texreg",
              "tidyverse",
              "VIM")

for(p in packages) {
  tryCatch(test <- require(p,character.only=T), 
           warning=function(w) return())
  if(!test)
  {
    print(paste("Package", p, "not found. Installing Package!"))
    install.packages(p)
    require(p)
  }
}


# some additional libraries that show up without explicit library calls
if ( FALSE ) {
  # Used by the "Intro to Regression" libraries, See text "graph model 2"
  install.packages("effects")
}
