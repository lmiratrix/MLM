##
## This is a utility script that provides two functions that get the correct variance-covariance matrices
##

library(formula.tools)

# This is an improved version of getVarCov.  We took the code from the R package
# and tweaked it to deal with the weight command more correctly.
#
# Author: Jameson Quin
getVarCovFixedLme <-  function(obj,
                               individuals,
                               type= c("random.effects", "conditional", "marginal"), ... ) {
  type  <-  match.arg(type)
  if(any("nlme" == class(obj)))
    stop("not implemented for \"nlme\" objects")
  if(length(obj$group) > 1)
    stop("not implemented for multiple levels of nesting")
  sigma <- obj$sigma
  D <- as.matrix(obj$modelStruct$reStruct[[1]]) * sigma^2
  if (type=="random.effects")
  {
    result  <-  D
  }
  else
  {
    result <- list()
    groups  <-  obj$groups[[1]]
    ugroups  <-  unique(groups)
    if (missing(individuals)) individuals  <-  as.matrix(ugroups)[1,]
    if (is.numeric(individuals))
      individuals  <-  ugroups[individuals]
    #print("individuals")
    #print(individuals)
    useFixedWeights = FALSE
    if(!is.null(obj$modelStruct$varStruct) & !is.null(obj$modelStruct$reStruct)) {
      varRhs <- as.list(rhs(attr(obj$modelStruct$varStruct, "formula")))
      reGroups <- names(obj$modelStruct$reStruct)
      if ((varRhs[[1]]=="|") & (as.character(varRhs[[3]]) != reGroups)) {
        useFixedWeights = TRUE
      }
    }
    for (individ in individuals)
    {
      indx <- (1:length(ugroups))[individ==ugroups]
      if (!length(indx))
        stop(gettextf("individual %s was not used in the fit",
                      sQuote(individ)), domain = NA)
      if (is.na(indx))
        stop(gettextf("individual %s was not used in the fit",
                      sQuote(individ)), domain = NA)
      ind <- groups == individ
      if(!is.null(obj$modelStruct$corStruct)) {
        V <- corMatrix(obj$modelStruct$corStruct)[[as.character(individ)]]
      }
      else V <- diag(sum(ind))
      if(!is.null(obj$modelStruct$varStruct)){
        if(useFixedWeights) {
          
          sds <- 1/varWeights(obj$modelStruct$varStruct)[1:sum(ind)]
        } else{
          sds <- 1/varWeights(obj$modelStruct$varStruct)[ind]
        } 
      }else{
        print("No weight structure...")
        sds <- rep(1, sum(ind))
      }
      sds <- obj$sigma * sds
      cond.var <- t(V * sds) * sds
      dimnames(cond.var)  <-  list(1:nrow(cond.var),1:ncol(cond.var))
      if (type=="conditional")
        result[[as.character(individ)]] <- cond.var
      else
      {
        Z <- model.matrix(obj$modelStruct$reStruc,
                          getData(obj))[ind, , drop = FALSE]
        result[[as.character(individ)]] <-
          cond.var + Z %*% D %*% t(Z)
      }
    }
  }
  class(result)  <-  c(type,"VarCov")
  attr(result,"group.levels")  <-  names(obj$groups)
  result
}


getVarCovFixedGls <-  function(obj, individual = 1, ...) {
  S <- corMatrix(obj$modelStruct$corStruct)[[individual]]
  if (!is.null( obj$modelStruct$varStruct))
  {
    ind  <-  obj$groups==individual
    vw  <-  1/varWeights(obj$modelStruct$varStruct)[ind]
    ##TIME FOR EVIL HACK!!! HULK SQUISH BUG!!!!
    vw <- 1/varWeights(obj$modelStruct$varStruct)[1:sum(ind)]
  }
  else vw  <-  rep(1,nrow(S))
  vars  <-  (obj$sigma * vw)^2
  #print(varWeights(obj$modelStruct$varStruct))
  #print(ind)
  #print(S)
  result  <-  t(S * sqrt(vars))*sqrt(vars)
  class(result)  <-  c("marginal","VarCov")
  attr(result,"group.levels")  <-  names(obj$groups)
  result
}
