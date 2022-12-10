# Soal no 1
# a. cari selisih pasangan dan standar deviasi
sebelum <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
sesudah <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
selisih <- sesudah - sebelum
sd(selisih)

# b. cari nilai t (p-value)
t.test(sesudah, sebelum, paired = TRUE)

# Soal no 2
# b. hitung sampel statistik
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, 
          mean.y = 2.79, s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)

# Soal no 3
# b. buat 3 grup untuk masing - masing spesies dan gambarkan plot kuantil normalnya
myFile  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"), h=T) 
dim(myFile)
head(myFile)
attach(myFile)

myFile$Group <- as.factor(myFile$Group)
myFile$Group = factor(myFile$Group,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih"))

class(myFile$Group)

group1 <- subset(myFile, Group=="Kucing Oren")
group2 <- subset(myFile, Group=="Kucing Hitam")
group3 <- subset(myFile, Group=="Kucing Putih")

qqnorm(group1$Length)
qqline(group1$Length)

dataoneway <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"), h=T)
dim(myFile)
head(myFile)
attach(dataoneway)
names(dataoneway)

dataoneway$Group <- as.factor(dataoneway$Group)
dataoneway$Group = factor(dataoneway$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(dataoneway$Group)

Group1 <- subset(dataoneway, Group == "Kucing Oren")
Group2 <- subset(dataoneway, Group == "Kucing Hitam")
Group3 <- subset(dataoneway, Group == "Kucing Putih")

qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)

# b. cari homogenitas variancenya
bartlett.test(Length ~ Group, data = dataoneway)

# Soal no. 4
# a. buat plot sederhana
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("GTL.csv")
head(GTL)
str(GTL)
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

# b. Uji anova 2 arah untuk 2 faktor
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

# c. tampilkan tabel mean dan sd keluaran cahaya untuk setiap pemberlakuan
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)