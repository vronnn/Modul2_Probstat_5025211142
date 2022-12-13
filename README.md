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
  <img width="482" alt="image" src="https://user-images.githubusercontent.com/105977864/206892687-b32e3192-7f83-495f-a4d2-b7b1a96eb757.png">
  
B . Carilah nilai t (p-value)  
- Untuk mendapatkan p-value, kita dapat menggunakan fungsi dari t yaitu test dengan parameter data sesudah dan data sebelum sebagai berikut
    ```R
    t.test(sesudah, sebelum, paired = TRUE)
    ```
    <img width="480" alt="image" src="https://user-images.githubusercontent.com/105977864/206892717-5bae4e11-6778-4033-94b3-3f964b36be60.png">
C . Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”  
- Melihat hasil p-value yang didapatkan dari poin b, yakni 6.003e-05, yang mana lebih kecil dari α, 
  maka kita tolak h0 atau terima h1 sehingga dapat disimpulkan bahwa terdapat pengaruh yang signifikan 
  secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴sebesar 5%

<br>

## Soal 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. 
(Kerjakan menggunakan 16 library seperti referensi pada modul).

A . Apakah Anda setuju dengan klaim tersebut?  
- Setuju, karena hasil dari perhitungan menggunakan sampel acak untuk 100 responden menunjukkan bahwa rata - rata jarak tempuh mobil pertahunnya mencapai 23.500 km sedangkan klaim soal menyatakan bahwa rata - ratanya lebih dari 20.000 km sehingga sangatlah mungkin bahwa klaim tersebut valid.
  
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
  <img width="481" alt="image" src="https://user-images.githubusercontent.com/105977864/206892921-dc237993-973e-4088-a86c-0e1d7108f711.png">  
    
  Hasil tersebut menunjukkan bahwa dengan selang kepercayaan sebesar 95%, didapatkan hasil perhitungan rata - rata jarak tempuh mobil menggunakan sampel acak untuk 100 responden adalah di antara 22726,16 km dan 24273,84 km per tahunnya sehingga tolak h0 dan terima h1 yang merupakan klaim pada soal
  
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
  <img width="493" alt="image" src="https://user-images.githubusercontent.com/105977864/206893003-b153b9c6-fbb4-4f75-afac-7ba6c0eb01a1.png">
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
  <img width="933" alt="image" src="https://user-images.githubusercontent.com/105977864/206893183-a31cb7a8-80ac-42cb-9b46-ae26b4937919.png">
D . Nilai Kritikal  
- untuk mendapatkan nilai kritikal, dapat kita gunakan fungsi `qchisq()` dengan derajat bebas yang diminta pada soal sebagai berikut,  
  ```R
  qchisq(p = 0.05, df = 2, lower.tail = FALSE)
  ```
  <img width="549" alt="image" src="https://user-images.githubusercontent.com/105977864/206893244-be852eea-2bd4-4d23-bac3-22842a15eedf.png">
E . Keputusan  
- Melihat p-value yang lebih kecil dari α, maka kita tolak H0 dan terima H1
  
F . Kesimpulan  
- Terdapat perbedaan rata - rata nilai saham di Bandung dengan di Bali

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
  <img width="551" alt="image" src="https://user-images.githubusercontent.com/105977864/206895109-53188103-cbc0-4053-83e1-32c5edf5d9d1.png">
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
  <img width="960" alt="image" src="https://user-images.githubusercontent.com/105977864/206895578-c11fe532-77f5-42f3-8458-086e40faa319.png">
B . Carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil?  
- untuk menguji homogenitas dari variansnya, dapat kita gunakan fungsi `bartlett.test()` sebagai berikut,  
  ```R
  bartlett.test(Length ~ Group, data = data)
  ```
  <img width="549" alt="image" src="https://user-images.githubusercontent.com/105977864/206895805-a9904191-af76-459c-9648-2518ead651f5.png">  
    
  yang didapatkan nilai Bartlett's K-squared sebesar 0.43292, df = 2, dan p-value = 0.8054  
  
C . Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.  
- Untuk melakukan uji anova dan membuat model liniernya, dapat kita gunakan fungsi lm() dan anova() sebagai berikut,  
  ```R
  model1 = lm(Length ~ Group, data = data)
  anova(model1)
  ```
  <img width="548" alt="image" src="https://user-images.githubusercontent.com/105977864/206898166-3d6903c7-ba7f-4401-a40b-f77a25dca4f0.png">
D . Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?  
- Berdasarkan hasil yang didapatkan pada poin sebelumnya, p-value bernilai 0.0013 dengan taraf 5%. Maka, terdapat perbedaan panjang kucing yang signifikan berdasarkan grupnya.
  
E . Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? jelaskan.  
- untuk melakukan verifikasi menggunakan test Tuket, dapat kita gunakan fungsi `tukeyHSD()` dengan parameter yang akan dicek sebagai berikut,  
  ```R
  TukeyHSD(aov(model1))
  ```
  <img width="478" alt="image" src="https://user-images.githubusercontent.com/105977864/206898664-c54bb30d-d65d-4997-9f7b-833ebade2237.png">
    
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
  <img width="960" alt="image" src="https://user-images.githubusercontent.com/105977864/206898740-6ccf9b08-8925-424e-8427-9d061a704d3c.png">

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
  <img width="592" alt="image" src="https://user-images.githubusercontent.com/105977864/206898809-ff8b7623-f371-4c60-9cf7-7aa54b530476.png">
- lalu lakukan observasi data sebagai berikut,  
  ```R
  str(GTL)
  ```
  <img width="591" alt="image" src="https://user-images.githubusercontent.com/105977864/206898858-496f699f-f954-460b-aecb-c1e3e6e37f41.png">
- barulah visualisasikan dengan *simple plot* menggunakan fungsi `qplot()` sebagai berikut,  
  ```R
  qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
  ```
  <img width="960" alt="image" src="https://user-images.githubusercontent.com/105977864/206898907-75f30b0d-bd4a-4f69-8f08-bc189d10f4a9.png">
B . Lakukan uji ANOVA dua arah  
- pertama, buat variabel as.factor sebagai anova dan observasi datanya.  
  ```R
  GTL$Glass <- as.factor(GTL$Glass)
  GTL$Temp_Factor <- as.factor(GTL$Temp)
  str(GTL)
  ```
  <img width="592" alt="image" src="https://user-images.githubusercontent.com/105977864/206898951-b5725b34-9110-45c3-84dd-9583531fe8ca.png">
- selanjutnya, lakukan *analysis of variance* sebagai berikut,  
  ```R
  anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
  summary(anova)
  ```
  <img width="592" alt="image" src="https://user-images.githubusercontent.com/105977864/206898987-35fc5afb-784f-4fdd-8bc7-57968b3624db.png">
C . Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)  
- untuk melakukan hal ini, dapat kita gunakan fungsi `group_by` lalu lakukan `summarise` sesuai mean dan standar deviasi yang berlaku sebagai berikut,  
  ```R
  data_summary <- group_by(GTL, Glass, Temp) %>%
    summarise(mean=mean(Light), sd=sd(Light)) %>%
    arrange(desc(mean))
  print(data_summary)
  ```
  <img width="592" alt="image" src="https://user-images.githubusercontent.com/105977864/206899121-4067ab78-6661-4fa0-835a-6e0eb4f8f164.png">
  <img width="592" alt="image" src="https://user-images.githubusercontent.com/105977864/206899084-95716768-946f-46b2-bd2a-4015ba58b206.png">
D . Lakukan uji Tukey  
- sama seperti sebelumnya, dapat kita gunakan fungsi `tukeyHSD()` sebagai berikut,  
  ```R
  tukey <- TukeyHSD(anova)
  print(tukey)
  ```
  <img width="595" alt="image" src="https://user-images.githubusercontent.com/105977864/206899297-ed81bf7b-e3e2-469b-9566-16201183e1e7.png">
  <img width="596" alt="image" src="https://user-images.githubusercontent.com/105977864/206899358-338c05fc-411a-47f5-99d2-80f115b4dc8f.png">
E . Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
- pertama, buat terlebih dahulu *compact letter display* menggunakan fungsi `multcompLetters4()` sebagai berikut,  
  ```R
  tukey.cld <- multcompLetters4(anova, tukey)
  print(tukey.cld)
  ```
  <img width="466" alt="image" src="https://user-images.githubusercontent.com/105977864/206899541-754500ef-7296-492f-830b-94c7456f2589.png">
- kemudian tambahkan *compact letter display* tersebut ke tabel dengan mean dan standar deviasinya sebagai berikut,  
  ```R
  cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
  data_summary$Tukey <- cld$Letters
  print(data_summary)
  ```
  <img width="466" alt="image" src="https://user-images.githubusercontent.com/105977864/206899605-728f0389-b79b-4496-a258-193d256ac1bf.png">
<br>

```
Berikut adalah contoh daftar package dan fungsi yang dapat digunakan (dapat pula
menggunakan contoh lainnya)
- Packages: readr, ggplot2, multcompView, dplyr
- Function: aov, TukeyHSD, qplot, group_by, summarise, multcompLetters4
```
