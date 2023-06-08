
```{r}
# Generar el modelo linear estadistico
mod <- model.matrix(~   sra_attribute.Stage + sra_attribute.genotype_variation + assigned_gene_prop,
    data = colData(rse_gene))
# Observar las variables que componen el modelo
colnames(mod)
```

```{R }
vGene <- voom(dge, mod, plot = TRUE)
```

```{R}
eb_results <- eBayes(lmFit(vGene))
de_results <- topTable(
    eb_results,
    coef = 2,
    number = nrow(rse_gene),
    sort.by = "none"
)
dim(de_results)
```

```{R}
head(de_results)
```

```{R}
table(de_results$adj.P.Val < 0.05)
```

```{R}
## Visualicemos los resultados estadísticos
limma::plotMA(eb_results, coef = 2)
```

```{R}
volcanoplot(eb_results, coef = 2, highlight = 10, names = de_results$gene_name)
```



```{r}
## Extraer valores de los genes de interés
exprs_heatmap <- vGene$E[rank(de_results$adj.P.Val) <= 30, ]
## Creemos una tabla con información de las muestras
## y con nombres de columnas más amigables
df <- as.data.frame(colData(rse_gene)[, 
        c("sra_attribute.Stage","sra_attribute.genotype_variation" )])
colnames(df) <- c("Age", "Genotype")
## Hacer el p heatmap
pheatmap(
    exprs_heatmap,
    cluster_rows = TRUE,
    cluster_cols = TRUE,
    show_rownames = FALSE,
    show_colnames = FALSE,
    annotation_col = df
)
```
