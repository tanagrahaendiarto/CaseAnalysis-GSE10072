Case Analysis Transcriptomics – GSE10072

 Differential Gene Expression Analysis of Lung Adenocarcinoma

---

Pendahuluan

Kanker paru merupakan salah satu penyebab utama kematian akibat kanker di dunia, dengan **lung adenocarcinoma** sebagai subtipe paling umum pada kelompok non-small cell lung cancer (NSCLC). Perubahan ekspresi gen berperan penting dalam proses karsinogenesis, seperti peningkatan proliferasi sel, gangguan siklus sel, serta perubahan jalur pensinyalan.

Pada analisis ini digunakan dataset publik **GSE10072** dari NCBI GEO untuk membandingkan profil ekspresi gen antara jaringan paru normal dan jaringan adenokarsinoma paru menggunakan pendekatan transcriptomics berbasis microarray.

**Tujuan analisis:**

* Mengidentifikasi Differentially Expressed Genes (DEG)
* Menampilkan visualisasi volcano plot dan heatmap
* Menginterpretasikan implikasi biologis perubahan ekspresi gen

---

Metode

 Dataset

* ID Dataset : GSE10072
* Platform : Affymetrix HG-U133A (GPL96)
* Perbandingan : Normal lung vs Lung adenocarcinoma

Workflow Analisis

1. Pengambilan data menggunakan GEOquery
2. Preprocessing dan log2 transform
3. Analisis DEG menggunakan limma
4. Visualisasi volcano plot dan heatmap top 50 gen
5. Penyimpanan hasil dalam format CSV

 Kriteria DEG

* Adjusted p-value (FDR) < 0.01
* |log2 Fold Change| > 1

---

 Hasil dan Interpretasi

 Volcano Plot

![Volcano Plot](volcano_GSE10072.png)

Volcano plot menunjukkan distribusi gen berdasarkan nilai log2 fold change dan signifikansi statistik. Gen dengan logFC positif menunjukkan peningkatan ekspresi pada jaringan adenokarsinoma, sedangkan logFC negatif menunjukkan penurunan ekspresi pada jaringan normal.

Perubahan ekspresi gen yang signifikan mengindikasikan adanya reprogramming transkriptomik yang berhubungan dengan proses tumorigenesis.

---

Heatmap Top 50 Differentially Expressed Genes

![Heatmap](heatmap_top50.png)

Heatmap memperlihatkan klasterisasi yang jelas antara kelompok tumor dan normal. Pola warna merah menunjukkan peningkatan ekspresi gen pada adenokarsinoma, sedangkan biru menunjukkan penurunan ekspresi.

Pemisahan klaster ini menunjukkan bahwa gen-gen diferensial memiliki peran penting dalam membedakan kondisi biologis kanker paru dan jaringan sehat.

---

Diskusi Biologis

Hasil analisis menunjukkan dominasi gen yang berkaitan dengan proliferasi sel dan regulasi siklus sel. Aktivasi jalur proliferatif merupakan karakteristik umum pada jaringan kanker, sedangkan beberapa gen terkait fungsi paru normal mengalami penurunan ekspresi.

Pendekatan transcriptomics memungkinkan identifikasi kandidat biomarker potensial serta memberikan pemahaman lebih dalam mengenai mekanisme molekuler adenokarsinoma paru.

---

 kesimpulan

Analisis ekspresi gen menggunakan dataset GSE10072 berhasil mengidentifikasi sejumlah Differentially Expressed Genes antara jaringan adenokarsinoma paru dan jaringan paru normal. Visualisasi volcano plot dan heatmap menunjukkan perbedaan pola ekspresi yang jelas dan mendukung interpretasi biologis terkait proses karsinogenesis.

---

 Tools & Packages

* GEOquery
* limma
* ggplot2
* pheatmap
* hgu133a.db
* umap

---

 Author

Nama: Tana Graha Endiarto
Course: BRSP Transcriptomics
Institusi: