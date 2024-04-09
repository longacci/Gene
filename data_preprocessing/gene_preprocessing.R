library(GEOquery)
library(limma)
setwd("D:/Gene/ALS_Combine")
# GSE112676
# Load Series matrix file
gse <- getGEO(filename = "GSE112676_series_matrix.txt")
length(gse)

# Extract expression data
gse_data <- exprs(gse)
length(gse_data)

# Extract sample information
gse_sample <- pData(gse)$characteristics_ch1.1
gse_sample

# Concatenate data gene 
data_gene <- data.frame(gse_data)
data_gene <- rbind(data_gene,gse_sample)

# Get annotation gene
df_fData <- fData(gse)
# Replace those annotaion 'Unigene' value
df_fData[df_fData$Source == 'Unigene',]$ILMN_Gene <- df_fData[df_fData$Source == 'Unigene',]$Accession

annotation <- df_fData['ILMN_Gene']
annotation <- rbind(annotation,c(0))

# Merge annotation with data gene
data_gene$gene <- annotation$ILMN_Gene

# Extract data to csv
write.csv(data_gene,"data_preprocessing/final_GSE112676.csv",row.names = TRUE)

# GSE112680

# Load Series matrix file
gse <- getGEO(filename = "GSE112680_series_matrix.txt")
length(gse)

# Extract expression data
gse_data <- exprs(gse)
length(gse_data)

# Extract sample information
gse_sample <- pData(gse)$characteristics_ch1.1
gse_sample

# Concatenate data gene 
data_gene <- data.frame(gse_data)
data_gene <- rbind(data_gene,gse_sample)

# Get annotation gene
df_fData <- fData(gse)
# Replace those annotaion 'Unigene' value
df_fData[df_fData$Source == 'Unigene',]$ILMN_Gene <- df_fData[df_fData$Source == 'Unigene',]$Accession

annotation <- df_fData['ILMN_Gene']
annotation <- rbind(annotation,c(0))

# Merge annotation with data gene
data_gene$gene <- annotation$ILMN_Gene

# Extract data to csv
write.csv(data_gene,"data_preprocessing/final_GSE112680.csv",row.names = TRUE)
