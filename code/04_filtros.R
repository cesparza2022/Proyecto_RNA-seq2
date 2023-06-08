## Revisar calidad

```{r qual_check1}
## http://rna.recount.bio/docs/quality-check-fields.html
# Analisis de calidad
rse_gene$assigned_gene_prop <- rse_gene$recount_qc.gene_fc_count_all.assigned / rse_gene$recount_qc.gene_fc_count_all.total
summary(rse_gene$assigned_gene_prop)
```

```{r qual_check2}
assignedGeneProp <- data.frame(Categoria = rse_gene$assigned_gene_prop)
fig1 <-ggplot(assignedGeneProp, aes(x=Categoria)) + 
  geom_histogram(color="black", fill= 'darkblue') +
  xlab('Assigned gene prop')
fig1
```

```{r}
rse_gene$sra_attribute.Stage
rse_gene$sra_attribute.genotype_variation
```


```{r attrbt_check}
# Graficar los niveles de expresion en distintas edades
with(colData(rse_gene), plot(assigned_gene_prop, sra_attribute.Stage))
abline(v=0.3585,col = "red")
# Graficar los niveles de expresion en los ratones con y sin RTT
with(colData(rse_gene), plot(assigned_gene_prop, sra_attribute.genotype_variation))
abline(v=0.3585,col = "red")

```

```{r genotyp_check}
# Revisar el atributo de fenotipo
with(colData(rse_gene), tapply(assigned_gene_prop, sra_attribute.genotype_variation, summary))
```

```{r age_check}
# Revisar el atributo de fenotipo
with(colData(rse_gene), tapply(assigned_gene_prop, sra_attribute.Stage, summary))
```


```{r estd_gene}
# Obtener estadísticas de la expresión de genes
gene_means <- rowMeans(assay(rse_gene, "counts"))
summary(gene_means)
```
