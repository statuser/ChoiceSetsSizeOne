# Set up a simple simulation run to verify that given a set of utilities, both a multinomial logit and and
# Binary Logit will converge to the same values (CBC vs CCSO).
# 
# The basic plan:
## Generate upper level part-worths
## 


### Calculate Individual average MSE

# Created by: John Howell
# Created on: 2022-06-22


usedPackages <- c("here", "doParallel", "foreach", "bayesm", "HDInterval")
for(package in usedPackages) {
  if(length(find.package(package, quiet = TRUE)) == 0) {
    install.packages(package)
  }
}

# Load the simulation utilities
source("hmnl_power.R")

start_time <- Sys.time()
set.seed(start_time)

scenarioToRun <- menu(c("Scenario 1 - Small", "Scenario 2 - Many Attributes", "Scenario 3 - Many Levels"), title="Which scenario would you like to run?")

# Loads Scenario - scenario, meanBetas, attributes
switch( scenarioToRun + 1,
        stop("program aborted\n"),
        source("Scenario1Setup.R"),
        source("Scenario2Setup.R"),
        source("Scenario3Setup.R"))


cat(exp(scenario%*%meanBetas)/sum(exp(scenario%*%meanBetas)))
savedDraws <- 15001:20000

# Generate Respondent Betas
nResp <- 500
respBetas <- matrix(0, nResp, length(meanBetas))
for(resp in 1:nResp) {
  respBetas[resp, ] <- rnorm(length(meanBetas), mean = meanBetas, 1)  
}


# Run Simulations in Parallel
numSims <- 40
cores <- parallel::detectCores()
cl <- parallel::makeCluster(cores[1] - 1)
parallel::clusterExport(cl, c("hmnl.random.design", "sim.hmnl.data", "format.bayesm"))
doParallel::registerDoParallel(cl)
require(foreach)

# Run Baseline
numConcepts <- 3
tasks <- 8

baseLineResult <- foreach(sim = 1:numSims, .combine='rbind') %dopar% {
  
  # Start Loop
  
  # Create Design
  design <- hmnl.random.design(nBlocks=nResp, 
                               nQuestions=tasks, 
                               nAlternatives=numConcepts, 
                               attributes=attributes, 
                               noneOption = TRUE)
  # Simulate Data
  data <- sim.hmnl.data(respBetas, meanBetas, design)
  
  
  # Run Model
  lgtdata <- format.bayesm(data, design)
  capture.output({testOut <- bayesm::rhierMnlRwMixture(Data = list(lgtdata = lgtdata, 
                                                                   p = max(design$Alternative)+1), 
                                                       Prior = list(ncomp = 1), 
                                                       Mcmc = list(R = tail(savedDraws, 1)))})
  
  # Summarize Results
  hyperDraws <- apply(testOut$betadraw[,,savedDraws, drop = FALSE], c(2,3), mean)
  mean((hyperDraws - meanBetas)^2)
  rm(testOut)
  rm(hyperDraws)
  
}
parallel::stopCluster(cl)


# Run Model Results
numConcepts <- 1
numTasks <- 8:24
modelResults <- double(length(numTasks))

# Run Simulations in Parallel
numSims <- 40
cores <- parallel::detectCores()
cl <- parallel::makeCluster(cores[1] - 1)
parallel::clusterExport(cl, c("hmnl.random.design", "sim.hmnl.data", "format.bayesm"))
doParallel::registerDoParallel(cl)
require(foreach)

result <- matrix(0, numSims, length(numTasks))
for(iter in seq_along(numTasks)) {
  tasks <- numTasks[iter]
  modelResults <- foreach(sim = 1:numSims, .combine='rbind') %dopar% {
    
    # Start Loop
     
    # Create Design
    design <- hmnl.random.design(nBlocks=nResp, 
                                 nQuestions=tasks, 
                                 nAlternatives=numConcepts, 
                                 attributes=attributes, 
                                 noneOption = TRUE)
    # Simulate Data
    data <- sim.hmnl.data(respBetas, meanBetas, design)
    
    
    # Run Model
    lgtdata <- format.bayesm(data, design)
    capture.output({testOut <- bayesm::rhierMnlRwMixture(Data = list(lgtdata = lgtdata, 
                                                                     p = max(design$Alternative)+1), 
                                                         Prior = list(ncomp = 1), 
                                                         Mcmc = list(R = tail(savedDraws, 1)))})
    

    # Summarize Results
    hyperDraws <- apply(testOut$betadraw[,,savedDraws, drop = FALSE], c(2,3), mean)
    mean((hyperDraws - meanBetas)^2)
    rm(testOut)
    rm(hyperDraws)
    
  }
  result[,iter] <- modelResults
}
 parallel::stopCluster(cl)

plot(numTasks, colMeans(result))
abline(h = mean(baseLineResult) )
save(baseLineResult, result, numTasks, start_time, file = paste("MSE Simulation Scenario",scenarioToRun, "-", start_time, ".rdata"))

library(tidyverse)
library(ggthemes)

data.frame(numTasks, mse=colMeans(result))  %>%
  ggplot(aes(y=mse, x=numTasks)) +
  geom_point(size=2.5) +
  geom_hline(yintercept = mean(baseLineResult), size=1.5, color="navy") +
  labs(title = "Efficiency and Convergence of Choice Sets of Size One",
       subtitle = "",
       x = "Number of Tasks",
       y = "Average MSE") +
  theme_fivethirtyeight() + 
  theme(axis.title = element_text())

