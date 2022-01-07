# Control script to run a simualtion scenario  This loads a scenario specifc file that determines which simulation to run.
# The scenario Specific files are accessed via a menu.  They load the attribute list, mean betas, the simulation scenario
# Created by: John Howell
# Created on: 2021-10-21
# Modified: 2022-1-07


# Install packages if they don't currently exist
usedPackages <- c("doParallel", "foreach", "bayesm", "HDInterval")
for(package in usedPackages) {
  if(find.package(package) == "") {
    install.packages(package)
  }
}

TESTING = FALSE

# Load the simulation utilities
source("hmnl_power.R")

set.seed(10212021)

scenarioToRun <- menu(c("Scenario 1 - Small", "Scenario 2 - Many Attributes", "Scenario 3 - Many Levels"), title="Which scenario would you like to run?")
switch( scenarioToRun + 1,
       stop("program aborted\n"),
       source("Scenario1Setup.R"),
       source("Scenario2Setup.R"),
       source("Scenario3Setup.R"))

if(TESTING) {
  # Check that the overall shares are reasonable
  cat(exp(scenario%*%meanBetas)/sum(exp(scenario%*%meanBetas)))
  numConcepts = 2
  numTasks = c(12, 15)
  nSims <- 2
  nResp <- 500
} else {
  numConcepts <- 1:3
  numTasks <- seq(6, 30, by=3)
  nSims <- 100
  nResp <- 500
}

averageWidth <- array(0, dim = c(length(numConcepts), length(numTasks), nrow(scenario)))

for(i in 1:length(numConcepts)) {
  for(j in 1:length(numTasks)) {
    # Prior Means
    X <- hmnl.random.design(nBlocks=nResp, nQuestions=numTasks[j], nAlternatives=numConcepts[i], attributes=attributes, noneOption = TRUE)
    result <- calculateHDIWidth(meanBetas, X, scenario, nResp = nResp, nSims = nSims)
    averageWidth[i, j, ] <- colMeans(result)
  }
}

simScenarioToPlot = 1
plottingColors = c("red", "green", "blue")
plot(y = c(0, max(averageWidth[,,simScenarioToPlot])), x = c(1, length(numTasks)), xaxt="n", type="n", main=paste("Width of HPD Intervals for Scenario", scenarioToRun), xlab="Number of coice sets", ylab="Width of HDPI")
for(i in 1:length(numConcepts)) {
  lines(averageWidth[i,,simScenarioToPlot], col=plottingColors[i], lwd=3)  
}
axis(side=1, at=1:length(numTasks), labels=numTasks)


