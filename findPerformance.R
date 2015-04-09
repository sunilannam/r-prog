findPerformance <- function(){
  

  doLoop <- function(method, iterations = 1000) {
    for (i in 1:iterations) {
      method();
    }
  }
  cat( "tapply(DT$pwgtp15,DT$SEX,mean)")
  print(tapply(DT$pwgtp15,DT$SEX,mean))
  print(system.time(doLoop(function() tapply(DT$pwgtp15,DT$SEX,mean))))
  
  cat("\n DT[,mean(pwgtp15),by=SEX])")
  print(DT[,mean(pwgtp15),by=SEX])
  print(system.time(doLoop(function()DT[,mean(pwgtp15),by=SEX])))

  
  cat("\nmean(DT$pwgtp15,by=DT$SEX)")
  print(mean(DT$pwgtp15,by=DT$SEX))
  print(system.time(doLoop(function()mean(DT$pwgtp15,by=DT$SEX))))

  cat("\n mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15)")
  print( mean(DT[DT$SEX==1,]$pwgtp15))
  print(mean(DT[DT$SEX==2,]$pwgtp15))
  print(system.time(doLoop(function() mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15))))

  cat("\nsapply(split(DT$pwgtp15,DT$SEX),mean))")
  sapply(split(DT$pwgtp15,DT$SEX),mean)
  print(system.time(doLoop(function() sapply(split(DT$pwgtp15,DT$SEX),mean))))

  cat("\nDT[,mean(pwgtp15),by=SEX]")
  DT[,mean(pwgtp15),by=SEX]
  print(system.time(doLoop(function() DT[,mean(pwgtp15),by=SEX])))
}