```{r}
# Obtén la tabla de genes diferencialmente expresados
de_results <- topTable(eb_results, coef = 2, number = nrow(rse_gene), sort.by = "none")

# Filtra los genes con un valor p ajustado < 0.05
significant_genes <- de_results[de_results$adj.P.Val < 0.05, ]

```

```{r}
# Resumen de los resultados
summary(de_results)

# Primeras filas de los resultados
head(de_results)

```


```{r}
# Extrae los nombres de los genes
gene_list <- rownames(significant_genes)

# Elimina la versión del gen de los identificadores
gene_list <- sub("\\..*", "", gene_list)

```

```{r}
# Asegúrate de que 'your_gene_ids' es el vector que contiene tus IDs de genes
ensembl_ids <- mapIds(org.Mm.eg.db,
                      keys = gene_list,
                      column = "ENSEMBL",
                      keytype = "ENSEMBL", # O "SYMBOL", "ENTREZID", etc., dependiendo de tu tipo de ID de genes
                      multiVals = "first")
```

```{r}
# Realiza el análisis de enriquecimiento de GO
ego <- enrichGO(gene         = gene_list,
                OrgDb         = org.Mm.eg.db,
                keyType       = "ENSEMBL",
                ont           = "BP", # Cambia esto a "CC" o "MF" si estás interesado en componentes celulares o funciones moleculares
                pAdjustMethod = "BH",
                qvalueCutoff  = 0.05)

# Muestra los resultados
print(ego)
```

```{r}
barplot(ego, showCategory=10)
dotplot(ego, showCategory=10)

```
