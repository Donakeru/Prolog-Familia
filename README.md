# Base de Conocimientos de Familias en Prolog

Este proyecto implementa una base de conocimientos en Prolog para modelar y consultar relaciones familiares. Permite responder preguntas relacionadas con parentescos como padre, abuelo, tío, primo, y más.

## Contenido

1. [Predicados Definidos](#predicados-definidos)
2. [Uso](#uso)
3. [Ejemplos de Consultas](#ejemplos-de-consultas)
4. [Requisitos](#requisitos)

## Predicados Definidos

### Relaciones Básicas
- **`padre(X, Y)`**: X es padre de Y.
- **`madre(X, Y)`**: X es madre de Y.

### Relaciones Derivadas
- **`hijo(X, Y)`**: X es hijo de Y. Derivado de `padre/2` y `madre/2`.
- **`abuelo(X, Y)`**: X es abuelo de Y. Derivado de `padre/2` y `madre/2`.
- **`nieto(X, Y)`**: X es nieto de Y. Derivado de `abuelo/2`.
- **`hermano(X, Y)`**: X y Y son hermanos si comparten al menos un progenitor.
- **`tio(X, Y)`**: X es tío de Y si es hermano de uno de los padres de Y.
- **`sobrino(X, Y)`**: X es sobrino de Y si Y es tío de X.
- **`primo(X, Y)`**: X y Y son primos si sus padres son hermanos.
- **`familiar(X, Y)`**: Relación general, une todas las anteriores.
- **`familiares(X, Lista)`**: Genera una lista de todos los familiares de X.

### Relaciones Conyugales
- **`casado(X, Y)`**: X y Y están casados si tienen hijos en común.
- **`suegro(X, Y)`**: X es suegro de Y si X es el padre de la pareja de Y.

## Uso

1. Carga la base de conocimientos en Prolog:
   ```prolog
   ?- [familias].
   ```

2. Realiza consultas usando los predicados definidos para obtener información sobre las relaciones familiares.

## Ejemplos de Consultas

1. **¿Quién es el abuelo de `ana`?**
   ```prolog
   ?- abuelo(X, ana).
   ```
   Resultado:
   ```
   X = juan.
   ```

2. **¿Quién es el sobrino de `pedro`?**
   ```prolog
   ?- sobrino(X, pedro).
   ```
   Resultado:
   ```
   X = ana ;
   X = luis.
   ```

3. **¿`juan` y `marta` están casados?**
   ```prolog
   ?- casado(juan, marta).
   ```
   Resultado:
   ```
   true.
   ```

4. **Generar una lista de todos los familiares de `pedro`:**
   ```prolog
   ?- familiares(pedro, Lista).
   ```
   Resultado:
   ```
   Lista = [juan, marta, maria, ana, luis].
   ```

## Requisitos

1. **Instalar SWI-Prolog**:
   - Descárgalo desde [https://www.swi-prolog.org/](https://www.swi-prolog.org/) e instálalo.

2. **Ejecutar Prolog**:
   - Abre el intérprete de Prolog desde la terminal o consola de comandos.

3. **Cargar la Base de Conocimientos**:
   - Guarda el archivo en el directorio deseado y cárgalo en Prolog.

---
