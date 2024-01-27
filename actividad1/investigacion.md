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

### Interruptions vs traps