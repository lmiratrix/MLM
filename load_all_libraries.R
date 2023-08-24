# All libraries used in book

# I grepped for library and made a libraries file
# I then did a regexp of
# Search: .*library\(\W*([\w\._]*)\W*\).*
# Replace: $1
# in TextMate

# I finally pasted using datapasta into the following list:

a = c("blkvar", "blkvar", "arm", "texreg", "tidyverse", "knitr", "broom", "tidyverse", "broom.mixed", "haven", "knitr", "lme4", "arm", "lmtest", "arm", "sandwich", "lmtest", "multiwayvcov", "tidyverse", "nlme", "foreign", "texreg", "nlme", "texreg", "tidyverse", "haven", "arm", "ggplot2", "plyr", "faraway", "lme4", "lmerTest", "lattice", "tidyverse", "lme4", "ggeffects", "sjPlot", "haven", "tidyverse", "sjPlot", "ggeffects", "foreign", "tidyverse", "lme4", "arm", "lmerTest", "knitr", "lme4", "arm", "tidyverse", "haven", "ggthemes", "ggthemes", "tidyverse", "Lock5Data", "knitr", "broom", "ggeffects", "sjPlot", "haven", "ggplot2", "stargazer", "texreg", "tidyverse", "mice", "VIM", "ggplot2", "Amelia", "dplyr", "tidyverse", "lme4", "foreign", "ggplot2", "arm", "lme4", "knitr", "lme4", "foreign", "arm", "tidyverse", "lme4", "foreign", "arm", "tidyverse", "lmerTest", "optimx", "tidyverse", "lme4", "haven", "sjPlot", "tidyverse", "stargazer", "tidyverse", "tableone", "stargazer", "arm", "foreign", "tidyverse", "lme4", "tidyverse", "lme4", "foreign", "ggplot2", "arm", "lme4", "tidyverse", "tidyverse", "arm", "foreign", "tidyverse", "knitr", "mosaicData", "knitr", "tidyverse", "arm", "sjPlot", "tidyverse", "lme4", "arm", "knitr", "texreg", "stargazer", "lmtest", "texreg", "stargazer", "lmerTest", "stargazer", "stargazer", "tidyverse", "lme4", "sjPlot", "ggeffects", "haven", "knitr", "tidyverse", "nlme", "haven", "lme4", "tableone", "tableone", "stargazer", "lattice")

a = unique( a )

require( a )
purrr::map( a, library )
a
res <- lapply(a, require, character.only = TRUE)
library( a )


# some additional libraries that show up
if ( FALSE ) {
  # Used by the "Intro to Regression" libraries, "graph model 2"
  install.packages("effects")
}
