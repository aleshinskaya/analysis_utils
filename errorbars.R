
errorbars <- function(data) {
  m <- mean(data,na.rm=TRUE)
  thisSD <- sd(data)
  thisN <- sum(!is.na(data))
  thisSE <- thisSD/sqrt(thisN-1) 
  ymin <- m-thisSE
  ymax <- m+thisSE
  return(c(y=m,ymin=ymin,ymax=ymax))
}