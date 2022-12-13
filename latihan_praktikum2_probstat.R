# Soal no 1
# a. cari selisih pasangan dan standar deviasi
sebelum <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
sesudah <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
selisih <- sesudah - sebelum
sd(selisih)

# b. cari nilai t (p-value)
t.test(sesudah, sebelum, paired = TRUE)

# c. apakah ada pengaruh signifikan terhadap saturasi oksigen sebelum dan sesudah melakukan aktivitas a
# α = 5% dan h0 : "tidak ada pengaruh signifikan"
# melihat hasil p-value yang didapatkan dari poin b, yakni 6.003e-05, yang mana lebih kecil dari α, maka kita tolak h0 atau terima h1
# sehingga dapat disimpulkan bahwa terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴sebesar 5%

# Soal no 2
# a. Setuju dengan klaim? (ada di readme)
# b. Jelaskan maksud output (penjelasan ada di readme)
library(BSDA)
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)
# c. buat kesimpulan berdasarkan p-value (ada di readme)


# Soal no 3
# a. tentukan h0 dan h1 (ada di readme)
# b. hitung sampel statistik
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, 
          mean.y = 2.79, s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)

# c. uji sampel statistik (df = 2)
library(mosaic)
plotDist(dist = 't', df = 2, col = "red")

# d. nilai kritikal
qchisq(p = 0.05, df = 2, lower.tail = FALSE)

# e. keputusan (ada di readme)
# f. kesimpulan (ada di readme)


# Soal no 4
# a. buat 3 grup untuk masing - masing spesies dan gambarkan plot kuantil normalnya
data <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"), h = T)

data$Group <- as.factor(data$Group)
data$Group = factor(data$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(data$Group)

Group1 <- subset(data, Group == "Kucing Oren")
Group2 <- subset(data, Group == "Kucing Hitam")
Group3 <- subset(data, Group == "Kucing Putih")

qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)

# b. cari homogenitas variancenya
bartlett.test(Length ~ Group, data = data)

# c. uji anova dan model linearnya
model1 = lm(Length ~ Group, data = data)
anova(model1)

# e. uji tukey
TukeyHSD(aov(model1))

# f. visualisasi data
library("ggplot2")
ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")

# Soal no. 5
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
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

# c. tampilkan tabel mean dan sd keluaran cahaya untuk setiap pemberlakuan
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

# d. uji tukey
tukey <- TukeyHSD(anova)
print(tukey)

# e. perbedaan uji tukey dan uji anova
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)