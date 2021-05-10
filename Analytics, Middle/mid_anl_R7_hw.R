parf <- read.csv("D:/Skillbox/Analytics, Middle/Jewelry.csv")
dat <- parf[parf$vote != 2,]
test <- dat[dat$group == 'test','vote']
control <- dat[dat$group == 'control','vote']

barplot(table(dat$vote, dat$group), 
        beside=TRUE, 
        legend.text=TRUE, 
        col=c('green', 'blue'))

p_test <- sum(test) / length(test)
p_control <- sum(control) / length(control)
mean_number <- p_test - p_control

# правосторонняя гипотеза

N <- 1000
set.seed(123)
differences <- rep(NA, N) # 1000 пустых элементов
for(i in 1:N){
  s1 <- sample(control,replace=TRUE) # выборка для old с возвращением
  s2 <- sample(test,replace=TRUE) # выборка для new с возвращением
  p1 <- sum(s1)/length(s1) # доля 1 в old
  p2 <- sum(s2)/length(s2) # доля 1 в new
  p_diff <- p2 - p1 # разница в долях
  differences[i] <- p_diff # записываем ее в differences
}
differences_cent = differences - mean(differences)
alpha <- 0.05
p_value <- sum(differences_cent>mean_number) / N

# все значения в новом распределении меньше, чем среднее значение на имеющейся выборке
# нулевую гипотезу отвергаем, т.е. разница есть
# рассчитанное лежит справа,правосторонняя гипотеза верна
# черно белая реклама эффективнее 

