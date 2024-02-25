# Servicio de Saludo

Este servicio imprime un mensaje de saludo y la fecha actual infinitamente con una pausa de un segundo.

## Instalación

1. Clonar este repositorio.
2. Colocar el script en `/usr/local/bin/saludo_script.sh` o cambiar la ruta.
3. Coloca el archivo de servicio en  `/etc/systemd/system/saludo_service.service` o cambiar la ruta.

## Uso

Para habilitar y arrancar el servicio:

```bash
sudo systemctl enable saludo_service.service
sudo systemctl start saludo_service.service
```

## Logs

para poder visualizar los logs

```bash
journalctl -u saludo_service.service
```

## Parar el servicio:

Para detener el servicio:

```bash
sudo systemctl disable saludo_service.service
```

## Eliminar los archivos:

Nota: depende de la ruta que le fue asignada, en este caso seria la siguiente

```bash
sudo rm /usr/local/bin/saludo_script.sh
sudo rm /etc/systemd/system/saludo_service.service
```


