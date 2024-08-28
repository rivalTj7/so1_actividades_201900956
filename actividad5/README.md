# Tipos de Kernel
## Tipos de Kernel y sus diferencias

| **Tipo de Kernel** | **Descripción** | **Ventajas** | **Desventajas** |
|--------------------|------------------|--------------|-----------------|
| **Monolítico**     | Un solo programa grande que gestiona todos los servicios del sistema operativo en modo privilegiado. | - **Rendimiento Óptimo:** Comunicación directa entre componentes.<br>- **Eficiencia de Recursos:** Menos sobrecarga de comunicación. | - **Vulnerabilidad a Fallos:** Un error puede comprometer todo el sistema.<br>- **Complejidad de Mantenimiento:** Modificaciones y actualizaciones pueden ser complicadas. |
| **Microkernel**    | Divide las funciones del kernel en módulos pequeños, ejecutando solo las funciones básicas en modo kernel y el resto en modo usuario. | - **Alta Estabilidad:** Los errores en módulos no afectan al núcleo.<br>- **Flexibilidad:** Facilita la adición y modificación de servicios. | - **Sobrecarga de Comunicación:** Puede impactar el rendimiento.<br>- **Complejidad en la Implementación:** Manejo de la interacción entre módulos puede ser complejo. |
| **Híbrido**        | Combina características de los kernels monolíticos y microkernels, permitiendo flexibilidad en el diseño y optimización de recursos. | - **Optimización y Flexibilidad:** Mejora del rendimiento para servicios críticos y modularidad para otros.<br>- **Adaptabilidad:** Ajustable a requisitos específicos de rendimiento y estabilidad. | - **Complejidad del Sistema:** Mayor dificultad en el desarrollo y la depuración.<br>- **Compromiso en el Rendimiento:** Puede no alcanzar el nivel de eficiencia de un kernel monolítico puro. |



## User vs Kernel Mode 
- **User Mode**: 
  - Modo en el que se ejecutan las aplicaciones de usuario.
  - Acceso restringido a los recursos del sistema para proteger la estabilidad del sistema operativo.
  - Las aplicaciones deben realizar llamadas al sistema para acceder a recursos o servicios del núcleo.

- **Kernel Mode**:
  - Modo con privilegios completos que permite el acceso sin restricciones a hardware, memoria y otros recursos críticos.
  - Ejecuta el núcleo del sistema operativo y gestiona operaciones esenciales como la gestión de procesos, memoria y dispositivos.
  - Errores en este modo pueden afectar a todo el sistema.

#### Switching: Transición entre User Mode y Kernel Mode

El cambio entre **User Mode** y **Kernel Mode**, conocido como **mode switching** o **context switching**, se realiza mediante llamadas al sistema (system calls).

**Proceso de Switching:**

1. **Solicitud de Llamada al Sistema**:
   - Una aplicación en User Mode invoca una función de biblioteca (por ejemplo, `glibc`) para hacer una llamada al sistema.

2. **Interrupción de Software**:
   - La biblioteca configura los argumentos según la Interfaz Binaria de Aplicación (ABI) y ejecuta una instrucción de interrupción de software (por ejemplo, `SWI` en ARM), cambiando el procesador a Kernel Mode.

3. **Acceso a Kernel Mode**:
   - El núcleo del sistema operativo se ejecuta en Kernel Mode, permitiendo el acceso a la memoria virtual del kernel y ejecutando el código de la llamada al sistema.

4. **Manejo de Interrupciones**:
   - Desde la dirección de vector, la ejecución salta al manejador de interrupciones (por ejemplo, `vector_swi()`), que procesa el número de la llamada al sistema (SCNO) y llama a la función correspondiente en la tabla de llamadas al sistema (`sys_call_table`).

5. **Retorno a User Mode**:
   - Después de la ejecución de la llamada al sistema, el contexto del espacio de usuario se restaura y el procesador regresa a User Mode.

#### Consideraciones sobre el Switching

- **Coste de Switching**:
  - Implica guardar y restaurar el contexto del procesador, lo que puede ser costoso en términos de tiempo y recursos.

- **Optimización**:
  - Los sistemas operativos modernos utilizan técnicas para reducir el impacto del switching, como el almacenamiento en caché de datos de Kernel Mode en User Mode y el soporte de hardware para la virtualización y el switching de contexto.

## Interruptions vs traps
### Interrupciones

Una **interrupción** es una señal crítica generada por hardware o software que requiere la atención inmediata del sistema operativo (SO). Su propósito es notificar al procesador que un proceso prioritario necesita ser atendido, interrumpiendo el flujo de ejecución del proceso actual.

#### Funcionamiento de Interrupciones

- **Manejo de Interrupciones**: En los sistemas modernos, las interrupciones permiten a los dispositivos de hardware y al software notificar eventos importantes al procesador. Cuando un dispositivo I/O (como un teclado o una tarjeta de red) genera una interrupción, el SO interrumpe el proceso en ejecución y ejecuta una rutina específica para manejar esa interrupción.
  
- **Pin de Interrupción (INT Pin)**: Cada CPU tiene un pin de interrupción dedicado (INT) que se conecta a dispositivos hardware. Por ejemplo, al presionar una tecla, se genera una interrupción que es capturada por el SO. La rutina de manejo de interrupciones correspondiente se ejecuta para procesar el evento, y luego el sistema retoma el proceso previamente interrumpido.

- **Controlador de Interrupciones**: Los dispositivos pueden compartir un pin de interrupción mediante un controlador de interrupciones. Este controlador ayuda a identificar cuál dispositivo ha generado la interrupción y dirige la ejecución al manejador de interrupciones adecuado (por ejemplo, para teclado o USB). 

- **Tipos de Interrupciones**:
  - **Hardware**: Se originan a partir de eventos físicos o de I/O, como una solicitud de entrada de un teclado.
  - **Software**: Se generan a partir de acciones del software, como una llamada al sistema que requiere servicios del núcleo del sistema operativo.

### Diferencias entre Trap e Interrupt

| **Aspecto**                  | **Trap**                                             | **Interrupt**                                      |
|------------------------------|------------------------------------------------------|----------------------------------------------------|
| **Fuente**                   | Generada por un programa de usuario                 | Generada por hardware o software                  |
| **Naturaleza**               | Proceso síncrono: ocurre en el contexto del proceso que lo solicita | Proceso asíncrono: ocurre de manera independiente al flujo de ejecución del proceso |
| **Origen**                   | Solo se origina desde una instrucción de software   | Puede originarse tanto desde hardware como desde software |
| **Generación**              | Activada por instrucciones específicas del programa de usuario | Puede ser activada por señales de hardware o por llamadas al sistema |
| **Relación**                | Subconjunto de las interrupciones                     | Superconjunto que incluye traps y otras interrupciones |
| **Función**                 | Ejecuta una funcionalidad específica en el SO y transfiere control al manejador de traps | Fuerza al procesador a ejecutar una rutina de manejador de interrupciones específica |
