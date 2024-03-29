getwd()

##############################################################################

############ PACKAGES #######################################################

##############################################################################

# data organisation 

  library(ggplot2)

  library(ggthemes)

  library(tidyverse)
  
  library(dplyr)


# kable kodes 

  library(kableExtra)


############################################################################### 

######## DATA INPUT AND FORMAT ###############################################

##############################################################################

#complicated data frame with read.csv, where I have to yell at R not to coerce strings to factors. I also make sure there is not junk text with file encoding, add a sep, add headers to be true.

# HTR_Data <- read.csv("data\\HTR_Data.csv", header=TRUE, sep=",", stringsAsFactors = FALSE, fileEncoding="UTF-8-BOM")

# Or, I can use the read_csv from tidyverse, which already knows csv means command separated, add header and does not coerce factors into strings.  


  HTR_Data <- read_csv("input/HTR_Data.csv")

  str(HTR_Data)


# Making the Name column a character vector, then turning it back into a factor with the levels in the correct order so ggplot does not order them alphabetically 

  HTR_Data$Name <- factor(HTR_Data$Name, levels = unique (HTR_Data$Name))

  HTR_Data$Species <- factor(HTR_Data$Species, levels = unique (HTR_Data$Species))

  class(HTR_Data$Name)

  class(HTR_Data$Species)

# SPECIES SHORTHAND 

  species_shrt <- c(
  "Homo_sapiens_(human)" = "Hsap",
  "Pan_troglodytes_(chimpanzee)" = "Ptro",
  "Gorilla_gorilla_(western_gorilla)" = "Ggor",
  "Macaca_mulatta_(Rhesus_monkey)" = "Mmul",
  "Macaca_fascicularis_(crab_eating_macaque)" = "Mfas",
  "Callithrix_jacchus_(white_tufted_marmoset)" = "Cjac",
  "Microcebus_murinus_(gray_mouse_lemur)" = "Mmur",
  "Mus_musculus_(house_mouse)" = "Mmus",
  "Rattus_norvegicus_(rat)" = "Rnor", 
  "Physeter_catodon_(sperm_whale)" = "Pcat",
  "Bos_taurus_(cow)" = "Btau",
  "Capra_hircus_(goat)" = "Chir",
  "Ovis_aries_(sheep)" = "Oari",
  "Sus_scrofa_(pig)" = "Sscr", 
  "Oryctolagus_cuniculus_(rabbit)" = "Ocun",
  "Canis_lupus_(dog)" = "Cfam",
  "Felis_catus_(cat)" = "Fcat",
  "Numida_meleagris_(helmeted_guineafowl)" = "Nmel",
  "Gallus_gallus_(chicken)" = "Ggal",
  "Xenopus_tropicalis_(tropical_clawed_frog)" = "Xtro",
  "Xiphophorus_maculatus_(southern_platyfish)" = "Xmac",
  "Danio_reriro_(zebrafish)" = "Drer",
  "Drosophila_melanogester_(Drosophila)" = "Dmel")


  HTR_Data$Species <- as.character(species_shrt[ HTR_Data$Species])

  class(HTR_Data$Species)

  HTR_Data$Species <- factor(HTR_Data$Species, levels = unique (HTR_Data$Species))

  class(HTR_Data$Species)


##############################################################################

## RECEPTOR DF SUBSETS 

##########################################################################

# subsetting 5-HTR 1A
  HTR1A_data <- filter (HTR_Data, Receptor == "5-HTR1A")
  str(HTR1A_data)

# subsetting 5-HTR 1B
  HTR1B_data <- filter (HTR_Data, Receptor == "5-HTR1B")
  str(HTR1B_data)

# subsetting 5-HTR 1D
  HTR1D_data <- filter (HTR_Data, Receptor == "5-HTR1D")
  str(HTR1D_data)

# subsetting 5-HTR 1E
  HTR1E_data <- filter (HTR_Data, Receptor == "5-HTR1E")
  str(HTR1E_data)

# subsetting 5-HTR 1F
  HTR1F_data <- filter (HTR_Data, Receptor == "5-HTR1F")
  str(HTR1F_data)

# subsetting 5-HTR 2A
  HTR2A_data <- filter (HTR_Data, Receptor == "5-HTR2A")
  str(HTR2A_data)

# subsetting 5-HTR 2B
  HTR2B_data <- filter (HTR_Data, Receptor == "5-HTR2B")
  str(HTR2B_data)

# subsetting 5-HTR 2C
  HTR2C_data <- filter (HTR_Data, Receptor == "5-HTR2C")
  str(HTR2C_data)

# subsetting 5-HTR 4
  HTR4_data <- filter (HTR_Data, Receptor == "5-HTR4")
  str(HTR4_data)

# subsetting 5-HTR 5A
  HTR5A_data <- filter (HTR_Data, Receptor == "5-HTR5A")
  str(HTR5A_data)

# subsetting 5-HTR 5B
  HTR5B_data <- filter (HTR_Data, Receptor == "5-HTR5B")
  str(HTR5B_data)

# subsetting 5-HTR 6

  HTR6_data <- filter (HTR_Data, Receptor == "5-HTR6")
  
# subsetting 5-HTR 7
  HTR7_data <- filter (HTR_Data, Receptor == "5-HTR7")
  str(HTR7_data)

  
# removing 
  
  HTR2B_data <- HTR2B_data[-c(2, 4, 6, 8, 11, 13, 20, 22, 24),]
  
  HTR2C_data <- HTR2C_data[-c(18,20),]
  
  
#########################################################################

# KABLE CODES FOR LATEX TABLE 

########################################################################
  
  HTR1A_new <- HTR1A_data[,c(3,4,7)]
  kable(HTR1A_new, "latex", booktabs=T)
  
  HTR1B_new <- HTR1B_data[,c(3,4,7)]
  kable(HTR1B_new, "latex", booktabs=T)
  
  HTR1D_new <- HTR1D_data[,c(3,4,7)]
  kable(HTR1D_new, "latex", booktabs=T)
  
  HTR1E_new <- HTR1E_data[,c(3,4,7)]
  kable(HTR1E_new, "latex", booktabs=T)
  
  HTR1F_new <- HTR1F_data[,c(3,4,7)]
  kable(HTR1F_new, "latex", booktabs=T)
  
  HTR2A_new <- HTR2A_data[,c(3,4,7)]
  kable(HTR2A_new, "latex", booktabs=T)
  
  HTR2B_new <- HTR2B_data[,c(3,4,7)]
  kable(HTR2B_new, "latex", booktabs=T)
  
  HTR2C_new <- HTR2C_data[,c(3,4,7)]
  kable(HTR2C_new, "latex", booktabs=T)
  
  HTR4_new <- HTR4_data[,c(3,4,7)]
  kable(HTR4_new, "latex", booktabs=T)
  
  HTR5A_new <- HTR5A_data[,c(3,4,7)]
  kable(HTR5A_new, "latex", booktabs=T)
  
  HTR5B_new <- HTR5B_data[,c(3,4,7)]
  kable(HTR5B_new, "latex", booktabs=T)
  
  HTR6_new <- HTR6_data[,c(3,4,7)]
  kable(HTR6_new, "latex", booktabs=T)
  
  HTR7_new <- HTR7_data[,c(3,4,7)]
  kable(HTR7_new, "latex", booktabs=T)
  