# Set up Conjoint Scenario 2
# Created by John Howell
# On: 2022-1-07

# Settings: Scenario 2 - 12 attributes - 3^4*2^8 - No price
# Total Parameters = 2*4 + 1*8 +None = 17
attributes = list(list(type = "Factor", values = 1:3), 
                  list(type = "Factor", values = 1:3),
                  list(type = "Factor", values = 1:3),
                  list(type = "Factor", values = 1:3),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2),
                  list(type = "Factor", values = 1:2))


meanBetas <- runif(17, -2, 2)

# Test baseline scenario
scenario <- rbind(c(2, 3, 2, 1, 1, 1, 2, 2, 2, 1, 1, 2),
                  c(1, 1, 3, 2, 2, 1, 2, 1, 1, 2, 2, 1),
                  c(3, 2, 3, 3, 2, 1, 1, 1, 2, 2, 2, 2))


scenario <- data.frame(scenario)
names(scenario) <- c(paste0("Feature", 1:4), paste0("Benefit", 1:8))
for(i in 1:4) {
  scenario[,i] <- factor(scenario[,i], levels=1:3)
}
for(i in 5:12) {
  scenario[,i] <- factor(scenario[,i], levels=1:2)
}

scenario <- model.matrix(~., scenario)
scenario <- scenario[,-1, drop = FALSE]
scenario <- cbind(scenario, 0)
scenario <- rbind(scenario, c(rep(0, ncol(scenario) - 1), 1))
colnames(scenario)[ncol(scenario)] <- "None"