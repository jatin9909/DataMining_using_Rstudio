wine_data = read.table("D:\\1227\\Data Mining\\wine.txt", header = FALSE, sep = ",")
wine_data


wine_mean = c(0)
wine_var = c(0)
wine_sd = c(0)

for(i in 1:ncol(wine_data)){
  
  wine_mean[i] = mean(wine_data[,i])  #for ith column
  wine_var[i] = var(wine_data[,i])
  wine_sd[i] = sd(wine_data[,i])
}

wine_mean
wine_var
wine_sd


for(i in 1:ncol(wine_data)){

    wine_data[,i] = (wine_data[,i] - wine_mean[i])/wine_sd[i]
  
}

wine_data
