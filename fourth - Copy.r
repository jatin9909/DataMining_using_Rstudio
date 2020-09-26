library(arules)
data(Groceries)

#SUPPORT=0.1% CONFIDENCE=80%
itemFrequencyPlot(Groceries, topN=20, type="absolute")
rules <- apriori(Groceries, parameter=list(sup=0.001,conf=0.8))
inspect(head(rules))
rules <- sort(rules, by="confidence", decreasing = TRUE)
inspect(head(rules))


#SUPPORT=0.5% CONFIDENCE=70%
itemFrequencyPlot(Groceries, topN=20, type="absolute")
rules <- apriori(Groceries, parameter=list(sup=0.005,conf=0.7))
inspect(head(rules))
rules <- sort(rules, by="confidence", decreasing = TRUE)
inspect(head(rules))
