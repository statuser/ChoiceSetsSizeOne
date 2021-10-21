source("hmnl_power.R")

set.seed(10212021)
nSims <- 100
nResp <- 300

# Prior Means
X <- hmnl.random.design(10, 12, 1, list(list(type = "Factor", values = 1:3), list(type = "Factor", values = 1:4)), noneOption = TRUE)




meanBetas <- c(-.5, .6, -1.2, .75, .1, -.4)

# Test baseline scenario
scenario <- rbind(c(2, 3),
                  c(1, 4))
scenario <- data.frame(scenario)
names(scenario) <- c("Att1", "Att2")
scenario$Att1 <- factor(scenario$Att1, levels = 1:3)
scenario$Att2 <- factor(scenario$Att2, levels = 1:4)
scenario <- model.matrix(~., scenario)
scenario <- scenario[,-1, drop = FALSE]
scenario <- cbind(scenario, 0)
scenario <- rbind(scenario, c(rep(0, 5), 1))


result <- calculateHDIWidth(meanBetas, X, scenario, nResp = nResp, nSims = nSims)
result.HighScale <- calculateHDIWidth(meanBetas/2, X, scenario, nResp = nResp, nSims = nSims)
result.LowScale <- calculateHDIWidth(meanBetas/.5, X, scenario, nResp = nResp, nSims = nSims)
result.VeryLowScale <- calculateHDIWidth(meanBetas/.25, X, scenario, nResp = nResp, nSims = nSims)
result.VeryHighScale <- calculateHDIWidth(meanBetas/4, X, scenario, nResp = nResp, nSims = nSims)


result
