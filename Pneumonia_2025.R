library(qcc)
library(googlesheets4)
library(janitor)

gs4_auth()
data <- read_sheet("1Ljk4bDzvt8v4L-iwfQmTkQ6hBe2WWVeHM2m_BVF5-yg",
           sheet = "Vital Sings-Rado-2025-01-07-2025-03-04",
           range = "A1:J57")
data <- clean_names(data)
