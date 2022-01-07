# Set up Conjoint Scenario 1
# Created by John Howell
# On: 2022-1-07

# Settings: 6 attributes - 4*3*2^3*1 - Continuous price with 6 discrete design points.  
# Price Points: $0.99, $1.99, $2.99, $3.99, $4.99, $5.99, 
# Total Parameters = 3 + 2 + 1*3 + 1 + None = 10

attributes = list(list(type = "Factor", values = 1:4), 
                  list(type = "Factor", values = 1:3),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2),
                  list(type = "Continuous", values = c(0.99, 1.99, 2.99, 3.99, 4.99, 5.99)))


meanBetas <- c(runif(3, -2, 2), runif(2, -1, 1), runif(3, -1.5, 1.5), runif(1, -2, 0), runif(1, -2, 2))

# Test baseline scenario
scenario <- rbind(c(3, 3, 2, 1, 1, 4.99),
                  c(4, 3, 1, 1, 2, 1.99),
                  c(4, 1, 2, 2, 1, 2.99))


scenario <- data.frame(scenario)
names(scenario) <- c("Brand", "Feature1", "Feature2", "Feature3", "Feature4", "Price")
scenario$Brand <- factor(scenario$Brand, levels = 1:4)
scenario$Feature1 <- factor(scenario$Feature1, levels=1:3)
scenario$Feature2 <- factor(scenario$Feature2, levels=1:2)
scenario$Feature3 <- factor(scenario$Feature3, levels=1:2)
scenario$Feature4 <- factor(scenario$Feature4, levels=1:2)

scenario <- model.matrix(~., scenario)
scenario <- scenario[,-1, drop = FALSE]
scenario <- cbind(scenario, 0)
scenario <- rbind(scenario, c(rep(0, ncol(scenario) - 1), 1))
colnames(scenario)[ncol(scenario)] <- "None"