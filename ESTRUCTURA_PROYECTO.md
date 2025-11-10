# Estructura del Proyecto Marval Friends

## 📁 Arquitectura Implementada

El proyecto sigue **Clean Architecture** con separación clara de responsabilidades:

### Core (lib/core/)
- **router/**: Configuración de navegación con go_router
- **theme/**: Colores y tema de la aplicación
- **constants/**: Constantes globales (preparado)
- **errors/**: Manejo de errores (preparado)
- **network/**: Configuración de red (preparado)
- **utils/**: Utilidades generales (preparado)

### Features (lib/features/)

#### Welcome (Implementado)
```
welcome/
├── data/           # Capa de datos (preparado para APIs, modelos)
├── domain/         # Lógica de negocio (entidades, casos de uso)
└── presentation/   # UI
    ├── pages/
    │   └── welcome_page.dart
    └── widgets/
        ├── welcome_logo.dart
        ├── welcome_title.dart
        ├── welcome_form.dart
        ├── custom_text_field.dart
        └── primary_button.dart
```

#### Home (Estructura base)
```
home/
├── data/           # Preparado para implementación
├── domain/         # Preparado para implementación
└── presentation/
    ├── pages/
    │   └── home_page.dart
    └── widgets/    # Preparado para widgets
```

## 🎨 Diseño Implementado

### Colores (AppColors)
- Primary Blue: `#1E3A8A`
- Primary Cyan: `#06B6D4`
- Light Cyan: `#22D3EE`
- Background: `#F8FAFC`

### Tipografía
- Fuente: **Poppins** (Google Fonts)
- Tamaños: 48px (título), 20px (botones), 16px (inputs)

### Componentes
- Logo con casa y sonrisa
- Campos de texto personalizados con fondo azul oscuro
- Botón primario cyan con texto azul oscuro
- Diseño responsive y limpio

## 🚀 Navegación

### Rutas Configuradas
- `/` → Welcome Page
- `/home` → Home Page

### Uso
```dart
// Navegar a home
context.go(AppRouter.home);

// Navegar a welcome
context.go(AppRouter.welcome);
```

## 📦 Dependencias Agregadas
- `go_router: ^17.0.0` - Navegación declarativa
- `iconsax: ^0.0.8` - Iconos modernos y amigables
- `google_fonts: ^6.2.1` - Tipografía Poppins

## 🔧 Próximos Pasos Sugeridos
1. Implementar lógica de autenticación en welcome/domain
2. Crear servicios de API en welcome/data
3. Agregar BLoC/Cubit para manejo de estado
4. Implementar pantalla Home completa
5. Agregar validación de formularios
6. Implementar almacenamiento local con Hive
