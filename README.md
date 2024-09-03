# Proyecto5_ETL
Proyecto Profundización: Estructura de datos

## Objetivo

El objetivo de este análisis es diseñar e implementar un sistema ETL (Extract, Transform, Load) robusto para Super Store que permita la extracción, transformación y carga eficiente de datos desde diversas fuentes en un almacén de datos estructurado con tablas de hecho y dimensiones. Este sistema tiene como finalidad optimizar el almacenamiento de datos y mejorar la capacidad de la empresa para identificar patrones, tendencias y oportunidades de mercado, lo que le permitirá adaptarse rápidamente a cambios en la demanda, mejorar la eficiencia operativa, y mantener una ventaja competitiva en el mercado.

## Herramientas y Lenguajes

- Google BigQuery
- Google Colab
- Power BI o Python en Google Colab.
- Lenguaje SQL en BigQuery, y Python en Google Colab 

### Revisión de Nulos
Puedes revisar la consulta [aquí](SQL/nulls.sql).

Tras realizar un análisis exhaustivo del dataset superstore, no se encontraron valores nulos en ninguna de las variables. 

### Revisión de Duplicados

Durante el análisis de nuestro dataset, se identificó que varias variables se repiten en la tabla. 
Puedes revisar la consulta [aquí](SQL/duplicates_customerID.SQL).

Sin embargo, para obtener un conteo preciso de duplicados, es crucial separar los datos por país. Esto se debe a que el customer_ID varía según el país, lo que significa que un mismo customer_ID puede representar clientes diferentes en países distintos.
Puedes revisar la consulta [aquí](SQL/duplicates_customerID.SQL).

### Normalización de Datos Categóricos
Puedes revisar la consulta [aquí](python/normalizacion_datos_categoricos.ipynb)
1. **Estandarización de Textos:**

Se estandarizaron los textos en las columnas category, city, country, order_priority y region, asegurando que la primera letra de cada palabra apareciera en mayúscula.

2. **Corrección de Errores Tipográficos:**

Se corrigieron errores tipográficos en la columna country, reemplazando valores incorrectos por 'United States'.

3. **Normalización de Valores:**

Los valores de la columna order_priority se normalizaron a valores numéricos:
'Critical' se cambió a 4
'High' a 3
'Medium' a 2
'Low' a 1

4. **Codificación de Variables Categóricas:**

La columna category se codificó en valores numéricos:
'Furniture' se codificó como 1
'Office supplies' como 2
'Technology' como 3

5. **Conversión de Fechas:**

Las columnas order_date y ship_date se convirtieron al formato de fecha estándar para facilitar su análisis.