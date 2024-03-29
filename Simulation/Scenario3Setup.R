# Set up Conjoint Scenario 2
# Created by John Howell
# On: 2022-1-07

# Conjoint Scenario 3
# Image - Image 1, Image 2, Image 3, Image 4, Image 5, Image 6, Image 7, Image 8, Image 9, Image 10, Image 11, Image 12, Image 13, Image 14, Image 15
# Price - $99, $119, $129, $159, $179, $199, $219, $239, $259
# Stars - 2.5, 3, 3.5, 4, 4.5, 5
# Wifi - Yes, No
# Parking - Yes, No
# Breakfast - Yes, No
# Pool - Yes, No
# Pets - Yes, No

attributes = list(list(type = "Factor", values = 1:15), 
                  list(type = "Continuous", values = c(0.99, 1.19, 1.29, 1.59, 1.79, 1.99, 2.19, 2.39, 2.59)),
                  list(type = "Factor", values = 1:6),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2))


# Total Parameters = 14 + 1 Price + 5 + 1*5 + None = 26
meanBetas <- c(runif(14, -2, 2), runif(1, -1.5, 0), runif(5, -1.5, 1.5), runif(5, -1, 1), runif(1, -2, 1))

# Test baseline scenario
scenario <- rbind(c(2, 1.59, 3, 1, 1, 1, 2, 1),
                  c(11, 1.99, 2, 1, 2, 2, 1, 1),
                  c(7, 1.29, 6, 1, 1, 2, 2, 1))

scenario <- data.frame(scenario)
names(scenario) <- c("Image", "Price", "Stars", "Wifi", "Parking", "Breakfast", "Pool", "Pets")
scenario$Image <- factor(scenario$Image, levels = 1:15)
scenario$Stars <- factor(scenario$Stars, levels=1:6)
scenario$Wifi <- factor(scenario$Wifi, levels=1:2)
scenario$Parking <- factor(scenario$Parking, levels=1:2)
scenario$Breakfast <- factor(scenario$Breakfast, levels=1:2)
scenario$Pool <- factor(scenario$Pool, levels=1:2)
scenario$Pets <- factor(scenario$Pets, levels=1:2)

scenario <- model.matrix(~., scenario)
scenario <- scenario[,-1, drop = FALSE]
scenario <- cbind(scenario, 0)
scenario <- rbind(scenario, c(rep(0, ncol(scenario) - 1), 1))
colnames(scenario)[ncol(scenario)] <- "None"








