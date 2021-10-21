# Functions for estimating power for CBC studies by brute-force simulation

# Key steps:
# 1. Simulate multiple data sets (from the hmnl models) with an informative prior on parameters
# 2. Produce posterior draws for the model (mnl or hmnl)
# 3. Compute width of posterior intervals and/or probabilities that effects 
#    of a certain magnitute are detected.

# Initial Code
# Elea McDonnell Feit, eleafeit@gmail.com
# 27 September 2017
# Updated to hmnl
# John R. Howell, john_howell@byu.edu
# 22 August 2019
# Some of this code is borrowed from https://github.com/ksvanhorn/ART-Forum-2017-Stan-Tutorial


# Function: hmnl.random.design
# Generate heterogeneous random designs for a CBC model estimate with
# a HMNL model.  The design should have multiple versions/blocks, with
# fixed number of questions/tasks per block and alternatives per question.
#  The designs are fully random meaning that no effort is made to ensure 
# level balance or minimal overlap.  The algorithm also does not check for
# duplicate product specifications.
#
# Output:  The output is a nblock*nquestion*nalternative X nAttributes + 3 data.frame
#
# Column 1: The block number
# Column 2: The question number
# Column 3: The alternative number
# Column 4-N: The level# for each attribute for factors or the actual value for continuous attributes
#
# Input: 
# nBlocks: (integer) the number of blocks to generate
# nQuestions: (integer) the number of questions in each block
# nAlternatives: (integer) the number of alternatives per question
# attributes: (List of attributes) one item for each attribute containing an attribute item
#             The attribute item is a data structure that contains:
#                   type: either "Continuous" or "Factor"
#                   values: for "Factor" types an array of factor values (integers) starting at 1
#                           for "Continuous" types a two element array specifying the minimum and maximum value
#                                The levels will be randomly generated between these two values
#                   TODO: Possibly add an a priori ordering 



hmnl.random.design <- function(nBlocks, nQuestions, nAlternatives, attributes, noneOption = TRUE) {
  # Generate a nBlock * nQuestions * nAlternatives by nAttributes matrix with each column limited by the attribute specification
  nAttributes <- length(attributes)
  design <- data.frame(matrix(NA, nrow = nBlocks * nQuestions * nAlternatives, ncol = nAttributes + 3))
  design[,1] <- rep(1:nBlocks, each = nQuestions * nAlternatives)
  design[,2] <- rep(1:nQuestions, times = nBlocks, each = nAlternatives)
  design[,3] <- rep(1:nAlternatives, times = nBlocks * nQuestions)
  for(att in 1:nAttributes) {
    if(tolower(attributes[[att]]$type) == "continuous") {
      design[,att+3] <- runif(n=nrow(design), min = attributes[[att]]$values[1], max = attributes[[att]]$values[2])
    } else if(tolower(attributes[[att]]$type) == "factor") {
      design[,att+3] <- as.factor(sample(attributes[[att]]$values, nrow(design), replace = TRUE))
    } else {
      stop("Attribute Types must either be \"Continuous\" or \"Factor\" ")
    }
  }
  
  names(design) <- c("Block", "Questions", "Alternative", paste0("Att", 1:nAttributes))
  
  return(design)
}


codeDesign <- function(design, nAlternatives, noneOption = TRUE) {
  #Code the design
  
  design <- model.matrix(~., design)
  design <- design[,-1, drop = FALSE]
  
  
  if(noneOption) {
   nQuestions <- nrow(design) %/% nAlternatives
   design <- cbind(design, 0)
   noneOptions <- matrix(0, nrow = nQuestions, ncol = ncol(design))
   noneOptions[, ncol(noneOptions)] <- 1
   
   questions <- c(rep(1:nQuestions, each = nAlternatives), 1:nQuestions)
   alternatives <- c(rep(1:nAlternatives, times = nQuestions), rep(nAlternatives+1, times = nQuestions))
   
   design <- rbind(design, noneOptions)
   design <- design[order(questions, alternatives),]
  }
  
  
  return(design)
}


#Test code for hmnl.random design
# X <- hmnl.random.design(10, 12, 2, list(list(type = "Factor", values = 1:3), 
#                                       list(type = "FACTOR", values = 1:2), 
#                                       list(type = "factor", values = 1:5),
#                                       list(type = "Continuous", values = c(-2, 2)),
#                                       list(type = "CONTINUOUS", values = c(-1,1)),
#                                       list(type = "continuous", values = c(-10, 10))))
# X


