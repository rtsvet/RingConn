# https://cran.r-project.org/web/packages/ggQC/ggQC.pdf
# http://rcontrolcharts.com/

### Load the Needed Libraries
library(ggplot2)
library(ggQC)
library(googlesheets4)
library(janitor)

data <- read_sheet("1Ljk4bDzvt8v4L-iwfQmTkQ6hBe2WWVeHM2m_BVF5-yg",
                   sheet = "Vital Sings-Rado-2025-01-07-2025-03-04",
                   range = "A1:J57")
data <- clean_names(data)

min_spO2 <- data$min_spo2_percent

XmR_Plot <- 
  ggplot(data, aes(x = date, y = min_spo2_percent)) + #init ggplot
  geom_point() + geom_line() + #add the points and lines
  stat_QC(method = "XmR", #specify QC charting method
          auto.label = T, # Use Autolabels
          label.digits = 2, #Use two digit in the label
          show.1n2.sigma = T  #Show 1 and two sigma lines
  )


### Draw the plot - Done
XmR_Plot
