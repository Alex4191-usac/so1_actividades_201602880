### Introducción: 
#### ¿Qué es un Kernel?

Antes de explorar los diferentes tipos de kernels, es esencial comprender qué es exactamente un kernel; En términos simples, un kernel es la parte central y esencial de un sistema operativo que actúa como un puente vital entre el hardware de una computadora y el software que se ejecuta en ella. Su función principal es gestionar los recursos del sistema, como la memoria, los procesadores y los dispositivos de entrada/salida, para que las aplicaciones y servicios del usuario puedan funcionar de manera eficiente.

### Tipos de Kernel y sus diferencias
Conforme a sus características, pueden dividirse en tres grupos
* **Kernel Monolítico**:  podemos decir que *"es un Kernel grande para todas las tareas."*, pero a que nos referimos con eso?. Esto quiere decir que sera el único responsable de la gestión de la memoria y de los procesos, de la comunicación entre estos procesos  y ademas proporciona funciones de soporte de drivers y hardware.

* **Microkernel:**  El microkernel se ha diseñado intencionadamente de un tamaño pequeño para que en caso de fallo no paralice todo el sistema operativo, con el se dividen las funciones de kernel en modulos pequenos, esto le permite que solo las funciones esenciales y críticas se ejecutan en el espacio del núcleo, mientras que las funciones no esenciales y los controladores se ejecutan en el espacio de usuario
 
* **Híbrido:** Combina características de kernels monolíticos y microkernels. Algunas funciones esenciales se ejecutan en el espacio del núcleo, mientras que otras, menos críticas, se ejecutan en el espacio de usuario, lo que hace que permita cierta flexibilidad en la implementacion y optimitazacion de recursos.


#### Cuadro Comparativo entre kernels

A continuación, se presenta un cuadro comparativo que resalta las diferencias entre los tipos de kernels más comunes en los sistemas operativos. Cada tipo tiene sus propias características distintivas que afectan el rendimiento, la modularidad y la estabilidad del sistema.

| Característica          | Kernel Monolítico           | Kernel Microkernel         | Kernel Híbrido                   |
|-------------------------|-----------------------------|---------------------------|----------------------------------|
| **Descripción**         | Todas las funciones se ejecutan en el mismo espacio de memoria y privilegios. | Funciones esenciales en el espacio del núcleo, funciones no esenciales en el espacio de usuario. | Combinación de características de los monolíticos y microkernels.                              |
| **Ventajas**            | Eficiencia en velocidad de ejecución y menos sobrecarga debido a la comunicación directa. | Mayor modularidad y estabilidad debido a la separación de funciones críticas y no críticas. | Equilibrio entre eficiencia y modularidad, mayor flexibilidad.                                |
| **Desventajas**         | Menor modularidad, mayor riesgo de fallos en todo el sistema. | Menor eficiencia debido a la necesidad de comunicación entre espacio de usuario y espacio del núcleo. | Puede heredar desventajas de ambos tipos de kernels.                                        |


### User vs Kernel Mode
la gestión eficiente de recursos y la seguridad son imperativos cruciales. Para lograr esto, se implementan un modelo de privilegios conocido como "User Mode" (Modo Usuario) y "Kernel Mode" (Modo Núcleo). Estos modos determinan el nivel de acceso y control que los programas y usuarios tienen sobre los recursos del sistema. 


* **User Mode ***(Modo Usuario)***:**
 En este modo, los programas ejecutado por un usuario final en un sistema operativo se ejecutan con privilegios limitados. Están restringidos en su capacidad para acceder directamente a áreas críticas del sistema y realizar operaciones de bajo nivel. Este modo es el entorno en el que operan la mayoría de las aplicaciones y programas cotidianos. Su principal característica es la limitación de privilegios para garantizar la seguridad y la estabilidad del sistema operativo.

* **Kernel Mode ***(Modo Núcleo)***:**
En este modo, el núcleo del sistema operativo tiene acceso completo y sin restricciones a todos los recursos del sistema. Puede realizar operaciones de bajo nivel, gestionar la memoria, controlar dispositivos de hardware y ejecutar tareas críticas para el funcionamiento del sistema

### Interruptions vs traps

Las interrupciones y las trampas son mecanismos utilizados por el kernel para gestionar eventos y controlar el flujo de ejecución.

***Las interrupciones*** son eventos externos que requieren la atención inmediata del kernel. Pueden ser generadas por hardware (como interrupciones de temporizador) o por software. El kernel responde a estas interrupciones para realizar acciones específicas, como cambiar de tarea o gestionar una operación de entrada/salida.

A diferencia de las interrupciones, ***las trampas*** son eventos generados intencionalmente por el software, como una instrucción de sistema o una excepción. Las trampas permiten que un programa solicite servicios del kernel mientras se encuentra en modo usuario, facilitando la transición entre los modos de operación.

#### Diferencias Clave entre Interrupciones y Traps

A. Origen

- Interrupciones: Pueden originarse tanto en hardware como en software. Son eventos externos que requieren atención inmediata.

- Traps: Son generadas intencionalmente por el software en ejecución. Indican eventos específicos o solicitudes de servicios al sistema operativo.

B. Propósito

- Interrupciones: Suelen utilizarse para eventos externos que necesitan ser atendidos, como la llegada de datos desde un dispositivo de entrada/salida.

- Traps: Se utilizan para cambiar intencionalmente el flujo de ejecución, realizar llamadas al sistema o manejar excepciones específicas.

C. Control de Flujo

- Interrupciones: Pueden cambiar el flujo de ejecución desde cualquier punto del programa hacia una rutina de servicio de interrupción.

- Traps: Se utilizan para cambiar intencionalmente el flujo de ejecución a una rutina específica en el kernel del sistema operativo.

D. Uso Común

- Interrupciones: Comúnmente utilizadas para eventos de hardware y situaciones externas que requieren atención inmediata del sistema operativo.

- Traps: Se utilizan en llamadas al sistema y para gestionar excepciones controladas por el software en ejecución.

#### El Cambio de Modo y las Interrupciones/Traps
la ejecucion de los eventos tales como Interrupciones, excepciones y trampas desencadenan la transicion llamada ***cambio de modo***.

#### Materialización del Cambio de Modo
El cambio de modo se realiza a través de una secuencia de pasos que permiten al kernel tomar el control y ejecutar tareas críticas antes de devolver el control al programa en modo usuario. Estos pasos incluyen:

_Salvaguarda de la Información:_ 
 Esto implica almacenar el estado actual de los registros y la información relevante que permita reanudar la ejecución exactamente donde se dejó cuando regrese al modo usuario.

_Activación del Bit de Modo en el Registro PSW:_ El Program Status Word (PSW) es un registro que contiene información sobre el estado actual del procesador. Al cambiar al modo kernel, se activa el bit de modo en el PSW, indicando que el procesador ahora opera en modo kernel. Esto concede al kernel acceso completo a los recursos del sistema.

_Ejecución de Tareas Críticas:_ Una vez en modo kernel, el kernel ejecuta las tareas críticas necesarias para manejar el evento que provocó el cambio de modo. Esto podría incluir la gestión de la interrupción, la resolución de una excepción o la ejecución de servicios del sistema solicitados mediante una trampa.

_Desactivación del Bit de Modo:_ Después de completar las tareas críticas, el kernel desactiva el bit de modo en el PSW, indicando la transición de vuelta al modo usuario.

Restauración de la Información: Finalmente, se restaura la información salvaguardada anteriormente, permitiendo que el programa en modo usuario continúe su ejecución desde donde se detuvo.