# Function: sim.hmnl.data
# Simulate Data for a CBC conjoint study based on a hmnl model.  The function uses a set of priors
# and a design object to generate a set of choices for each respondent.  Each respondent is randomly
# assigned a block and a random vector of part-worth utilities.  The part-worth utilities are 
# drawn from a multivariate normal distribution with a mean of the supplied priors and an identity
# variance-covaraiance matrix.
#
# The attributes that are factors should be specified as such prior to simulatring data.
#
# Output: a nRespondent by nQuestion + 2 data.frame
# 
# Column 1: Integer Respondent Number
# Column 2: The block number of the design used
# Column 3-N: The choice for the specific question
#
# Input:
# nResp: (Integer) The number of respondents to generate
# priorMeans: (Double Array) The prior means for the generation.  There should be total number of levels - the number of attributes
# design: (data.frame) The design file formatted according the format described by hmnl.random.design.  (Labels don't matter)



sim.hmnl.data <- function(nResp, priorMeans, design) {
  nQuestions <- length(levels(as.factor(design[,2])))
  nAlternatives <- length(levels(as.factor(design[,3])))
  data <- data.frame(matrix(-1, nrow = nResp, ncol = nQuestions + 2))
  for(resp in 1:nResp) {
    data[resp, 1] <- resp
    data[resp, 2] <- as.numeric(sample(levels(as.factor(design[,1])), 1, replace = FALSE))
    
    respBeta <- rnorm(length(priorMeans), mean = priorMeans, 0.5)
    for(question in 1:nQuestions) {
      des <- design[design[, 1] == data[resp, 2] & design[,2] == question, 4:ncol(design), drop = FALSE]
      des <- codeDesign(des, nAlternatives = nAlternatives)
      
      data[resp, question + 2] <- sample(x=nAlternatives + 1, size=1, prob=exp(des%*%respBeta))
    }
  }
  
  return(data)
}
# Test Simulation Code
# Y <- sim.hmnl.data(200, rnorm(10, 0, .5), X)
# Y


# Function: format.bayes
# Convert input data into the format for bayesm.  This includes coding the design file as well as constructing a list of
# lists data structure that can be used by "rhierMnlRwMixture".  The user should supply two data structures.  The data 
# structures are a design files that can contain multiple blocks and a data file with one row per respondent. 
# TODO: Handle none option/dual response none
#
# Ouput: a rhierMnlRwmixture data structure
#         This is a list of length nRespondents where each element is a list containing *y* a vector of responses and *X*
#         a fully coded design matrix.
#
# Input: 
#        data - a nRespondents by nQuestions + 2 matrix or data.frame.  The first column contains a respondent number that is ignored
#               The second column contains the block number which the respndent answered.
#        design - a nBlock * nQuestion * nAlternatives by nAttributes + 3 data.frame.  The first column contains the block number
#               the second column contains the question number, and the third column contains the alternative number.  The remaining coulmns
#               contain the attribute.  These should be prespecified as factors with appropriately defined levels where necessary/

format.bayesm <- function(data, design) {
  nResp <- nrow(data)
  bayesmData <- list()
  for(resp in 1:nResp) {
    des <- design[design[, 1] == data[resp, 2], 4:ncol(design), drop = FALSE]
    des <- codeDesign(des, nAlternatives = length(levels(as.factor(design[,3]))))
    
    bayesmData[[resp]] <- list(y = unlist(data[resp, -c(1,2)]), X = des)
  }
  return(bayesmData)
}

# Test formatting code
# lgtdata <- format.bayesm(Y, X)

# Make sure that it runs.
# library(bayesm)
# testOut <- rhierMnlRwMixture(Data = list(lgtdata = lgtdata, p = 2), Prior = list(ncomp = 1), Mcmc = list(R = 20000))
# The output format:
# betadraw - contains the individual draws in a 3 dimnsional array.  The format is respondent, parameter, iteration



# Function: simulate.bayesm
# Run a simulation scenario using the output of a bayesm::rhierMnlRwMixture model.  The funciton will run the simulation
# for each respondent for each iteration.  Since the main objective is to create a distribution of possible shares, the
# the ouput is summarized at the respondent level, but there will be length(savedDraws) draws from the distribution.  This
# gives a properly error correct estimate of the preferences shares that can be used to create a HDi or compute standard deviations
#
# Output: a matrix of nProducts by length(savedDraws)
#
# Input: draws - The individual level fraws form a hmnl model.  This is generally results of a bayesm::rhierMnlRwMixture model  
#                    extract the betadraw object and supply only the draws to actually use.  This will be a nRespondent by 
#                    nParameter by nDraws array
#        scenario - a coded matrix defining the scenaario to be estimated.  This is a nProducts by nParameters matrix

simulate.bayesm <- function(draws, scenario) {
  nResp <- dim(draws)[1]
  sharePreferences <- matrix(0, nrow = dim(draws)[3], ncol = nrow(scenario))
  for(resp in 1:nResp) {
    utilities <- t(exp(scenario %*% draws[resp,,]))
    choices <- utilities/rowSums(utilities)
    sharePreferences <- sharePreferences + choices
  }
  
  return(sharePreferences/nResp)
  
}


# test simulate.bayesm

