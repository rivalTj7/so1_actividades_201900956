# Tipos de Kernel
## Tipos de Kernel y sus diferencias

| **Tipo de Kernel** | **Descripción** | **Ventajas** | **Desventajas** |
|--------------------|------------------|--------------|-----------------|
| **Monolítico**     | Un solo programa grande que gestiona todos los servicios del sistema operativo en modo privilegiado. | - **Rendimiento Óptimo:** Comunicación directa entre componentes.<br>- **Eficiencia de Recursos:** Menos sobrecarga de comunicación. | - **Vulnerabilidad a Fallos:** Un error puede comprometer todo el sistema.<br>- **Complejidad de Mantenimiento:** Modificaciones y actualizaciones pueden ser complicadas. |
| **Microkernel**    | Divide las funciones del kernel en módulos pequeños, ejecutando solo las funciones básicas en modo kernel y el resto en modo usuario. | - **Alta Estabilidad:** Los errores en módulos no afectan al núcleo.<br>- **Flexibilidad:** Facilita la adición y modificación de servicios. | - **Sobrecarga de Comunicación:** Puede impactar el rendimiento.<br>- **Complejidad en la Implementación:** Manejo de la interacción entre módulos puede ser complejo. |
| **Híbrido**        | Combina características de los kernels monolíticos y microkernels, permitiendo flexibilidad en el diseño y optimización de recursos. | - **Optimización y Flexibilidad:** Mejora del rendimiento para servicios críticos y modularidad para otros.<br>- **Adaptabilidad:** Ajustable a requisitos específicos de rendimiento y estabilidad. | - **Complejidad del Sistema:** Mayor dificultad en el desarrollo y la depuración.<br>- **Compromiso en el Rendimiento:** Puede no alcanzar el nivel de eficiencia de un kernel monolítico puro. |



## User vs Kernel Mode


## Interruptions vs traps

