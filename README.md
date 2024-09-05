# Proyecto5_ETL
Proyecto Profundización: Estructura de datos


## Objetivo


El objetivo de este análisis es diseñar e implementar un sistema ETL (Extract, Transform, Load) robusto para Super Store que permita la extracción, transformación y carga eficiente de datos desde diversas fuentes en un almacén de datos estructurado con tablas de hecho y dimensiones. Este sistema tiene como finalidad optimizar el almacenamiento de datos y mejorar la capacidad de la empresa para identificar patrones, tendencias y oportunidades de mercado, lo que le permitirá adaptarse rápidamente a cambios en la demanda, mejorar la eficiencia operativa, y mantener una ventaja competitiva en el mercado.


## Herramientas y Lenguajes


- Google BigQuery
- Google Colab
- Power BI o Python en Google Colab.
- Lenguaje SQL en BigQuery, y Python en Google Colab
- Drawio


## Revisión de Nulos
Puedes revisar la consulta [aquí](SQL/nulls.sql).


Tras realizar un análisis exhaustivo del dataset superstore, no se encontraron valores nulos en ninguna de las variables.


## Revisión de Duplicados


Durante el análisis de nuestro dataset, se identificó que varias variables se repiten en la tabla.
Puedes revisar la consulta [aquí](SQL/duplicates_customerID.SQL).


Sin embargo, para obtener un conteo preciso de duplicados, es crucial separar los datos por país. Esto se debe a que el customer_ID varía según el país, lo que significa que un mismo customer_ID puede representar clientes diferentes en países distintos.
Puedes revisar la consulta [aquí](SQL/duplicates_customerID.SQL).


## Normalización de Datos Categóricos
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


## Normalización de Datos Númericos
Puedes revisar la consulta [aquí](python/normalizacion_datos_categoricos.ipynb)


**No se encontraron valores no numéricos en las columnas numéricas.**


- **Resumen Estadístico:** Se generó un resumen estadístico que incluye medidas de tendencia central (media) y dispersión (desviación estándar, mínimo, máximo, etc.) para todas las variables numéricas. Esto proporciona una visión general de la distribución y características básicas de los datos.


- **Cálculo del Rango Intercuartil (IQR):** Se calcularon el primer cuartil (Q1), el tercer cuartil (Q3) y el rango intercuartil (IQR) para cada variable numérica. El IQR, que es la diferencia entre Q3 y Q1, se utiliza para detectar posibles valores atípicos en los datos.


- **Visualización de Datos:** Se crearon boxplots para cada columna numérica. Estos gráficos permiten visualizar la distribución de los datos, identificar tendencias y detectar valores atípicos o anomalías en cada variable.


## Web Scraping de la Tabla Multinational
Se realizó un web scraping para extraer la tabla **Multinational** de la página de Wikipedia [List of Supermarket Chains](https://en.wikipedia.org/wiki/List_of_supermarket_chains). En el proceso, se eliminó la columna **Map** de la tabla.

### Limpieza del Dataset supermarket_chains

- Eliminación de Texto entre Paréntesis: Se eliminó el contenido entre paréntesis en la columna Served_countries para simplificar la información.

- Corrección en Headquarters: Se actualizó la sede de la empresa SHV Holdings a 'The Netherlands'. Esta información se obbtuvo de wikipedia.

- Los valores vacíos en Number_of_locations y Number_of_employees se reemplazaron con 'NA'.
- Los valores nulos en Served_countries se reemplazaron con el valor correspondiente de Headquarters.
- Se añadió una columna Number_of_served_countries que cuenta la cantidad de países servidos, basándose en la columna Served_countries.


## Diseño de Tablas de Hechos y Tablas de Dimensiones


![diagrama](images/Diagrama.png)


Todas las relaciones mencionadas entre la Tabla de Hechos y las distintas dimensiones son relaciones de uno a muchos. Es decir, un registro en la tabla de dimensión (por ejemplo, un cliente o un producto) puede estar relacionado con múltiples registros en la Tabla de Hechos (múltiples pedidos).

## Crear estructura de la Base de Datos en BigQuery

- **Creación de IDs Únicos:**

Se generaron identificadores únicos (IDs) para facilitar la relación entre las tablas.

- **Cambio de Nombre de Columna:**

La columna Headquarters en la tabla supermarket_chains fue renombrada a countries_headquarters para reflejar con mayor precisión el contenido de la columna.

- **Creación de Tablas en BigQuery:**

    - Se construyó la tabla de hechos (f_hechos), que incluye métricas clave y se conecta con las tablas de dimensiones a través de identificadores únicos.

    - Se diseñaron las tablas de dimensiones para representar entidades clave, incluyendo Dim Customer, Dim Product, Dim Location, Dim Time, y Dim Company.
    - Se creó una tabla de enlace (superstore_supermarket_link) para manejar la relación muchos a muchos entre la tabla de hechos y las dimensiones de las compañías.






