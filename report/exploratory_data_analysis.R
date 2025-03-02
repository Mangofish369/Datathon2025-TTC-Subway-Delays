## SET-UP: PACKAGES ##
install.packages(c("tidyverse", "dplyr", "glue", "ggplot2", "pipe")) # maps, factoextra
install.packages("mapview")
install.packages("sf")
library(tidyverse, dplyr, glue, pipe, ggplot2)
library(mapview)
library(sf)


## SET-UP: DATA ##
bus_data <- read_csv("data/bus-data.csv")
streetcar_data <- read_csv("data/streetcar-data.csv")
subway_data <- read_csv("data/subway-data.csv")
subway_delay_codes <- read_csv("data/subway-delay-codes.csv")


## DATA-CLEANING ##

# Check and account for duplicate entries
bus_data %>%
    distinct() %>%
    count()

streetcar_data %>%
    distinct() %>%
    count()

subway_data %>%
    distinct() %>%
    count()

# Check and account for missing values
bus_data %>%
    drop_na() %>%
    count()

streetcar_data %>%
    drop_na() %>%
    count()

subway_data %>%
    drop_na() %>%
    count()

## ANALYSIS ##
# General Summary Statistics
summary(bus_data)
summary(streetcar_data)
summary(subway_data)

# Summary Statistics for Temporal Aspect / TSA
bus_data %>%
    filter(day == "Monday") %>%
    summarise(average_delay = mean(delay))

# Summary Statistics for Categorical Aspect


## VISUALIZATION ##
# delay times (histogram)
ggplot(subway_data, aes(x = "Location", y = "Min Delay")) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(
    title = "Histogram of Subway Delay Times",
    x = "Delay Time (minutes)",
    y = "Frequency"
  ) +
  theme_minimal()
# having issues with this#


# incident type (using pie chart)
# top 10 locations with most delays (using bar chart)
# each day of the week and most common delay type (using bar chart)
# each day of the the week and average delay time (using line chart)
# peak hours for delays (using histogram/density plots)