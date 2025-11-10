# Profile Feature

## 📁 Estructura

```
profile/
├── data/
│   ├── datasources/      # API calls, local storage
│   ├── models/           # Data models (JSON serialization)
│   └── repositories/     # Repository implementations
├── domain/
│   ├── entities/         # Business entities
│   ├── repositories/     # Repository interfaces
│   └── usecases/         # Business logic
└── presentation/
    ├── pages/
    │   └── profile_page.dart
    ├── widgets/          # Profile-specific widgets
    └── bloc/             # State management (BLoC/Cubit)
```

## 🎯 Funcionalidades Planeadas

- [ ] Ver información del usuario
- [ ] Editar perfil
- [ ] Cambiar foto de perfil
- [ ] Ver estadísticas de referidos
- [ ] Ver tier actual y progreso
- [ ] Configuración de cuenta
- [ ] Cerrar sesión

## 📝 Widgets a Implementar

- ProfileHeader - Foto y nombre del usuario
- ProfileInfoCard - Información personal
- StatsCard - Estadísticas de referidos
- TierProgressCard - Progreso de tier
- ProfileMenuItem - Items del menú de perfil
- EditProfileForm - Formulario de edición

## 🔗 Navegación

```dart
// Desde Home
context.go('/profile');

// Desde cualquier lugar
context.push('/profile');
```
