# 🧬 Case Analysis Transcriptomics – GSE10072

## Analisis Differential Gene Expression pada Lung Adenocarcinoma

---

## 📌 Pendahuluan

Kanker paru merupakan salah satu penyebab utama kematian akibat kanker di dunia. Salah satu subtipe yang paling umum adalah **lung adenocarcinoma**, yang ditandai oleh perubahan ekspresi gen yang signifikan dibandingkan jaringan paru normal. Analisis transcriptomics memungkinkan identifikasi gen yang mengalami perubahan ekspresi (Differentially Expressed Genes / DEG) serta pemahaman jalur biologis yang terlibat dalam proses karsinogenesis.

Pada studi ini digunakan dataset publik **GSE10072** dari NCBI Gene Expression Omnibus (GEO) untuk membandingkan profil ekspresi gen antara jaringan paru normal dan jaringan adenokarsinoma paru menggunakan pendekatan bioinformatika berbasis R.

---

## ⚙️ Metode

### Dataset

* Dataset: GSE10072
* Platform: Affymetrix Human Genome U133A (GPL96)
* Organisme: *Homo sapiens*
* Perbandingan: Normal lung vs Lung adenocarcinoma

### Alur Analisis

1. Pengambilan data menggunakan package GEOquery
2. Preprocessing data dan log2 transform
3. Analisis Differential Expression menggunakan metode limma
4. Visualisasi volcano plot dan heatmap Top 50 DEG
5. Analisis enrichment Gene Ontology (GO) dan KEGG Pathway menggunakan clusterProfiler

### Kriteria DEG

* Adjusted p-value (FDR) < 0.01
* |log2 Fold Change| > 1

---

## 📊 Hasil dan Interpretasi

### 🌋 1. Gen Upregulation dan Downregulation (Volcano Plot)

Hasil analisis menunjukkan adanya gen yang mengalami peningkatan (upregulated) dan penurunan (downregulated) ekspresi antara jaringan tumor dan jaringan normal. Gen dengan logFC positif menunjukkan peningkatan ekspresi pada adenokarsinoma, sedangkan logFC negatif menunjukkan penurunan ekspresi.

Distribusi gen pada volcano plot memperlihatkan sejumlah gen signifikan yang terlibat dalam proses proliferasi sel, regulasi siklus sel, serta mekanisme respon imun yang berubah pada jaringan kanker.

![Volcano Plot](volcano_GSE10072.png)

---

### 🧬 2. Top 50 Differentially Expressed Genes (Heatmap)

Heatmap Top 50 DEG menunjukkan pola klasterisasi yang jelas antara sampel tumor dan normal. Warna merah menunjukkan gen dengan ekspresi tinggi pada jaringan kanker, sedangkan warna biru menunjukkan ekspresi yang lebih rendah.

Pemisahan klaster yang konsisten mengindikasikan bahwa perubahan ekspresi gen bersifat sistemik dan mampu membedakan kondisi biologis secara signifikan.

![Heatmap](heatmap_top50.png)

---

### 🔬 3. Gene Ontology (GO) Enrichment

Analisis Gene Ontology mengidentifikasi keterlibatan gen diferensial dalam proses biologis seperti:

* cell cycle regulation
* mitotic nuclear division
* DNA replication

Proses-proses ini berhubungan dengan peningkatan proliferasi sel yang merupakan karakteristik utama jaringan kanker.

![GO Enrichment](GO_enrichment.png)

---

### 🧭 4. KEGG Pathway Enrichment

Hasil KEGG pathway enrichment menunjukkan keterlibatan beberapa jalur penting seperti:

* pathways in cancer
* p53 signaling pathway
* cell cycle pathway

Temuan ini mengindikasikan adanya gangguan regulasi pertumbuhan sel serta aktivasi jalur proliferatif pada adenokarsinoma paru.

![KEGG Enrichment](KEGG_enrichment.png)

---

## ✅ Kesimpulan

Analisis transcriptomics menggunakan dataset GSE10072 berhasil mengidentifikasi gen-gen yang mengalami perubahan ekspresi signifikan antara jaringan paru normal dan adenokarsinoma paru. Visualisasi volcano plot dan heatmap menunjukkan perbedaan pola ekspresi yang jelas, sementara analisis enrichment GO dan KEGG mengungkap keterlibatan jalur biologis yang berkaitan dengan proliferasi sel dan mekanisme kanker.

Pendekatan bioinformatika ini memberikan wawasan mengenai mekanisme molekuler kanker paru serta potensi kandidat biomarker untuk penelitian lebih lanjut.

---

## 💻 Tools dan Packages

* GEOquery
* limma
* ggplot2
* pheatmap
* clusterProfiler
* org.Hs.eg.db

---

## 👨‍🎓 Author

Nama: Tana Graha
Course: BRSP Transcriptomics
Institusi: 
