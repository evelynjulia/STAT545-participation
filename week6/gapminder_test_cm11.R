library("tidyverse")
library("gapminder")
library("here")
library("readxl")

gapminder

path <- "./week6/"
file_name1 <- "gapminder.csv"

write_csv(gapminder, paste(path,file_name1, sep=""))

view(gapminder)

gapminder_sum <- gapminder %>% 
  group_by(continent) %>% 
  summarize(ave_lifeexp = mean(lifeExp))

view(gapminder_sum)


####

gapminder_csv <- read_csv("gapminder.csv")

#### to reset r session and clear environment you need to rstart R. Or create different projects
# remove(list = ls()) ### we shouldn't do this?



# another way to use here
write_csv(here::here("test","tes","te","t","gapminder_sum.csv"))
# this just means it will work on both windows and mac and is operating system agnostic

# can set_here() --> this creates the root as a reference
# use a project to set here because then you have the initial working directory set
set_here()
write_csv(gapminder_sum, here::here, "gapminder2.csv")



########################################################################
# read_csv can directly import urls but read_excel needs you to download first with download.file

data_url <- "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"

#file_name2 <- "GreatestGivers.xls"
file_name2 <- basename(data_url) # this function gets the file name from the URL

download.file(url=data_url, 
              destfile = here::here("week6", file_name2))


philanthropists <- read_excel(here::here("week6", file_name2), trim_ws = TRUE)
# trim_ws --> trims the white space before and after and makes numbers numbers

view(philanthropists)

# might need to trim white spaces before the numbers.... otherwise they won't be read in as numbers. 





########################################################################
# clean up a data set

file_name3 <- "Firas-MRI.xlsx"
filepath3 <- here("week6", file_name3)
mri <- read_excel(filepath3)
view(mri)


# select certain cells:
mri2 <- read_excel(filepath3, range= "A1:L12")

mri3 <- mri2[,-10]
view(mri3)


# convert from wide format to long format

mri_long <- mri3%>% 
  pivot_longer(cols = `Slice 1`:`Slice 8`,
               names_to = "Slice_number",
               values_to = "value")

view(mri_long)




