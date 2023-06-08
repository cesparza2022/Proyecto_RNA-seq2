## Importe del set de datos 

```{r descarga_data, message=FALSE, warning=FALSE}
# Cambiar de url
options(recount3_url = "https://recount-opendata.s3.amazonaws.com/recount3/release")

# Descargar el proyecto SRP188207
proj_info <- subset(available_projects(organism = 'mouse'),
    project == "SRP188207" & project_type == "data_sources"
)

# Crear el objeto RSE
rse_gene = create_rse(proj_info)

# Explorar el objeto RSE
rse_gene

# Guardar una copia original 
rse_gene_org <- rse_gene
```

```{r revisar_datos,message=FALSE, warning=FALSE}

# Obtener los numeros de lecturas
assay(rse_gene, "counts") <- compute_read_counts(rse_gene)

# Facilitar el uso de la informacion del experimento
rse_gene <- expand_sra_attributes(rse_gene)

# Explorar los parametros del experimento y algunas de sus variables
colData(rse_gene)[,
    grepl("^sra_attribute", colnames(colData(rse_gene)))]

```
