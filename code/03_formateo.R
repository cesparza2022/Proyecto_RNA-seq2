## Formateo


```{r arreglar_atributos}
## Arreglar los atributos para que no generen problemas  
# Remplazar los espacios en blanco para que no hayan errores
rse_gene$sra.sample_attributes <- gsub("week 5", "week_5", rse_gene$sra.sample_attributes)
rse_gene$sra.sample_attributes <- gsub("week 24", "week_24", rse_gene$sra.sample_attributes)


```


```{r mod_data}
# Pasar los atributos a factores para poder manipularlos
rse_gene$sra_attribute.genotype_variation  <- factor(rse_gene$"sra_attribute.genotype/variation")
rse_gene$sra_attribute.Stage <- factor(rse_gene$sra_attribute.Stage)
names(rse_gene) <- gsub("/", "_", names(rse_gene))


# Generar resumen de las variables de interes
summary(as.data.frame(colData(rse_gene)[,
    grepl("^sra_attribute.[cellular_fraction|gender|genotype|source_name|strain|age]", colnames(colData(rse_gene)))]))
```

```{r}
rse_gene$sra_attribute.genotype_variation

```
