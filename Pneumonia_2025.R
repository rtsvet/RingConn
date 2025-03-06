library(qcc)
library(googlesheets4)
library(janitor)

gs4_auth()
data <- read_sheet("1Ljk4bDzvt8v4L-iwfQmTkQ6hBe2WWVeHM2m_BVF5-yg",
           sheet = "Vital Sings-Rado-2025-01-07-2025-03-04",
           range = "A1:J57")
data <- clean_names(data)

min_spO2 <- data$min_spo2_percent

q1 = qcc(min_spO2[1:14], 
         type="xbar.one", 
         newdata=min_spO2[15:56])


min_rhr <- data$min_heart_rate_bpm

q1 = qcc(min_rhr[1:14], 
         type="xbar.one", 
         newdata=min_rhr[15:56])

t <- data$min_hrv_ms
q1 = qcc(t[1:14], 
         type="xbar.one", 
         newdata=t[15:56])
