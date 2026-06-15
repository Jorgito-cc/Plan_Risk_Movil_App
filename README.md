# Plan Risk Movil

Aplicacion movil multiplataforma desarrollada con Flutter para la visualizacion interactiva de planos arquitectonicos en 3D y evaluacion de riesgos en proyectos de construccion, impulsada por inteligencia artificial.

---

## Descripcion del Proyecto

Plan Risk Movil es la herramienta definitiva para profesionales de la construccion, ingenieros y gestores de proyectos. Esta aplicacion permite llevar el poder del analisis 3D y la prevencion de riesgos directamente en el dispositivo movil.

### Capacidades Destacadas:
- Visualizacion 3D Avanzada: Renderizado fluido de modelos en formato .glb.
- Evaluacion con IA: Analisis automatico de riesgos usando la API de Gemini.
- Presupuestos Inteligentes: Generacion y exportacion de presupuestos y analisis de costos.
- Sincronizacion en Tiempo Real: Conectado directamente al backend Django.
- Seguridad y Autenticacion: Inicio de sesion protegido con JWT, recuperacion de contraseñas y gestion de perfiles.
- Multiplataforma: Listo para compilar en iOS, Android y Web.

---

## Tecnologias Utilizadas

- Framework: Flutter 3.9+
- Lenguaje: Dart 3.9+
- Gestion de Estado: GetX 4.6+
- Visualizacion 3D: model_viewer_plus 1.9+
- Almacenamiento Local: GetStorage 2.1+, Shared Preferences 2.5+
- Diseño: Material Design 3 (con soporte automatico para temas Claro/Oscuro)
- Tipografia: Google Fonts (Inter, Roboto)

---

## Arquitectura del Proyecto (MVVM con GetX)

El proyecto sigue una arquitectura limpia basada en el patron MVVM (Model-View-ViewModel) estructurado mediante GetX para una separacion clara entre la interfaz grafica y la logica de negocio.

```text
lib/
├── api/          # Conexion al servidor (AuthService, etc.)
├── config/       # Temas, colores y estilos de texto
├── const/        # Variables globales y constantes (ej. endpoints)
├── model/        # Modelos de datos puros
├── routes/       # Definicion del enrutamiento de la app
├── screens/      # Modulos de vistas
│   ├── auth/     # Login, Registro, Recuperacion de contraseña
│   ├── dasboard/ # Panel principal y estadisticas
│   ├── main/     # Estructura principal y Sidebar
│   └── splash/   # Pantalla de carga inicial
└── widgets/      # Componentes reutilizables (inputs, botones, cards)
```

---

## Instalacion y Despliegue

### Requisitos Previos
- Flutter SDK >= 3.9.0
- Dart SDK >= 3.9.0
- Git

### Pasos de Instalacion

1. Clonar el repositorio:
   ```bash
   git clone <url-repositorio>
   cd Plan_Risk_Movil
   ```

2. Obtener las dependencias:
   ```bash
   flutter pub get
   ```

3. Configurar el entorno:
   Crea un archivo .env en la raiz del proyecto basandote en el .env-example:
   ```env
   BASE_URL=http://tu-servidor:8000/
   API_KEY=tu_clave_api
   ENVIRONMENT=development
   ```

4. Ejecutar la aplicacion (Desarrollo):
   ```bash
   flutter run
   ```

---

## Comandos Utiles de Flutter

Compilar para Produccion:
- Android (APK): flutter build apk --release
- Android (Bundle para Play Store): flutter build appbundle --release
- iOS: flutter build ios --release
- Web: flutter build web --release

Mantenimiento:
- Limpiar cache: flutter clean
- Analizar codigo: flutter analyze
- Formatear codigo: dart format lib/

---

## Contribuciones y Licencia

Desarrollado y mantenido por Fournext Team.
Todos los derechos reservados.

Para soporte tecnico o consultas, contactar al equipo de desarrollo interno.
