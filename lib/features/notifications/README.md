# Notifications Feature

## 📁 Estructura

```
notifications/
├── data/
│   ├── datasources/      # API calls, local storage
│   ├── models/           # Notification models
│   └── repositories/     # Repository implementations
├── domain/
│   ├── entities/         # Notification entities
│   ├── repositories/     # Repository interfaces
│   └── usecases/         # Business logic
└── presentation/
    ├── pages/
    │   └── notifications_page.dart
    ├── widgets/          # Notification-specific widgets
    └── bloc/             # State management (BLoC/Cubit)
```

## 🎯 Funcionalidades Planeadas

- [ ] Lista de notificaciones
- [ ] Marcar como leída
- [ ] Eliminar notificación
- [ ] Filtrar por tipo
- [ ] Badge de notificaciones no leídas
- [ ] Push notifications
- [ ] Notificaciones en tiempo real

## 📝 Widgets a Implementar

- NotificationsList - Lista de notificaciones
- NotificationCard - Tarjeta individual
- NotificationBadge - Badge con contador
- EmptyNotifications - Estado vacío
- NotificationFilter - Filtros de notificaciones

## 🔔 Tipos de Notificaciones

- Referidos nuevos
- Recompensas disponibles
- Cambios de tier
- Mensajes del sistema
- Actualizaciones de la app

## 🔗 Navegación

```dart
// Desde Home
context.go('/notifications');

// Desde cualquier lugar
context.push('/notifications');
```
