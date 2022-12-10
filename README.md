# Modul2_Probstat_5025211142

Nama  : Mohammad Zhafran Dzaky <br>
NRP   : 5025211142 <br>
Kelas : Probabilitas dan Statistika  

## Soal 1

Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴.


| Responden |   X   |   Y   |
| :-------: | :-----: | :-----: |
| 1 | 78 | 100 |
| 2 | 75 | 95 |
| 3 | 67 | 70 |
| 4 | 77 | 90 |
| 5 | 70 | 90 |
| 6 | 72 | 90 |
| 7 | 78 | 89 |
| 8 | 74 | 90 |
| 9 | 77 | 100 |

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

A . Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas  
- Simpan terlebih dahulu data sebelum dan data sesudah aktivitas, lalu cari dan simpan selisihnya, dan dapatkan standar deviasinya menggunakan fungsi bawaan dari R.  
  ```R
  sebelum <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
  sesudah <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
  selisih <- sesudah - sebelum
  sd(selisih)
  ```
  
B . Carilah nilai t (p-value)  
- Untuk mendapatkan p-value, kita dapat menggunakan fungsi dari t yaitu test dengan parameter data sesudah dan data sebelum sebagai berikut
    ```R
    t.test(sesudah, sebelum, paired = TRUE)
    ```
C . Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”  
- Melihat hasil p-value yang didapatkan dari poin b, yakni 6.003e-05, yang mana lebih kecil dari α, 
  maka kita tolak h0 atau terima h1 sehingga dapat disimpulkan bahwa terdapat pengaruh yang signifikan 
  secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴sebesar 5%

<br>

## Soal 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. 
(Kerjakan menggunakan 16 library seperti referensi pada modul).

A . Apakah Anda setuju dengan klaim tersebut?  
- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  
B . Jelaskan maksud dari output yang dihasilkan!  
- Untuk melakukan hal ini, pertama kita perlu install dan run terlebih dahulu package untuk library `BSDA` yang kita butuhkan sebagai berikut,  
  ```R
  install.packages("BSDA")
  library(BSDA)
  ```
- lalu kita gunakan fungsi `tsum.test()` dengan parameter mean, standar deviasi, serta jumlah sampel yang telah disebutkan dalam soal sebagai berikut.  
  ```R
  tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)
  ```
  Hasil tersebut menunjukkan bahwa dengan selang kepercayaan sebesar 95%, didapatkan hasil perhitungan rata - rata jarak tempuh mobil menggunakan sampel acak untuk 100 responden adalah di antara 22726,16 km dan 24273,84 km per tahunnya sehingga klaim awal atau h0 pada soal dapat diterima
  
C . Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!  
- Dapat dilihat pada hasil dari poin b, p-value yang didapatkan (< 2.2e-16) lebih kecil dibandingkan dengan *significant level* α = 0,05, maka kita tolak h0. sehingga dapat disimpulkan bahwa rata - rata jarak tempuh mobil per tahunnya lebih besar dari 20.000 km.

<br>

## Soal 3
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

| Nama Kota/Atribut | Bandung | Bali |
| :--------------- | :-----: | :---:|
| Jumlah Saham | 19 | 27
| Sampel Mean | 3,64 | 2,79 |
| Sampel Standar Deviasi | 1,67 | 1,32 |

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah :

A . H0 dan H1  
- Berdasarkan deskripsi dan data soal, dapat kita susun H0 dan H1 sebagai berikut,  
  ```
  H0 : μ1 = μ2 (rata-rata saham di Bandung sama dengan di Bali)
  H1 : μ1 ≠ μ2 (rata-rata saham di Bandung tidak sama dengan di Bali)
  ```
B . Hitung Sampel Statistik  
- Sampel statistik dapat kita hasilkan menggunakan fungsi yang sama seperti sebelumnya, yaitu `tsum.test()` dengan parameter yang sama pula sebagai berikut,  
  ```R
  tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, 
          mean.y = 2.79, s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)
  ```
C . Lakukan Uji Statistik (df = 2)  
- Untuk melakukan hal ini, pertama kita perlu untuk install dan run package untuk library `mosaic` yang kita butuhkan sebagai berikut,  
  ```R
  install.packages("mosaic")
  library(mosaic)
  ```
- kemudian gunakan fungsi `plotDist()` untuk memvisualisasikan sampel statistik yang diminta, yaitu dengan derajat bebas 2  
  ```R
  plotDist(dist = 't', df = 2, col = "red")
  ```
D . Nilai Kritikal  
- untuk mendapatkan nilai kritikal, dapat kita gunakan fungsi `qchisq()` dengan derajat bebas yang diminta pada soal sebagai berikut,  
  ```R
  qchisq(p = 0.05, df = 2, lower.tail = FALSE)
  ```
E . Keputusan  
- lorem ipsum dolor sit amet  
  
F . Kesimpulan  
- lorem ipsum dolor sit amet

<br>

## Soal 4
Seorang Peneliti sedang meneliti spesies dari kucing di ITS. Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing.

Jika diketahui dataset pada https://intip.in/datasetprobstat1 dan H0 adalah tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama, maka kerjakan atau carilah:

A . Buatlah masing masing jenis spesies menjadi  3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.  
- pertama, kita ambil terlebih dahulu data dari link yang diberikan pada soal menggunakan fungsi `read.table()` sebagai berikut, 
  ```R
  data <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"), h = T)
  ``` 
