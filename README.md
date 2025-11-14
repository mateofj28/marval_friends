# Amigos Marval - Aplicación Móvil

Aplicación móvil Flutter para el programa de referidos de Marval, permitiendo a los clientes referir amigos y ganar premios.

## 📱 Descripción del Proyecto

Amigos Marval es una aplicación de fidelización que permite a los clientes de Marval referir nuevos compradores y obtener recompensas. La aplicación incluye gestión de referidos, seguimiento de estados, catálogo de premios, generación de cupones y un asistente virtual.

## 🏗️ Arquitectura

El proyecto sigue **Clean Architecture** con separación en capas:

```
lib/
├── core/                          # Funcionalidades compartidas
│   ├── auth/                      # Autenticación y almacenamiento de usuario
│   ├── constants/                 # Constantes de la aplicación
│   ├── di/                        # Inyección de dependencias (GetIt)
│   ├── errors/                    # Manejo de errores
│   ├── l10n/                      # Internacionalización (i18n)
│   │   ├── translations/          # Archivos JSON (es, en)
│   │   └── app_localizations.dart # Sistema de traducciones
│   ├── network/                   # Cliente HTTP y configuración
│   ├── router/                    # Navegación (GoRouter)
│   ├── theme/                     # Temas claro/oscuro
│   └── utils/                     # Utilidades y helpers
│
└── features/                      # Características por módulo
    ├── welcome/                   # Pantalla de bienvenida y login
    ├── home/                      # Página principal
    ├── referral/                  # Crear referidos
    ├── referral_status/           # Estado de referidos
    ├── referral_detail/           # Detalle de referido
    ├── rewards/                   # Billetera de premios
    ├── rewards_redeem/            # Catálogo de marcas
    ├── coupon_generation/         # Generación de cupones
    ├── rewards_plan/              # Plan de premios
    ├── profile/                   # Perfil de usuario
    ├── settings/                  # Configuración
    ├── chatbot/                   # Asistente virtual
    ├── notifications/             # Notificaciones
    └── login/                     # Lógica de autenticación (Bloc)
```

Cada feature sigue la estructura:
```
feature/
├── data/
│   ├── datasources/              # Fuentes de datos (API, local)
│   ├── models/                   # Modelos de datos
│   └── repositories/             # Implementación de repositorios
├── domain/
│   ├── entities/                 # Entidades de negocio
│   └── repositories/             # Interfaces de repositorios
└── presentation/
    ├── bloc/ o providers/        # Gestión de estado
    ├── pages/                    # Páginas/Pantallas
    └── widgets/                  # Widgets reutilizables
```

## ✅ Funcionalidades Implementadas

### 🔐 Autenticación
- [x] Login con número de documento
- [x] Validación de usuario contra API
- [x] Almacenamiento seguro de sesión
- [x] Manejo de estados de autenticación
- [x] Logout con confirmación

### 🏠 Home
- [x] Tarjeta de perfil de usuario
- [x] Badge de tier (Bronce, Plata, Oro)
- [x] Menú de navegación a todas las secciones
- [x] Botón flotante de chat
- [x] Navegación a perfil con swipe

### 👥 Gestión de Referidos
- [x] Formulario de registro de referidos
  - Nombre completo
  - Número de cédula
  - Email
  - Teléfono
  - Opción de atención personalizada
- [x] Validaciones de campos
- [x] Integración con API POST /api/referrals
- [x] Confirmación de registro exitoso

### 📊 Estado de Referidos
- [x] Lista de todos los referidos
- [x] Filtros por estado:
  - Todos
  - Sin Contactar
  - Intentando Contactar
  - Cotización
  - Opcionado
  - Cerrado Ganado
- [x] Mensajes contextuales por estado
- [x] Integración con API GET /api/referrals
- [x] Navegación a detalle de referido

### 📋 Detalle de Referido
- [x] Información completa del referido
- [x] Timeline visual de estados
- [x] Indicadores de progreso
- [x] Fecha de referencia

### 🎁 Sistema de Premios
- [x] Billetera con saldo disponible
- [x] Historial de transacciones
- [x] Requisitos de tier
- [x] Botón de redención

### 🏪 Catálogo de Marcas
- [x] Grid de 20+ marcas comerciales
- [x] Búsqueda en tiempo real
- [x] Filtros por categoría:
  - Restaurantes
  - Supermercado
  - Viajes
  - Cine
  - Comercios
- [x] Navegación a generación de cupones

### 🎫 Generación de Cupones
- [x] Input de monto con formato de moneda
- [x] Validaciones (mín $2,000 - máx $3,000,000)
- [x] Generación de código único
- [x] Display con QR code
- [x] Código de barras
- [x] Opción de generar nuevo cupón

### 👤 Perfil de Usuario
- [x] Avatar y nombre
- [x] Badge de tier actual
- [x] Estadísticas:
  - Total de referidos
  - Referidos exitosos
- [x] Barra de progreso hacia siguiente nivel
- [x] Menú de configuración

### ⚙️ Configuración
- [x] Selector de tema (Claro, Oscuro, Sistema)
- [x] Selector de idioma (Español, Inglés)
- [x] Términos y condiciones
- [x] Opción de cerrar sesión

### 💬 Chatbot / Asistente Virtual
- [x] Interfaz de chat
- [x] Mensaje de bienvenida
- [x] 3 FAQs predefinidas
- [x] Input de texto funcional
- [x] Respuestas automáticas
- [x] Scroll automático
- [x] Indicador de estado online

