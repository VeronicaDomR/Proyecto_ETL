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
Puedes revisar la consulta [aquí](python/ETL.ipynb)
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
Puedes revisar la consulta [aquí](python/ETL.ipynb)


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


![diagrama](images/Diagrama.jpg)


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

## Diseño del Pipeline de Actualización de Datos

1. Extract → Transform → Load

- **Extraer** los datos necesarios para cada una de las tablas.
- Asegurar la **transformación** y limpieza de los datos antes de insertarlos en las tablas.
- **Cargar** los datos en las tablas.

2. Actualiza:
   - Dimensión Competidores
   - Dimensión Producto
   - Dimensión Ubicación
   - Dimensión Tiempo
   - Dimensión Envío
3. Luego:
   - Tabla de Hechos
4. Finalmente:
   - Tabla de Relación (superstore_supermarket_link)

Se actualizan primero las dimensiones que no dependen de otras tablas

**1. Dimensiones sin dependencias:**

- **Dimensión Competidores:** Esta tabla contiene datos de la empresa y puede actualizarse independientemente de otras tablas.
- **Dimensión Producto:** Contiene los datos de los productos y no tiene dependencias directas de otras tablas.
- **Dimensión Ubicación:** Tiene información relacionada con la ubicación de los clientes. No depende de otras tablas, por lo que puede actualizarse en paralelo con las dimensiones anteriores.

**2. Dimensiones dependendientes:**

Después de las dimensiones independientes, se deben actualizar aquellas dimensiones que dependen de otras tablas:
- **Dimensión Tiempo:** Aunque el tiempo no depende directamente de otras dimensiones, se debe actualizar antes de la tabla de hechos, ya que esta usa la fecha para sus registros.
- **Dimensión Envío:** Esta dimensión debe actualizarse antes de la tabla de hechos, ya que la tabla de hechos hace referencia al ship_mode y shipping_cost.

**3. Tablas de hechos:**

Esta tabla central debe actualizarse una vez que todas las dimensiones estén actualizadas, ya que hace referencia a claves foráneas de varias dimensiones (Cliente, Producto, Ubicación, Tiempo, y Envío).

**4. Tablas de Relación:**

superstore_supermarket_link: Finalmente, esta tabla de relación puede actualizarse después de que la Tabla de Hechos y la dimensión Competidores estén actualizadas, ya que vincula las órdenes con las empresas.

- **Diagrama del Pipeline en Google Cloud**

1. Datos Crudos (GCS) -> Dataflow (Transformación)
2. Dimensiones (BigQuery) -> Composer, actualización automatizada de las tablas de dimensiones. 
3. Tabla de Hechos (BigQuery) -> Composer,  actualización automatizada de las tablas de hechos. 
4. Relación (BigQuery) -> Composer, actualiza las tablas de relación en BigQuery
5. Cloud Scheduler (Actualización periódica) -> Trigger, programar las actualizaciones para las tablas.

## Análisis Exploratorio

Este análisis presenta una serie de gráficos y visualizaciones que exploran diferentes aspectos de los datos.

**1. Agrupación y Distribución de Datos según Variables Categóricas**

- Distribución de productos en categorías y segmentos.
![Graficos](images/Dist_prod_cat_segmentos.png)

- Total de Ventas y Beneficios por categoría y segmento.
![Graficos](images/total_vtas_beneficios_cat.png)

- Productos comprados por segmento y categoría.
![Graficos](images/prod_comprados_segmento_categoria.png)

- Número de productos únicos vendidos por segmento.
![Graficos](images/prod_unicos_x_Segmento.png)

- Análisis de rentabilidad por producto y categoría.
![Graficos](images/prod_unicos_x_Segmento.png)


**2. Visualización de Variables Categóricas**

- Comparación de ventas por categoría de productos a lo largo del tiempo.
![Graficos](images/comparacion_vtas_categoria.png)

- Evolución de ventas por categoría.
![Graficos](images/evolucion_vtas_cat.png)

- Relación entre ventas y ganancias por segmento.
![Graficos](images/relacion_vtas_Segmento.png)

**3. Medidas de Tendencia Central**
- Promedio del costo de envío por categoría.
![Graficos](images/Promedio_costo_envio.png)
- Aplicación de medidas de tendencia central (media, mediana, moda).

**4. Distribución de Datos**

- Distribución del número de pedidos.
![Graficos](images/dist_num_pedidos.png)

**5. Medidas de Dispersión**

- Cálculo de desviación estándar de las ventas.
- Varianza en las ventas por categoría.

**6. Análisis Temporal**

- Costos de envío a lo largo del tiempo.
![Graficos](images/costos_envios_tiempo.png)

- Segmentación de clientes a lo largo del tiempo.
![Graficos](images/segmentacion_clientes_tiempo.png)

- Comparación de modos de envío y su impacto en ventas.
![Graficos](images/comparacion_modos_envio.png)

## Recursos

## Dashboard 
![Dashboard](images/Dashboard.png)
Puedes acceder a mi dashboard en Tableu haciendo clic [aquí](https://public.tableau.com/app/profile/veronica.yadira.dom.nguez/viz/SuperstoreDashboard_17257697542560/Dashboard1?publish=yes).

## Resultados

- **Productos Comprados a lo Largo del Tiempo (2011-2014):**

![Graficos](images/analisis_prod_comprados_tiempo.png)

- **Año 2011:** 9,380 productos comprados.
- **Año 2012:** 11,659 productos comprados.
- **Año 2013:** 13,758 productos comprados.
- **Año 2014:** 16,493 productos comprados.
Se muestra un crecimiento sostenido en el número de productos comprados entre 2011 y 2014, con un incremento de aproximadamente 76% en el periodo.

- **Análisis de Rentabilidad por Categoría:**

![Graficos](images/analisis_rentabilidad.png)

- **Muebles (Furniture):** -5,839 (pérdida).
- **Suministros de Oficina (Office Supplies):** 1,457,681 de ganancia.
- **Tecnología (Technology):** 15,616 de ganancia.

La categoría más rentable es "Office Supplies", con una ganancia significativa en comparación con las otras categorías, mientras que "Furniture" genera pérdidas.

- **Ventas Totales a lo Largo del Tiempo (2011-2014):**

![Graficos](images/compras_anuales.png)

- **Año 2011: ** $2,355,770 en ventas.
- **Año 2012:** $2,922,942 en ventas.
- **Año 2013:** $3,367,042 en ventas.
- **Año 2014:** $3,997,151 en ventas.

Se muestra un incremento constante en las ventas, alcanzando un aumento del 69% de 2011 a 2014.

## Conclusiones
- **Segmento Consumer** es el más importante en términos de ventas y número de clientes.
- Las **ganancias y ventas** están en aumento, pero hay que monitorear los costos de envío, ya que aunque parecen estables, cualquier cambio podría impactar negativamente.
- **Productos y clientes** clave son áreas donde la empresa puede enfocar sus esfuerzos para mantener y aumentar su rentabilidad.


