## ----message=FALSE, warning=FALSE---------------------------------------------
library(sf)
library(tidyverse)
library(spdep)
library(HSAR)

## -----------------------------------------------------------------------------
data(depmunic)
data(properties)
plot(st_geometry(depmunic),col = sf.colors(12, categorical = TRUE), border = 'grey')
plot(st_geometry(properties),add=TRUE,col="red",pch=16,cex=0.6)


## -----------------------------------------------------------------------------
attributes(depmunic)$names
depmunic$pop_rest

## -----------------------------------------------------------------------------
attributes(properties)$names
hist(properties$age, xlab = "Age", main="Age of the properties")

## -----------------------------------------------------------------------------
depmunic$popdens <- depmunic$population/ (10000*depmunic$area)
depmunic$foreigners <- 100 * depmunic$pop_rest/ depmunic$population

## -----------------------------------------------------------------------------
properties_in_dd <- st_join(properties, depmunic, join = st_within)

## -----------------------------------------------------------------------------
model.data <- properties_in_dd[order(properties_in_dd$num_dep),]

## -----------------------------------------------------------------------------
properties_count <- count(as_tibble(model.data), num_dep)
MM <- as.data.frame(properties_count)

## -----------------------------------------------------------------------------
Utotal <- dim(MM)[1]
Unum <- MM[,2]
Uid <- rep(c(1:Utotal),Unum)

## -----------------------------------------------------------------------------
n <- nrow(properties)
Delta <- matrix(0,nrow=n,ncol=Utotal)
for(i in 1:Utotal) {
  Delta[Uid==i,i] <- 1
}

Delta <- as(Delta,"dgCMatrix")

## -----------------------------------------------------------------------------
nb.list <- poly2nb(depmunic)
mat.list <- nb2mat(nb.list,style="W")
M <- as(mat.list,"dgCMatrix")

## -----------------------------------------------------------------------------
plot(st_geometry(depmunic),border = 'grey')
plot( st_centroid(depmunic$geometry), add=TRUE )
plot(nb.list, st_centroid(depmunic$geometry), add= TRUE )

## -----------------------------------------------------------------------------
nb.1300 <- dnearneigh(properties,0,1300)


## -----------------------------------------------------------------------------
mat.1300 <- nb2mat(nb.1300,style="W")
W <- as(mat.1300,"dgCMatrix")

## -----------------------------------------------------------------------------
nb.1300

## ----eval=FALSE---------------------------------------------------------------
#  res.formula <- prpsqm ~ size + age + foreigners + greensp + popdens + museums + airbnb
#  res <- hsar(res.formula,data=model.data,W=W,M=M,Delta=Delta,
#              burnin=500, Nsim=1000)
#  summary(res)

## ---- eval=FALSE--------------------------------------------------------------
#  res_1 <- hsar(res.formula,data=model.data,W=NULL,M=M,Delta=Delta,burnin=500, Nsim=1000)
#  summary(res_1)

## ---- eval=FALSE--------------------------------------------------------------
#  res_2 <- hsar(res.formula,data=model.data,W=W,M=NULL,Delta=Delta,burnin=500, Nsim=1000)
#  summary(res_2)

