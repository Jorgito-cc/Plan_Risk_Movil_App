# Plan Risk Movil

Aplicación móvil multiplataforma desarrollada con Flutter para visualización interactiva de planos arquitectónicos en 3D y evaluación de riesgos en proyectos de construcción.

## Descripción del Proyecto

Plan Risk Movil es una herramienta integral diseñada para profesionales en construcción y gestión de proyectos. La aplicación permite:

- Visualizar modelos 3D de planos en formato GLB
- Evaluar automáticamente riesgos usando inteligencia artificial (API Gemini)
- Gestionar presupuestos y análisis de proyectos
- Sincronización en tiempo real con servidor backend
- Autenticación segura y gestión de usuarios
- Acceso multiplataforma (iOS, Android, Web, Windows, macOS, Linux)

## Tecnologías

- **Framework**: Flutter 3.9+
- **Lenguaje**: Dart 3.9+
- **Gestión de Estado**: GetX 4.6+
- **Visualización 3D**: model_viewer_plus 1.9+
- **Almacenamiento**: GetStorage 2.1+, Shared Preferences 2.5+
- **UI**: Material Design con temas claro y oscuro
- **Tipografía**: Google Fonts 6.3+

## Arquitectura del Proyecto

```
lib/
├── main.dart                          # Punto de entrada de la aplicación
├── api/
│   └── auth_service.dart              # Servicio de autenticación HTTP
├── config/
│   ├── app_themes.dart                # Definición de temas (claro/oscuro)
│   ├── app_textstyles.dart            # Estilos de texto globales
│   └── theme_controller.dart          # Controlador de cambio de tema
├── const/
│   └── app_constants.dart             # Constantes globales (baseUrl, etc)
├── model/
│   └── model3d.dart                   # Modelo de datos para objetos 3D
├── routes/
│   └── routes.dart                    # Definición de rutas de navegación
├── screens/
│   ├── auth/                          # Pantallas de autenticación
│   │   ├── controller/
│   │   │   └── model_controller.dart  # Lógica de modelos 3D
│   │   ├── models/
│   │   │   └── user_model.dart        # Modelo de usuario
│   │   ├── service/
│   │   │   └── auth_controller.dart   # Control de autenticación
│   │   └── view/
│   │       ├── signin_screen.dart
│   │       ├── sign_up_screen.dart
│   │       └── forgot_password_screen.dart
│   ├── dasboard/                      # Panel de control principal
│   │   ├── models/
│   │   │   ├── model_info.dart
│   │   │   ├── model3d_model.dart
│   │   │   └── modeldetail.dart
│   │   ├── view/
│   │   │   └── dashboard_screen.dart
│   │   └── widgets/
│   │       ├── model_card.dart
│   │       └── ModelDetailScreen.dart
│   ├── main/                          # Pantalla principal de la aplicación
│   │   ├── main_screen.dart
│   │   ├── perfil/
│   │   │   ├── profile_screen.dart
│   │   │   └── model/
│   │   │       └── model_item.dart
│   │   ├── planVisualizador/
│   │   │   └── visualizador3dPage.dart
│   │   └── sidebar/
│   │       ├── view/
│   │       │   └── sidebar.dart
│   │       └── widget/
│   │           ├── ConfigOptionsCard.dart
│   │           ├── DiseñoIA.dart
│   │           ├── mis_modelos_section.dart
│   │           ├── modelo_detalle_page.dart
│   │           ├── mymodelopage.dart
│   │           ├── plan_premiun.dart
│   │           ├── ProcesamientoScreen.dart
│   │           └── soporte_ayuda.dart
│   ├── onboarding/
│   │   └── onboarding_screen.dart
│   ├── splash/
│   │   └── splash_screen.dart
│   ├── view/
│   │   └── glb_viewer_page.dart
│   └── widgets/
│       ├── input/
│       │   └── custom_textfield.dart
│       └── navegacion/
│           └── pill_bottom_nav.dart
```

## Patrón de Arquitectura

La aplicación implementa el patrón MVVM (Model-View-ViewModel) con GetX:

- **Models**: Estructuras de datos (user_model.dart, model3d.dart, etc)
- **Views**: Pantallas UI (screens/)
- **Controllers**: Lógica de negocio y gestión de estado (auth_controller.dart, model_controller.dart)
- **Services**: Comunicación con APIs y servicios externos (auth_service.dart)

## Requisitos Previos

- Flutter SDK >= 3.9.0
- Dart SDK >= 3.9.0
- Git
- Un IDE recomendado (VS Code, Android Studio o IntelliJ IDEA)

## Instalación

1. Clonar el repositorio:
```bash
git clone <url-repositorio>
cd Plan_Risk_Movil
```

2. Instalar dependencias:
```bash
flutter pub get
```

3. Generar archivos necesarios:
```bash
flutter pub run build_runner build
```

## Comandos Principales

### Obtener dependencias
```bash
flutter pub get
flutter pub upgrade
```

### Ejecutar la aplicación

En desarrollo (con hot reload):
```bash
flutter run
```

En dispositivo específico:
```bash
flutter run -d <device-id>
```

Listar dispositivos disponibles:
```bash
flutter devices
```

### Compilar para producción

iOS:
```bash
flutter build ios --release
```

Android (APK):
```bash
flutter build apk --release
```

Android (App Bundle):
```bash
flutter build appbundle --release
```

Web:
```bash
flutter build web --release
```

### Análisis y validación

Verificar el código:
```bash
flutter analyze
```

Ejecutar pruebas:
```bash
flutter test
```

Formato de código:
```bash
flutter format lib/
dart format lib/
```

### Limpiar caché
```bash
flutter clean
```

## Variables de Entorno

Crear archivo `.env` en la raíz del proyecto:

```env
BASE_URL=http://tu-servidor:8000/
API_KEY=tu_clave_api
ENVIRONMENT=development
```

Ver [.env.example](.env.example) para más variables disponibles.

## Características Principales

- Autenticación con JWT
- Visualización interactiva de modelos 3D
- Evaluación automática de riesgos con IA
- Gestión de presupuestos
- Panel de usuario personalizado
- Soporte multiplataforma
- Temas claro y oscuro adaptativo
- Almacenamiento local con GetStorage

## Estado del Proyecto

Versión: 1.0.0

En desarrollo activo.

## Contribuidores

- Fournext Team

## Licencia

Todos los derechos reservados.

## Contacto

Para soporte o consultas, contactar al equipo de desarrollo.
