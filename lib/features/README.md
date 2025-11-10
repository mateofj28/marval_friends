# Features Structure

Este proyecto sigue Clean Architecture con la siguiente estructura para cada feature:

```
features/
├── feature_name/
│   ├── data/
│   │   ├── datasources/
│   │   ├── models/
│   │   └── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── usecases/
│   └── presentation/
│       ├── pages/
│       ├── widgets/
│       └── bloc/ (o cubit/)
```

## Features Implementados

### ✅ Welcome
- Pantalla de bienvenida con formulario de login
- Widgets reutilizables (logo, título, formulario, botones, campos de texto)
- Navegación a Home
- **Estado**: Completamente implementado

### ✅ Home
- Header con logo y notificaciones
- Tarjeta de perfil con badges de tier
- 4 opciones de menú (Referir, Estado de referidos, Redimir premios, Plan de premios)
- Bottom navigation bar
- Botón flotante de chat
- **Estado**: Completamente implementado

### 🚧 Profile
- Estructura base creada
- Página inicial implementada
- Preparado para implementación completa
- **Estado**: En desarrollo

### 🚧 Notifications
- Estructura base creada
- Página inicial implementada
- Preparado para implementación completa
- **Estado**: En desarrollo

## 📁 Estructura Completa

```
features/
├── welcome/          ✅ Implementado
│   ├── data/
│   ├── domain/
│   └── presentation/
│       ├── pages/
│       └── widgets/
├── home/             ✅ Implementado
│   ├── data/
│   ├── domain/
│   └── presentation/
│       ├── pages/
│       └── widgets/
├── profile/          🚧 Estructura lista
│   ├── data/
│   ├── domain/
│   └── presentation/
│       ├── pages/
│       └── widgets/
└── notifications/    🚧 Estructura lista
    ├── data/
    ├── domain/
    └── presentation/
        ├── pages/
        └── widgets/
```
