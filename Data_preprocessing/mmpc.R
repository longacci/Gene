setwd("D:/Gene/ALS_Combine")
library("gRbase")
library("MXM")
require(gRbase)
data <- read.csv("data_preprocessing/data_preprocessing_combine_finnal.csv",header = TRUE,row.names = 1)
label <- data[,length(data)]
x <- data[,3:length(data)-1]

# MMPC algorithm
mmpcObject <- MMPC(label, x, max_k=3,threshold = 0.1,test='testIndFisher')
feature_important <- data.frame(feature=colnames(x[mmpcObject@selectedVars]),scores=mmpcObject@stats[mmpcObject@selectedVars])
feature_important

mmpcObject$res[,2]
colnames(x[mmpcObject$res[,1]])
write.csv(feature_important,"data_preprocessing/mmpc_feature.csv",row.names=FALSE)
