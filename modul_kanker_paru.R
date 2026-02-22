###############################################################
# FINAL SCRIPT - Case Analysis GSE10072
###############################################################

# ==============================
# LOAD PACKAGE
# ==============================

library(GEOquery)
library(limma)
library(pheatmap)
library(ggplot2)
library(dplyr)
library(hgu133a.db)
library(AnnotationDbi)
library(umap)
library(clusterProfiler)
library(org.Hs.eg.db)

# ==============================
# DOWNLOAD DATA
# ==============================

gset <- getGEO("GSE10072", GSEMatrix = TRUE, AnnotGPL = TRUE)[[1]]

ex <- exprs(gset)

# ==============================
# LOG2 TRANSFORM CHECK
# ==============================

qx <- as.numeric(quantile(ex, c(0,0.25,0.5,0.75,0.99,1), na.rm=TRUE))
LogTransform <- (qx[5] > 100) || (qx[6]-qx[1] > 50 && qx[2] > 0)

if (LogTransform) {
  ex[ex <= 0] <- NA
  ex <- log2(ex)
}

# ==============================
# GROUP DEFINE
# ==============================

group_info <- pData(gset)[["source_name_ch1"]]
groups <- make.names(group_info)
gset$group <- factor(groups)

design <- model.matrix(~0 + gset$group)
colnames(design) <- levels(gset$group)

nama_grup <- levels(gset$group)
contrast_formula <- paste(nama_grup[1], "-", nama_grup[2])

# ==============================
# LIMMA ANALYSIS
# ==============================

fit <- lmFit(ex, design)
contrast_matrix <- makeContrasts(contrasts = contrast_formula, levels = design)

fit2 <- contrasts.fit(fit, contrast_matrix)
fit2 <- eBayes(fit2)

topTableResults <- topTable(
  fit2,
  adjust="fdr",
  sort.by="B",
  number=Inf,
  p.value=0.01
)

# ==============================
# ANNOTATION
# ==============================

probe_ids <- rownames(topTableResults)

gene_annotation <- AnnotationDbi::select(
  hgu133a.db,
  keys=probe_ids,
  columns=c("SYMBOL","GENENAME"),
  keytype="PROBEID"
)

topTableResults$PROBEID <- rownames(topTableResults)

topTableResults <- merge(
  topTableResults,
  gene_annotation,
  by="PROBEID",
  all.x=TRUE
)

# ==============================
# VOLCANO PLOT
# ==============================

volcano_data <- data.frame(
  logFC=topTableResults$logFC,
  adj.P.Val=topTableResults$adj.P.Val,
  Gene=topTableResults$SYMBOL
)

volcano_data$status <- "NO"
volcano_data$status[volcano_data$logFC > 1 & volcano_data$adj.P.Val < 0.01] <- "UP"
volcano_data$status[volcano_data$logFC < -1 & volcano_data$adj.P.Val < 0.01] <- "DOWN"

ggplot(volcano_data, aes(logFC, -log10(adj.P.Val), color=status))+
  geom_point(alpha=0.6)+
  scale_color_manual(values=c("DOWN"="blue","NO"="grey","UP"="red"))+
  theme_minimal()+
  ggtitle("Volcano Plot DEG Kanker Paru")

# ==============================
# HEATMAP TOP 50
# ==============================

topTableResults <- topTableResults[order(topTableResults$adj.P.Val),]
top50 <- head(topTableResults,50)

mat_heatmap <- ex[top50$PROBEID,]

gene_label <- ifelse(is.na(top50$SYMBOL)|top50$SYMBOL=="",
                     top50$PROBEID,
                     top50$SYMBOL)

rownames(mat_heatmap) <- gene_label

mat_heatmap <- mat_heatmap[rowSums(is.na(mat_heatmap))==0,]
gene_variance <- apply(mat_heatmap,1,var)
mat_heatmap <- mat_heatmap[gene_variance>0,]

annotation_col <- data.frame(Group=gset$group)
rownames(annotation_col) <- colnames(mat_heatmap)

pheatmap(
  mat_heatmap,
  scale="row",
  annotation_col=annotation_col,
  show_colnames=FALSE,
  fontsize_row=7,
  main="Top 50 Differentially Expressed Genes"
)

# ==============================
# GO ENRICHMENT
# ==============================

genes <- na.omit(unique(topTableResults$SYMBOL))

ego <- enrichGO(
  gene=genes,
  OrgDb=org.Hs.eg.db,
  keyType="SYMBOL",
  ont="BP"
)

dotplot(ego)+ggtitle("GO Enrichment")

# ==============================
# KEGG ENRICHMENT
# ==============================

kegg <- enrichKEGG(
  gene=genes,
  organism="hsa"
)

dotplot(kegg)+ggtitle("KEGG Pathway Enrichment")

# ==============================
# SAVE RESULT
# ==============================

write.csv(topTableResults,"Hasil_GSE10072_DEG.csv")

message("Analisis FINAL selesai.")s