iris_data = read.csv("D:\\1227\\Data Mining\\dirty_iris.csv", header = TRUE)
iris_data


#1stpart
count = 0
total_observation = nrow(iris_data)
total_observation

for(i in 1:total_observation){
  for(j in 1:ncol(iris_data)){
    if(is.na(iris_data[i,j])){
      count= count + 1
      break
    }
  }
}

complete_row = total_observation - count
complete_row

cat("Number of observation that are complete::", complete_row)
cat("Percentage of observation that are complete::", (complete_row/nrow(iris_data))*100)

#2ndpart

for(i in 1:total_observation){
  for(j in 1:ncol(iris_data)){
    if(!is.na(iris_data[i,j])){
if(iris_data[i,j]== '@' || iris_data[i,j]== '#' || iris_data[i,j]== '!' || iris_data[i,j] == 'Inf' ){
    iris_data[i,j] = NA
}
    }
  }
}
iris_data


#3rdpart

edit2 <- editfile("D:\\1227\\Data Mining\\iris_rule.txt")  #select rules2.txt
edit2

#iris_data = na.omit(iris_data)
i#ris_data

sm <- violatedEdits(edit2,iris_data)
plot(edit2)
sm
summary(sm)
plot(sm)


boxplot(iris$Sepal.Length)
boxplot.stats(iris$Sepal.Length)



