# Proyecto Vivero El Salto - Plantas de Magallanes

Este proyecto consiste en el desarrollo de una aplicación de escritorio para administrar y catalogar las plantas presentes en un vivero de la Región de Magallanes. La aplicación permite ingresar, administrar, eliminar y listar las plantas registradas en una base de datos SQL Server. Además, incluye un sistema de autenticación de usuarios y encriptación de datos sensibles.

## Tecnologías empleadas

- SQL Server
- Visual Studio 2022
- C#
- XAML (WPF)
- Entity Framework 6
- SALT y AES para encriptación

## Descripción del proyecto

El proyecto consta de tres capas:

1. **Capa de Modelo de Entidades**: Utiliza Entity Framework para generar el modelo de entidades a partir de la base de datos. Incluye los procedimientos almacenados y vistas necesarios, así como la encriptación de datos sensibles.

2. **Capa de Negocio**: Contiene la lógica de negocio de la aplicación. Incluye la clase `Planta` para administrar los datos de las plantas, con validaciones en los campos y encriptación de datos sensibles.

3. **Capa de Presentación**: Desarrollada en WPF, contiene las vistas de usuario. Incluye la ventana de login, la ventana principal con opciones para agregar nuevas plantas y listar plantas, y formularios para agregar y actualizar plantas. Implementa validaciones en tiempo real y habilita/deshabilita botones según la presencia de errores de validación.

## Generación de la base de datos

Se utiliza el script SQL proporcionado para generar la base de datos `El_Salto`, que incluye las tablas `Login` y `Planta`, así como un usuario por defecto (`Administrador`) con su respectiva contraseña.

## Paquete de instalación

Se genera un paquete de instalación que incluye un acceso directo en el escritorio del usuario y en el menú de aplicaciones. La aplicación se instala con el nombre "Vivero El Salto - Plantas de Magallanes" y utiliza un ícono acorde a los requerimientos del cliente.

## Demostración del funcionamiento

Se adjunta un [enlace](https://drive.google.com/file/d/1XVfnyo2DAWHVywu-VFavEKg2zfHicXfi/view?usp=sharing) para visualizar una demostración del funcionamiento del proyecto ya instalado.

## Capturas de pantalla

Se incluye una carpeta con algunos screenshots del desarrollo inicial del proyecto, mostrando las interfaces de usuario y las funcionalidades implementadas.

## Pendientes

Aunque el proyecto cumple con los requerimientos especificados, quedan algunos detalles pendientes en cuanto a validaciones y otros aspectos, los cuales se irán mejorando en futuras iteraciones del desarrollo.

## Autor

Jose Contreras Stoltze
