# KATA: Predicción de la edad de pollos de petrel negro a partir de su morfometría

Debes estimar la edad (en días) de un conjunto de pollos de petrel negro a partir de su morfometría.
Someterás tu respuesta como una tabla de dos columnas: la primera columna es el identificador del
pollo y la segunda columna es la edad estimada.

## Instrucciones

1. Ajusta un modelo con el archivo `train.csv`
1. Evalúa el modelo ajustado en `test.csv`
1. Guarda la respuesta de tu modelo en `<TU_NOMBRE>_submission.csv`

> Reemplaza `<TU_NOMBRE>` con tu nombre.

## Configuración

Guarda tu respuesta `<TU_NOMBRE>_submission.csv` en la carpeta `pollos_petrel/`. En el Makefile de
este repo, agrega al _phony_ **submissions** la ruta completa de tu respuesta:
`pollos_petrel/<TU_NOMBRE>_submission.csv`

El _phony_ submissions debería verse así:

```
submissions: \
    pollos_petrel/evaro_01_submission.csv \
    pollos_petrel/evaro_02_submission.csv \
    pollos_petrel/<OTRO_NOMBRE>_submission.csv \
    pollos_petrel/<TU_NOMBRE>_submission.csv
```

> Nota las diagonales invertidas `\` al final de cada línea, excepto en la última

Agrega al Makefile como objetivo tu respuesta `pollos_petrel/<TU_NOMBRE>_submission.csv`. Esta tabla
debe tener dos columnas: **id** y **target**. Ve el ejemplo: `pollos_petrel/example_submission.csv`.

Ejemplo:

 id           | target
--------------|--------
2013-09-16-H9 | 0.83
2015-09-02-B5 | 0.94
2017-09-09-A9 | 0.50

## Reglas

- El comando `make pollos_petrel/<TU_NOMBRE>_submission.csv` debe reproducir tu respuesta
  (`pollos_petrel/<TU_NOMBRE>_submission.csv`) a paritr de los datos `test.csv`. Todo el código debe
  correr dentro del contenedor. No se vale consignar la respuesta o números mágicos. Sólo puedes
  consignar código.
- Todas las y los participantes consignaran su código en este repositorio. Debes consignar y pushar
  por lo menos una vez por hora. El resto de los equipos podrán inspirarse en tu código y tú te
  podrás inspirar en el código del resto de los equipos.
- No puedes consultar la base de datos original (la cual se encuentra en otro repositorio _behind
  the wall_). No se vale sobreajustar con los datos _behind the wall_.

## Descripción de las tablas
En el directorio `pollos_petrel/` puedes encontrar tres archivos CSV.

- Usa el archivo `train.csv` para ajustar tu modelo (entrenar tu algoritmo).
- Usa el archivo `test.csv` para evaluar tu modelo ajustado.
- Usa el archivo `example_submission.csv` como ejemplo de respuesta.

## Descripción de los campos de las tablas
- En todas las tablas, la primera columna se llama **id** y contiene un identificador único para
  cada registro.
- En todas las tablas excepto `test.csv`, la última columna se llama **target** y contiene la edad
  (en días) de los pollos. Esta columna representa la _respuesta_.
- En las tablas `test.csv` y `train.csv`, el resto de las columnas ( **Masa**, **Longitud_tarso**,
  ..., **Longitud_pluma_exterior_de_la_cola**) son las variables _predictivas_.

## Resultados
El equipo ganador será el que obtenga el menor error absoluto medio
([MAE](https://en.wikipedia.org/wiki/Mean_absolute_error)). Puedes ver los resultados del concurso
en [GitHub Actions](https://github.com/IslasGECI/kata_ctf_pollos_petrel_2022/actions) en la sección:
_Evaluate a directory_.
