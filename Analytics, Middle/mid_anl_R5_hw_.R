library(DescTools)
library(tidyverse)

dat = read.csv("D:/Skillbox/Analytics, Middle/experiment.csv")

dat.control <- dat %>% count(control)
dat.test <- dat %>% count(test)

binom.control <- BinomCI(dat.control[2,2],
        length(dat[,1]), 
        conf.level = 0.9)
binom.test <- BinomCI(dat.test[2,2],
                      length(dat[,1]), 
                      conf.level = 0.9)

MeanCI(dat$control, conf.level = 0.9)
MeanCI(dat$test, conf.level = 0.9)
# �������� ����� ���������
# ��������� �� ������������, ������������ �������� ��� �������� ������ ���� 
# ����������� ����� ������ ������, �������� ����� ������