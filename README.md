# coveverapp

Bienvenido equipo EVERTEC , por favor lea lo siguiente antes de ejecutar la aplicación

Se uso uso clean arquitecture tratando de seguir los principios SOLID
Se uso el manejador de estado BloC
Para llamadas http y https se uso Dio con sus respecitivos iterceptors.

Se uso la siguiente organización de carpetas
<img width="321" alt="image" src="https://github.com/JohnatanBarrero/coveverapp/assets/20840714/610c224d-df3a-4d97-8956-0c4212a13496">
Config -> Tiene los arvhivos necesarios para la configuracion inicial del app que no tienen que ver con la logica de negocio.
Nota importante: Dentro de esta carpeta hay otra llamada main, esta carpeta los archivos necesarios para la logica del estado global de la app, en esta entrega solo la usamos para cambiar el tema pero, puede usarse para configuraciones mas avanzadas como idioma, ambientes conexiones especiales etc.
Core -> En esta carpeta tenemos los archivos necesario para manejar el core de la logica, para esta entrega no se usarion pero quedaron listas.
features -> En esta carpeta quedo todo lo relacionado con las funcionalidades.

Cada feature tiene la siguiente organizacion de carpetas 
<img width="322" alt="image" src="https://github.com/JohnatanBarrero/coveverapp/assets/20840714/a5ba6b9d-0b47-4a9d-99e7-509434aed3fd">

Recuerde que como usamos clean arquitecture y tratando de seguir los principos SOLID esta organización nos ayudara a cumplir con esto.
Dentro de feature encontramos:
Data->Implementación de repositorios específicos
Domain->Lógica de negocio especifica
Dentro de domain tenemos 
<img width="192" alt="image" src="https://github.com/JohnatanBarrero/coveverapp/assets/20840714/32ce453a-f2da-4593-a835-92e39b4d9e0d">
Aqui es mportante por que maneja la logica de negocio y fuentes de datos.
Presentation->Capa de presentación especifica (UI y BLoCs
Por ultimo la carptea shared
Shared-> Esta carpeta tiene recursos que se pueden conpartir en todos lado de la app.

Como ejecutar la app
Para ejecutar exitosamente la app ejecute los sigientes comandos
flutter clean && flutter pub get && flutter run
Copie estos tres comandi y peguelos en la terminal , se ejecutaran al tiempo y correla la aplicación

Por ultimo usas capturas
<img width="411" alt="image" src="https://github.com/JohnatanBarrero/coveverapp/assets/20840714/332d282f-698b-4507-bc0d-d22281e42bb7">
<img width="420" alt="image" src="https://github.com/JohnatanBarrero/coveverapp/assets/20840714/3e81b6b1-cd6e-4214-8348-0309309147c8">
<img width="411" alt="image" src="https://github.com/JohnatanBarrero/coveverapp/assets/20840714/852c3a7b-2f71-4698-af3c-8cca59c0a330">
<img width="417" alt="image" src="https://github.com/JohnatanBarrero/coveverapp/assets/20840714/d123dfce-c2f5-4525-a761-f7137e6c9571">
<img width="428" alt="image" src="https://github.com/JohnatanBarrero/coveverapp/assets/20840714/ed48c0c2-cb3a-4936-822b-1a6e85fe3c22">












