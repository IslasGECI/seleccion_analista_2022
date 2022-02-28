<img src="https://www.islas.org.mx/img/logo.svg" width="256" />

# Examen de selección 2022 para Analista de Datos en GECI

- [Ver convocatoria](https://www.facebook.com/IslasGECI/posts/3250808525199345)

## Predicción de la edad de pollos de petrel negro a partir de su morfometría

Debes estimar la edad (en días) de un conjunto de pollos de petrel negro a partir de su morfometría.
Someterás tu respuesta como una tabla de dos columnas: la primera columna es el identificador del
pollo y la segunda columna es la edad estimada. Esperamos ver avances graduales en ciclos cortos.
Nos gustaría que el examen lo resuelvas con muchos _pull requests_ y que cada _pull request_ tenga
un avance muy pequeño (menos de 100 líneas). Por lo que te proponemos:

1. Crea un
   [_fork_](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo#fork-an-example-repository)
   de este repositorio
1. Cubre tu código con pruebas
1. Haz pasar GitHub Actions
1. Haz múltiples _pull requests_ pequeños (menos de 100 líneas cada uno)
1. Usa GitHub (_issues_ y _pull requests_) como el medio de comunicación principal

Por favor no esperes a terminar el examen para someter tu primer _pull request_. Recuerda que no
podrás crear ningún _pull request_ hasta que tengas tu
[_fork_](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo#fork-an-example-repository).

## Rúbrica

El objetivo de este examen de selección es evaluar las habilidades para el trabajo colaborativo a
distancia. Para eso usaremos los siguientes rubros:

- **Capacidad para el trabajo colaborativo a distancia**:
  - [ ] Uso de Git: Los mensajes son informativos del porqué, las consignaciones son pequeñas y los
    nombres de las ramas dan información del objetivo de los cambios
  - [ ] Habilidades de comunicación mediante GitHub (_issues_ y _pull requests_): La comunicación es
    amable, la descripción es clara y da formato utilizando _Markdown_
  - [ ] Solicitud de revisiones: Utilización de [las
    características](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/requesting-a-pull-request-review)
    de GitHub para indicar que terminó una corrección y que está solicitando una nueva revisión
  - [ ] Asimilación de retroalimentación: Las correcciones solicitadas en un _pull request_ ya no se
    repiten en los siguientes _pull requests_

- **Buenas prácticas en programación**:
  - [ ] Código limpio
  - [ ] Pruebas unitarias
  - [ ] Refactorización

## Sugerencias

- Estudia estas referencias:
    - [Guía de estilo de Ciencia de Datos en GECI](https://islas.dev/guia_de_estilo/)
    - [How to Make Your Code Reviewer Fall in Love with You](https://mtlynch.io/code-review-love/)
    - [The pull request author’s guide to getting through code review](https://google.github.io/eng-practices/review/developer/)
- Crea _pull requests_ pequeños; un _pull request_ de 100 líneas es demasiado grande.
- Se amable, explica el porqué de las cosas, respeta nuestro [código de
  conducta](https://www.contributor-covenant.org/es/version/2/0/code_of_conduct/), usa lenguaje simple y claro.
- Comunícate mucho y hazlo mediante GitHub.


## Instrucciones

1. Ajusta un modelo con el archivo `train.csv`
1. Evalúa el modelo ajustado en `test.csv`
1. Guarda la respuesta de tu modelo en `<TU_NOMBRE>_submission.csv`

> Reemplaza `<TU_NOMBRE>` con tu nombre.

## Configuración

Guarda tu respuesta `<TU_NOMBRE>_submission.csv` en la carpeta `pollos_petrel/`. En el Makefile de
este repo, agrega al _phony_ **submissions** la ruta completa de tu respuesta:
`pollos_petrel/<TU_NOMBRE>_submission.csv`

El _phony_ **submissions** debería verse así:

```
submissions: \
    pollos_petrel/example_python_submission.csv \
    pollos_petrel/example_r_submission.csv \
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
  (`pollos_petrel/<TU_NOMBRE>_submission.csv`) a partir de los datos `test.csv`. Todo el código debe
  correr dentro del contenedor. No se vale consignar la respuesta o números mágicos. Sólo puedes
  consignar código.
- Este es un examen individual. Sólo le puedes pedir ayuda a las y los miembros de Ciencia de Datos
  en GECI. Si no puedes resolver el examen entonces no puedes cumplir con las responsabilidades del
  puesto ofertado. No copies.

## Descripción de las tablas
En el directorio `pollos_petrel/` puedes encontrar tres archivos CSV.

- Usa el archivo `train.csv` para ajustar tu modelo (entrenar tu algoritmo).
- Usa el archivo `test.csv` para evaluar tu modelo ajustado.
- Usa el archivo `example_submission.csv` como ejemplo de respuesta.

## Descripción de los campos de las tablas
- En todas las tablas, la primera columna se llama **id** y contiene un identificador único para
  cada registro.
- En las tablas `train.csv` y `example_submission.csv`, la última columna se llama **target** y
  contiene la edad (en días) de los pollos. Esta columna representa la _respuesta_.
- En las tablas `test.csv` y `train.csv`, el resto de las columnas ( **Masa**, **Longitud_tarso**,
  ..., **Longitud_pluma_exterior_de_la_cola**) son las variables _predictivas_.

## Resultados

Te recomendamos que sometas al menos dos modelos. El mejor modelo es el que obtenga el menor error
absoluto medio ([MAE](https://en.wikipedia.org/wiki/Mean_absolute_error)). Puedes ver los resultados
de tu modelo en GitHub Actions en la sección _Evaluate a directory_.

## Referencias

- [Guía de estilo de Ciencia de Datos en GECI](https://islas.dev/guia_de_estilo/)
- [How to Make Your Code Reviewer Fall in Love with You](https://mtlynch.io/code-review-love/)
- [Revisiones en GitHub](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/requesting-a-pull-request-review)
- [The pull request author’s guide to getting through code review](https://google.github.io/eng-practices/review/developer/)
- [_Forkeado_ de un repositorio](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo)

---

