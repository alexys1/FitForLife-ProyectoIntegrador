FitForLife - Proyecto Integrador

Descripción

FitForLife es una aplicación web desarrollada en Java (Servlets, JSP, JDBC con MySQL) que ayuda a los usuarios a llevar un control personalizado de su alimentación, registrar su peso y visualizar su progreso físico. El sistema asigna planes dietéticos sugeridos automáticamente basándose en el cálculo del Índice de Masa Corporal (IMC) del usuario y ofrece recomendaciones de alimentos según su condición.

Equipo de desarrollo

(¡Edita esta sección con los nombres y roles/módulos reales!)

Alex Yaranga Salazar (Líder / Módulo de Autenticación y Perfil)

Fred Bryan Vergara Soto  (Desarrollador / Módulo de Progreso y Reporte Excel con Apache POI)

Daniel Manuel Córdova Barrientos  (Desarrollador / Módulo de Alimentos y Consumo Diario)

Leonardo Díaz Garay (Desarrollador / Módulo de Registro y Validación con Google Guava)

Sato Malqui Manuel Andrés (Tester / Pruebas Unitarias con JUnit y Mockito)

Nery Ahmed Rivera De La Cruz (Desarrollador / Módulo de Progreso)

Flujo GitHub aplicado

Se aplicó el flujo de trabajo estándar de GitHub para la gestión del código y la colaboración, siguiendo las indicaciones de la Tarea S11:

Repositorio Central: Se creó un repositorio (FitForLife-ProyectoIntegrador) en GitHub para alojar el código fuente.

Colaboradores: Se añadieron todos los miembros del equipo como colaboradores al repositorio.

Ramas (Branches): Se utilizó una rama principal (main) para el código estable y funcional. Para cada nueva funcionalidad, mejora o corrección (ej. feature/mejorar-estilos-excel), se creó una rama separada para trabajar de forma aislada sin afectar la rama principal.

Commits: Se realizaron commits frecuentes en las ramas de funcionalidad, utilizando mensajes descriptivos siguiendo convenciones (ej. feat: ..., fix: ..., docs: ..., style: ...) para indicar claramente el propósito de cada cambio guardado.

Pull Requests (PRs): Una vez completado el trabajo en una rama de funcionalidad, se creó un Pull Request (PR) dirigido a la rama main. Este PR sirvió como punto formal para proponer la integración de los cambios y permitió una revisión (simulada en este ejercicio) del código por parte de otros miembros del equipo.

Merge: Tras la revisión y aprobación (simulada), el PR fue fusionado (merged) a la rama main, integrando así la nueva funcionalidad o corrección al código base principal del proyecto. La rama de funcionalidad fue eliminada posteriormente del repositorio remoto para mantenerlo limpio.

Actualización Local: Se mantuvo el repositorio local de cada desarrollador sincronizado con el repositorio remoto mediante el uso regular de git checkout main y git pull origin main.


Nota: Las capturas de pantalla detalladas del proceso se encuentran en el documento Word de la entrega.

Conclusiones

El uso de Git y GitHub en el desarrollo del proyecto FitForLife ha demostrado ser fundamental y ha aportado las siguientes ventajas clave:

Control de Versiones y Trazabilidad: Cada cambio realizado queda registrado, permitiendo saber quién hizo qué, cuándo y por qué. Esto es invaluable para depurar errores y entender la evolución del proyecto. Facilita enormemente la posibilidad de revertir a versiones anteriores si una nueva implementación introduce problemas.

Colaboración Estructurada: El flujo de trabajo con ramas separadas (branching) permite que los miembros del equipo trabajen en diferentes funcionalidades simultáneamente sin interferir entre sí. Los Pull Requests actúan como un punto de control de calidad y comunicación antes de integrar el código.

Respaldo y Centralización: GitHub proporciona un repositorio centralizado en la nube, actuando como una copia de seguridad segura y accesible para todo el equipo desde cualquier lugar. Reduce drásticamente el riesgo de pérdida de código.

Documentación Integrada: El propio historial de commits, los mensajes descriptivos, los Pull Requests y el archivo README.md sirven como una forma de documentación viva y contextualizada del proyecto y su desarrollo.