# scenario <- rbind(c(2, 1, 4, 1.5, 0.5, 5),
#                   c(1, 2, 1, 1.5, 0.5, 5),
#                   c(3, 1, 3, 1.5, 0.5, -3))
# 
# scenario <- data.frame(scenario)
# scenario$X1 <- factor(scenario$X1, levels = 1:3)
# scenario$X2 <- factor(scenario$X2, levels = 1:2)
# scenario$X3 <- factor(scenario$X3, levels = 1:5)
# scenario <- model.matrix(~., scenario)
# scenario <- scenario[,-1]
# 
# savedDraws <- 10001:20000
# results <- simulate.bayesm(testOut$betadraw[,,savedDraws], scenario)
# plot(density(results[,1]), type="l")
# 
# inter <- HDInterval::hdi(results, credMass = 0.95)
# abline(v = inter[1,1])
# abline(v = inter[2,1])
# 
# # Summarize and interpret results
# plot(density(hdiWidth[,1]))
# 
# 
# mean(hdiWidth[,3])


# Function: calculateHDIWidth
# Calculate the average with of the highest density interval for a choice base conjoint study.  This doesn't make a judgement about what the proper 
# width is or do any hypothesis testing, but it is a pretty straight forward way to start thinking about the problem.  
#
# Depends on: bayesm, HDInterval, doParallel, foreach
#
# Output: a set of draws that represent the width of the HDI interval for each product in the base case.  This is 
#         stored in a matrix format with the rows represnting draws and the columns the width for each product
#
# Input: 
#       meanBetas: a vector of prior means to be used for the data generation process
#       scenario: A fully coded model matrix representing the base case that should be used to calcualte the Highest Density Intervals
#       nSims: (default = 10) The number of iterations that the simulation should run.  This will scale the time take linearly


calculateHDIWidth <- function(meanBetas, design, scenario, nResp = 300, nSims = 10, intervalWidth = 0.95) {
  
  hdiWidth <- matrix(0, nrow = nSims, ncol = nrow(scenario))
  cores <- parallel::detectCores()
  cl <- parallel::makeCluster(cores[1] - 1)
  parallel::clusterExport(cl, c("sim.hmnl.data", "format.bayesm", "simulate.bayesm", "codeDesign"))
  doParallel::registerDoParallel(cl)
  require(foreach)
  
  finalHdiWidth <- foreach(simNumber = 1:nSims, .combine='rbind') %dopar% {
    
    # Start Loop
    Y <- sim.hmnl.data(nResp, meanBetas, design)
    lgtdata <- format.bayesm(Y, design)
    capture.output({testOut <- bayesm::rhierMnlRwMixture(Data = list(lgtdata = lgtdata, p = 2), Prior = list(ncomp = 1), Mcmc = list(R = 10000))})
    savedDraws <- 5001:10000
    results <- simulate.bayesm(testOut$betadraw[,,savedDraws, drop = FALSE], scenario)
    inter <- HDInterval::hdi(results, credMass = intervalWidth)
    inter[2, ,drop = FALSE] - inter[1, ,drop = FALSE]
    #cat(paste("Completing Iteration", simNumber, "of", nSims, "\n"))
    
  }
  
  parallel::stopCluster(cl)
  return(finalHdiWidth)
}




# This is the test procedure.  We really need to run this a number of times to determine the posterior highest density interval width
#Test code for hmnl.dandom design
# set.seed(09062019)
# nSims <- 100
# nResp <- 300
# 
# # Prior Means
# X <- hmnl.random.design(10, 12, 2, list(list(type = "Factor", values = 1:3), 
#                                         list(type = "Factor", values = 1:2), 
#                                         list(type = "Factor", values = 1:5)))
# meanBetas <- rnorm(7, 0, .5)
# 
# # Test baseline scenario
# scenario <- rbind(c(2, 1, 4),
#                   c(1, 2, 1),
#                   c(3, 1, 3))
# scenario <- data.frame(scenario)
# scenario$X1 <- factor(scenario$X1, levels = 1:3)
# scenario$X2 <- factor(scenario$X2, levels = 1:2)
# scenario$X3 <- factor(scenario$X3, levels = 1:5)
# scenario <- model.matrix(~., scenario)
# scenario <- scenario[,-1]
# 
# 
# result <- calculateHDIWidth(meanBetas, X, scenario, nResp = nResp, nSims = nSims)
# result.HighScale <- calculateHDIWidth(meanBetas/2, X, scenario, nResp = nResp, nSims = nSims)
# result.LowScale <- calculateHDIWidth(meanBetas/.5, X, scenario, nResp = nResp, nSims = nSims)
# 
# result


# Can we just report the width of the HDI?  This seems like the right number to report and avoids a lot of the hassle about 
# null hypothesis

#percentage change
# k <- log(V * (sum(exp(u)) - exp(u[1])) / (sum(exp(u)) - V * exp(u[1])))
# absolute change
# k2 <- log((S*V + exp(u[1]))*(S - exp(u[1]))/(exp(u[1]) * (S - S*V - exp(u[1]))))
  