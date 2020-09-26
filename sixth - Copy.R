Kmeans

library(dbscan)
library(rpart)
library(rpart.plot)
library(caret)
library(e1071)
library(class)

install.packages("cluster")
library(cluster)

#using iris

iris1<-iris[,1:4]
results<-kmeans(iris1,3)
results
table(iris$Species,results$cluster)
cat("The no. of elements in each cluster are",table(results$cluster))

plot(iris[,-5],col=results$cluster)

results4<-kmeans(iris1,4)
results4
table(iris$Species,results4$cluster)
cat("The no. of elements in each cluster are",table(results4$cluster))
plot(iris[,-5],col=results4$cluster)

#using htru_2

htru<-read.csv("HTRU_2.csv",header=FALSE)
names(htru)<-c(" Profile_mean","Profile_stdev","Profile_skewness","Profile_kurtosis"," DM_mean","DM_stdev","DM_skewness", "DM_kurtosis","class")
htru1<-htru[,1:length(htru)-1]
resu<-kmeans(htru1,3)
table(htru$class,resu$cluster)

cat("The no. of elements in each cluster are",table(resu$cluster))

plot(htru[,-length(htru)],col=resu$cluster)

resu4<-kmeans(htru1,4)
resu4
table(htru$class,resu4$cluster)
cat("The no. of elements in each cluster are",table(resu4$cluster))
plot(htru[,-length(htru)],col=resu4$cluster)


DBscan

library(dbscan)
library(rpart)
library(rpart.plot)
library(caret)
library(e1071)
library(class)

#using htru_2

htru<-read.csv("HTRU_2.csv",header=FALSE)
names(htru)<-c(" Profile_mean","Profile_stdev","Profile_skewness","Profile_kurtosis"," DM_mean","DM_stdev","DM_skewness", "DM_kurtosis","class")
htru_1<-htru[,1:length(htru)-1]
kNNdistplot(htru_1,k=2)
abline(h=0.4,col="red")
db<-dbscan(htru_1,0.5,2)
db
hullplot(htru_1,db$cluster)
table(htru$class,db$cluster)

#using iris

iris_1<-iris[,1:4]
kNNdistplot(iris_1,k=3)
abline(h=0.4,col="red")
db<-dbscan(iris_1,0.5,4)
db
hullplot(iris_1,db$cluster)
table(iris$Species,db$cluster)


hierarchial

library(rpart)
library(rpart.plot)
library(caret)
library(e1071)
library(class)
install.packages("cluster")
library(cluster)

#using iris

hc_complete<-hclust(dist(iris),method="complete")
plot(hc_complete,main="Hierarchical Clustering Complete",cex=0.9)
cut<-cutree(hc_complete,3)
cut
table(cut,iris$Species)

#using htru_2

htru<-read.csv("HTRU_2.csv",header=FALSE)
names(htru)<-c(" Profile_mean","Profile_stdev","Profile_skewness","Profile_kurtosis"," DM_mean","DM_stdev","DM_skewness", "DM_kurtosis","class")
hc_complete<-hclust(dist(htru),method="complete")
plot(hc_complete,main="Hierarchical Clustering Complete",cex=0.9)
cut<-cutree(hc_complete,3)
cut
table(cut,htru$class)

