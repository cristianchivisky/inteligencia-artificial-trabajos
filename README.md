# Proyectos de Inteligencia Artificial 🤖

Este repositorio contiene implementaciones de diversos algoritmos y problemas clásicos de Inteligencia Artificial, desarrollados durante el curso de 4to año de la Licenciatura en Sistemas de Información.

## 📚 Contenido

El repositorio está organizado por diferentes técnicas y problemas de IA:

### 1. Búsqueda de Caminos 🗺️
- **Algoritmo del Camino Más Corto** (Prolog)
  - Encuentra la ruta óptima entre varios puntos
  - Archivo: `camino_corto.pl`
  ```prolog
  % Ejemplo de uso:
  % ?- ruta_mas_corta(Ruta, DistanciaMinima).
  ```

### 2. Planificación de Movimientos 🤖
- **Desplazamiento de Robot** (Prolog)
  - Sistema de planificación de movimientos para un robot
  - Evita obstáculos y encuentra una ruta válida
  - Archivo: `robotica_desplazamiento.pl`
  ```prolog
  % Ejemplo de uso:
  % ?- encontrar_camino(Camino).
  ```

### 3. Problemas de Satisfacción de Restricciones 👑
- **N-Reinas** (Python y Prolog)
  - Solución al clásico problema de las N-Reinas
  - Implementado con backtracking
  - Archivos: 
    - `n_reinas.py`
    - `n_reinas.pl`
  ```python
  # Ejemplo de uso en Python:
  print(k_reinas(8))  # Para un tablero 8x8
  ```
  ```prolog
  % Ejemplo de uso en Prolog:
  % ?- nreinas(8, Sol).
  ```

## 🛠️ Requisitos

- SWI-Prolog 
- Python 
- Bibliotecas de Python requeridas:
  ```bash
  pip install heapq
  ```

## 🚀 Cómo ejecutar los programas

### Programas en Prolog

1. Inicia SWI-Prolog:
   ```bash
   swipl
   ```

2. Carga el archivo deseado:
   ```prolog
   ?- consult('nombre_archivo.pl').
   ```

3. Ejecuta las consultas según el programa:
   ```prolog
   ?- consulta(Parametros).
   ```

### Programas en Python

1. Ejecuta desde la línea de comandos:
   ```bash
   python nombre_archivo.py
   ```

## 🤝 Contribuciones

Este repositorio contiene trabajos académicos realizados durante el curso de Inteligencia Artificial. Si encuentras algún error o tienes sugerencias de mejora, no dudes en abrir un issue o enviar un pull request.

## 📫 Contacto

- Email: cristian.chivisky@gmail.com
