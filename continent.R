source("helper.R")
data <- get_raw_data()

# get contient data
countries_by_continent <- read.csv("ISO-3166-Countries-with-Regional-Codes.csv")
countries_by_continent <- countries_by_continent[c("alpha.3", "region")]
colnames(countries_by_continent) <- c("iso_code", "continent")
merge(data, countries_by_continent, by = 'iso_code')

data_continent <- merge(data, countries_by_continent, by = 'iso_code')