### 🌍 Internacionalización (i18n)
- [x] Sistema completo de traducciones
- [x] Soporte para Español e Inglés
- [x] 150+ strings traducidas
- [x] Cambio dinámico de idioma
- [x] Todas las páginas traducidas
- [x] Documento legal completo en ambos idiomas

### 🎨 Temas
- [x] Tema claro
- [x] Tema oscuro
- [x] Tema según sistema
- [x] Cambio dinámico sin reiniciar
- [x] Paleta de colores personalizada

### 🔔 Notificaciones
- [x] Página de notificaciones
- [x] Lista de notificaciones
- [x] Marcar todas como leídas
- [x] Diferentes tipos de notificaciones

## 🔌 Integraciones API

### Endpoints Implementados
- **POST** `/api/login` - Autenticación de usuarios
- **GET** `/api/referrals` - Obtener lista de referidos del usuario
- **POST** `/api/referrals` - Crear nuevo referido

### Configuración
Base URL configurada en: `lib/core/network/api_client.dart`

```dart
static const String baseUrl = 'https://api.marval.com';
```

## 📦 Dependencias Principales

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  provider: ^6.1.2
  flutter_bloc: ^8.1.6
  
  # Navigation
  go_router: ^14.6.2
  
  # Dependency Injection
  get_it: ^8.0.2
  
  # Network
  http: ^1.2.2
  
  # Storage
  shared_preferences: ^2.3.3
  
  # UI
  google_fonts: ^6.2.1
  iconsax: ^0.0.8
  qr_flutter: ^4.1.0
  barcode_widget: ^2.0.4
  
  # Internationalization
  intl: ^0.19.0
```

## 🚀 Instalación y Configuración

### Requisitos Previos
- Flutter SDK 3.5.4 o superior
- Dart 3.5.4 o superior
- Android Studio / VS Code
- Dispositivo físico o emulador

### Pasos de Instalación

1. **Clonar el repositorio**
```bash
git clone <repository-url>
cd marval_friends
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Configurar variables de entorno**
Editar `lib/core/network/api_client.dart` con la URL correcta del backend.

4. **Ejecutar la aplicación**
```bash
flutter run
```

## 🧪 Testing

```bash
# Ejecutar todos los tests
flutter test

# Ejecutar tests con coverage
flutter test --coverage
```

## 📱 Build para Producción

### Android
```bash
flutter build apk --release
# o
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 🎯 Pendientes / Roadmap

### Alta Prioridad
- [ ] Implementar endpoints faltantes:
  - GET `/api/user/profile` - Datos completos del usuario
  - GET `/api/rewards/balance` - Saldo de premios
  - GET `/api/rewards/transactions` - Historial de transacciones
  - POST `/api/coupons/generate` - Generar cupón real
  - GET `/api/rewards/plan` - Plan de premios
  - GET `/api/notifications` - Notificaciones del usuario
  - PUT `/api/notifications/read` - Marcar notificaciones como leídas

### Media Prioridad
- [ ] Implementar refresh tokens
- [ ] Agregar pull-to-refresh en listas
- [ ] Implementar paginación en listas largas
- [ ] Agregar skeleton loaders
- [ ] Implementar caché de imágenes
- [ ] Agregar analytics (Firebase Analytics)
- [ ] Implementar push notifications (FCM)
- [ ] Agregar deep linking completo
- [ ] Tests unitarios y de integración
- [ ] Tests de widgets

### Baja Prioridad
- [ ] Modo offline con sincronización
- [ ] Compartir referidos por redes sociales
- [ ] Exportar cupones como PDF
- [ ] Animaciones avanzadas
- [ ] Onboarding para nuevos usuarios
- [ ] Tutorial interactivo
- [ ] Soporte para tablets
- [ ] Versión web (Flutter Web)

### Mejoras de UX/UI
- [ ] Animaciones de transición entre páginas
- [ ] Feedback háptico en acciones importantes
- [ ] Mejoras en accesibilidad
- [ ] Soporte para modo landscape
- [ ] Optimización de rendimiento
- [ ] Reducción de tamaño del APK

### Seguridad
- [ ] Implementar certificate pinning
- [ ] Ofuscación de código
- [ ] Encriptación de datos sensibles
- [ ] Implementar biometría (huella/Face ID)
- [ ] Rate limiting en requests

## 📝 Notas de Desarrollo

### Convenciones de Código
- Seguir las guías de estilo de Dart/Flutter
- Usar nombres descriptivos en inglés
- Comentar código complejo
- Mantener widgets pequeños y reutilizables
- Separar lógica de UI

### Git Workflow
- `main` - Rama de producción
- `develop` - Rama de desarrollo
- `feature/*` - Nuevas características
- `bugfix/*` - Corrección de bugs
- `hotfix/*` - Correcciones urgentes

### Estructura de Commits
```
tipo(scope): descripción corta

Descripción detallada (opcional)

Tipos: feat, fix, docs, style, refactor, test, chore
```

## 👥 Equipo de Desarrollo

- **Desarrollador Principal:** [Nombre]
- **Período de Desarrollo:** 4 días (14 horas)
- **Stack:** Flutter, Dart, Clean Architecture

## 📄 Licencia

[Especificar licencia]

## 📞 Contacto y Soporte

- **Email:** amigosmarval@marval.com.co
- **Documentación API:** [URL si existe]
- **Issues:** [URL del repositorio de issues]

---

**Última actualización:** Jueves, [Fecha actual]  
**Versión:** 1.0.0  
**Estado:** En desarrollo - Funcionalidades core completadas
