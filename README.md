# Proyecto5_ETL
Proyecto Profundización: Estructura de datos

## Objetivo

## Herramientas y Lenguajes

### Revisión de Nulos
Puedes revisar la consulta [aquí](SQL/nulls.sql).

Tras realizar un análisis exhaustivo del dataset superstore, no se encontraron valores nulos en ninguna de las variables. 

### Revisión de Duplicados

Durante el análisis de nuestro dataset, se identificó que varias variables se repiten en la tabla. 
Puedes revisar la consulta [aquí](SQL/duplicates_customerID.SQL).

Sin embargo, para obtener un conteo preciso de duplicados, es crucial separar los datos por país. Esto se debe a que el customer_ID varía según el país, lo que significa que un mismo customer_ID puede representar clientes diferentes en países distintos.
Puedes revisar la consulta [aquí](SQL/duplicates_customerID.SQL).