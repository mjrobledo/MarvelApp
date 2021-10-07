# MarvelApp
## creado por: Miguel de Jesus Robledo Vera

[![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white&labelColor=101010)]()

##### Aplicación desarrollada con Swift 5 con soporte a partir de iOS 13.

- Soporta Portrait, Landscape left, Lanscape Right
- Guarda información en dispositivo para cuando no se tenga internet
- Permite la busqueda de información consumiendo un servicio (AlamoFire y object mapper)

## Arquitectura

#### MVVM con Router

Así mismo se utilizaron clases de apoyo para consumir servicios o guardar datos dentro de la aplicación.
 
| Clase | Descripción | 
| ------ | ------ |
| LocalDataManager | Maneja las funciones para guardar y obtener información desde el teléfono | 
| HomeManagerConection | Maneja el consumo de llamadas al Api rest para obtener la información|
| Singleton | Nos permite persistencia de datos |

## Observaciones:

⁄ Para guardar la información del servicio se utilizó UserDefaults.
 
⁄ Para proyectos más grandes se puede utilizar algo mas robusto como Realm db, Firebase o alguna otra.

## Configuración:
⁄ Se debe agregar la clave publica y privada por medio del esquema (Enviroment Variables)
· PUBLIC_KEY
· PRIVATE_KEY


## Librerías

Se utilizaron varias librerías a través de Swift Package Manager

| Framework | Repositorio | 
| ------ | ------ |
| ObjectMapper | [https://github.com/tristanhimmelman/ObjectMapper.git] | 
| Alamofire | [https://github.com/Alamofire/Alamofire.git]|
| CryptoSwift | [https://github.com/krzyzanowskim/CryptoSwift.git]|
| MBProgressHUD | [https://github.com/jdg/MBProgressHUD.git]|