- selanjutnya, kita buat grup dengan label yang sesuai untuk masing - masing spesies  
  ```R
  data$Group <- as.factor(data$Group)
  data$Group = factor(data$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))
  ```
- Kemudian, cek terlebih dahulu apakah data setiap grup sudah tersimpan sebagai berikut,  
  ```R
  class(data$Group)
  ```
- selanjutnya, kelompokkan data tersebut sesuai dengan grupnya masing - masing.  
  ```R
  Group1 <- subset(data, Group == "Kucing Oren")
  Group2 <- subset(data, Group == "Kucing Hitam")
  Group3 <- subset(data, Group == "Kucing Putih")
  ```
- terakhir, baru kita gambarkan plot kuantil normal untuk masing - masing grup menggunakan fungsi `qnorm` dan `qqline()` sebagai berikut,  
  ```R
  qqnorm(Group1$Length)
  qqline(Group1$Length)

  qqnorm(Group2$Length)
  qqline(Group2$Length)

  qqnorm(Group3$Length)
  qqline(Group3$Length)
  ```
B . Carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil?  
- untuk menguji homogenitas dari variansnya, dapat kita gunakan fungsi `bartlett.test()` sebagai berikut,  
  ```R
  bartlett.test(Length ~ Group, data = data)
  ```
  yang didapatkan nilai Bartlett's K-squared sebesar 0.43292, df = 2, dan p-value = 0.8054  
  
C . Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.  
- Untuk melakukan uji anova dan membuat model liniernya, dapat kita gunakan fungsi lm() dan anova() sebagai berikut,  
  ```R
  model1 = lm(Length ~ Group, data = data)
  anova(model1)
  ```
D . Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?  
- lorem ipsum dolor sit amet  
  
E . Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? jelaskan.  
- untuk melakukan verifikasi menggunakan test Tuket, dapat kita gunakan fungsi `tukeyHSD()` dengan parameter yang akan dicek sebagai berikut,  
  ```R
  TukeyHSD(aov(model1))
  ```
  Dari hasil tersebut, dapat dilihat bahwa dengan menggunakan 𝛼 = 5%, perbedaan panjang kucing yang signifikan adalah grup 2 (Kucing Hitam) terhadap grup 1 (Kucing Oren) dan grup 3 (Kucing Putih).  
  
F . Visualisasikan data dengan ggplot2  
- untuk melakukan hal ini, pertama kita perlu install dan run terlebih dahulu package untuk library yang kita butuhkan sebagai berikut,  
  ```R
  install.packages("ggplot2")
  library("ggplot2")
  ```
  barulah kita gunakan fungsi `ggplot()` untuk memvisualisasikan datanya sebagai berikut,
  ```R
  ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")
  ```

<br>

## Soal 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: [Data Hasil Eksperimen](https://drive.google.com/file/d/1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ/view). Dengan data tersebut: 

A . Buatlah plot sederhana untuk visualisasi data  
- pertama kita perlu install dan run terlebih dahulu package untuk library yang kita butuhkan sebagai berikut,  
  ```R
  install.packages("multcompView")
  library(readr)
  library(ggplot2)
  library(multcompView)
  library(dplyr)
  ```
- Kemudian download file .CSV dari soal dan baca datanya dari document menggunakan fungsi `read_csv()` sebagai berikut,  
  ```R
  GTL <- read_csv("GTL.csv")
  head(GTL)
  ```
- lalu lakukan observasi data sebagai berikut,  
  ```R
  str(GTL)
  ```
- barulah visualisasikan dengan *simple plot* menggunakan fungsi `qplot()` sebagai berikut,  
  ```R
  qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
  ```
B . Lakukan uji ANOVA dua arah  
- pertama, buat variabel as.factor sebagai anova dan observasi datanya.  
  ```R
  GTL$Glass <- as.factor(GTL$Glass)
  GTL$Temp_Factor <- as.factor(GTL$Temp)
  str(GTL)
  ```
- selanjutnya, lakukan *analysis of variance* sebagai berikut,  
  ```R
  anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
  summary(anova)
  ```
C . Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)  
- untuk melakukan hal ini, dapat kita gunakan fungsi `group_by` lalu lakukan `summarise` sesuai mean dan standar deviasi yang berlaku sebagai berikut,  
  ```R
  data_summary <- group_by(GTL, Glass, Temp) %>%
    summarise(mean=mean(Light), sd=sd(Light)) %>%
    arrange(desc(mean))
  print(data_summary)
  ```
D . Lakukan uji Tukey  
- sama seperti sebelumnya, dapat kita gunakan fungsi `tukeyHSD()` sebagai berikut,  
  ```R
  tukey <- TukeyHSD(anova)
  print(tukey)
  ```
E . Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
- pertama, buat terlebih dahulu *compact letter display* menggunakan fungsi `multcompLetters4()` sebagai berikut,  
  ```R
  tukey.cld <- multcompLetters4(anova, tukey)
  print(tukey.cld)
  ```
- kemudian tambahkan *compact letter display* tersebut ke tabel dengan mean dan standar deviasinya sebagai berikut,  
  ```R
  cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
  data_summary$Tukey <- cld$Letters
  print(data_summary)
  ```
<br>

```
Berikut adalah contoh daftar package dan fungsi yang dapat digunakan (dapat pula
menggunakan contoh lainnya)
- Packages: readr, ggplot2, multcompView, dplyr
- Function: aov, TukeyHSD, qplot, group_by, summarise, multcompLetters4
```
