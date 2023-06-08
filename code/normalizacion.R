```{r }
# Construir un objeto con el cual se podran normalizar los datos
dge <- DGEList(
    counts = assay(rse_gene, "counts"),
    genes = rowData(rse_gene))
dge <- calcNormFactors(dge)
```

```{r}
# Grafica la expresion diferencial entre el control y los Mecp2_KO
ggplot(as.data.frame(colData(rse_gene)), aes(y = assigned_gene_prop, x = sra_attribute.genotype_variation)) +
    geom_boxplot() +
    theme_bw(base_size = 20) +
    ylab("Assigned Gene Prop") +
    xlab("genotype")

```

```{r}
# Graficar la expresion diferencial entre las edades
ggplot(as.data.frame(colData(rse_gene)), aes(y = assigned_gene_prop, x = sra_attribute.Stage)) +
    geom_boxplot() +
    theme_bw(base_size = 20) +
    ylab("Assigned Gene Prop") +
    xlab("Edades")
```
