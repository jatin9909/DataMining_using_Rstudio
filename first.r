library(editrules)
d = read.table("D:\\1227\\Data Mining\\people.txt", header = TRUE)  #select people.txt

E <- editset(expression(
  age >= 0,
  age <= 150,
  age > yearsmarried,
  height > 0,
  #yearsmarried > 0,
  status %in% c('single','married','widowed'),
  if(age <= 18) agegroup %in% c('child'),
  if(age > 18 && age < 65 ) agegroup %in% c('adult'),
  if(age >= 65) agegroup %in% c('elderly')
))

plot(E)
sm <- violatedEdits(E,d)
sm
summary(sm)
plot(sm)

getwd()
