# 🗺️ Flujo de Navegación - Marval Friends

## 📱 Mapa de Navegación Completo

```
┌─────────────────────────────────────────────────────────────┐
│                      WELCOME PAGE                           │
│  • Logo Marval                                              │
│  • Campo: Ingresa Documento                                 │
│  • Campo: Token                                             │
│  • Botón: Ingresar ──────────────────────┐                  │
└─────────────────────────────────────────┼──────────────────┘
                                          │
                                          ▼
┌─────────────────────────────────────────────────────────────┐
│                       HOME PAGE                             │
│  ┌───────────────────────────────────────────────────────┐  │
│  │ Header: Logo + Notificaciones                         │  │
│  │ Profile Card: Avatar + Badges (Bronze/Silver/Gold)    │  │
│  │                                                        │  │
│  │ Menu Cards:                                           │  │
│  │  • Referir (con borde naranja)                       │  │
│  │  • Estado de mis referidos                           │  │
│  │  • Redimir premios                                   │  │
│  │  • Plan de premios                                   │  │
│  └───────────────────────────────────────────────────────┘  │
│                                                             │
│  ┌───────────────────────────────────────────────────────┐  │
│  │           BOTTOM NAVIGATION BAR                       │  │
│  │  [Home] [Profile] [Notifications] [Settings] [Settings]│  │
│  │    ▲       │          │              │          │      │  │
│  └────┼───────┼──────────┼──────────────┼──────────┼──────┘  │
│       │       │          │              │          │         │
└───────┼───────┼──────────┼──────────────┼──────────┼─────────┘
        │       │          │              │          │
        │       ▼          ▼              ▼          ▼
        │   ┌────────┐ ┌──────────────┐ ┌────────┐ ┌────────┐
        │   │PROFILE │ │NOTIFICATIONS │ │SETTINGS│ │SETTINGS│
        │   │  PAGE  │ │     PAGE     │ │  TODO  │ │  TODO  │
        │   └────────┘ └──────────────┘ └────────┘ └────────┘
        │       │          │
        │       │          │
        └───────┴──────────┴─── [Back Button] ───────────────┐
                                                              │
                                    Vuelve a HOME PAGE ◄──────┘
```

---

## 🎯 Navegación por Índice

### Bottom Navigation Bar

| Índice | Icono | Label | Destino | Estado |
|--------|-------|-------|---------|--------|
| 0 | 🏠 home_15 | Home | HomePage (actual) | ✅ |
| 1 | 📊 grid_1 | Profile | ProfilePage | ✅ |
| 2 | 🔔 notification | Notifications | NotificationsPage | ✅ |
| 3 | 🛡️ shield_tick | Settings | TODO | 🚧 |
| 4 | ⚙️ setting_2 | Settings | TODO | 🚧 |

---

## 🔄 Tipos de Navegación

### 1. context.go() - Reemplaza la ruta
```dart
// Usado en Welcome → Home
context.go(AppRouter.home);

Comportamiento:
✅ Reemplaza la ruta actual
✅ No se puede volver atrás
✅ Ideal para login → home
```

### 2. context.push() - Agrega a la pila
```dart
// Usado en Home → Profile/Notifications
context.push(AppRouter.profile);
context.push(AppRouter.notifications);

Comportamiento:
✅ Agrega nueva ruta a la pila
✅ Permite volver atrás
✅ Ideal para navegación entre tabs
```

---

## 📊 Flujo de Usuario

### Escenario 1: Login y Navegación a Profile
```
1. Usuario abre la app
   └─→ WelcomePage

2. Usuario ingresa credenciales y presiona "Ingresar"
   └─→ context.go(AppRouter.home)
   └─→ HomePage

3. Usuario toca tab "Profile"
   └─→ context.push(AppRouter.profile)
   └─→ ProfilePage

4. Usuario presiona botón back
   └─→ Vuelve a HomePage
```

### Escenario 2: Login y Navegación a Notifications
```
1. Usuario abre la app
   └─→ WelcomePage

2. Usuario ingresa credenciales y presiona "Ingresar"
   └─→ context.go(AppRouter.home)
   └─→ HomePage

3. Usuario toca tab "Notifications"
   └─→ context.push(AppRouter.notifications)
   └─→ NotificationsPage

4. Usuario presiona botón back
   └─→ Vuelve a HomePage
```

### Escenario 3: Navegación múltiple
```
1. WelcomePage
   └─→ HomePage
       ├─→ ProfilePage
       │   └─→ [Back] → HomePage
       │
       └─→ NotificationsPage
           └─→ [Back] → HomePage
```

---

## 🎨 Estados Visuales

### BottomNavBar - Estado Activo
```
Cuando el usuario está en HomePage:
┌─────────────────────────────────────────┐
│ [🏠 Home]  [Profile]  [Notifications]   │
│  NARANJA    GRIS       GRIS             │
└─────────────────────────────────────────┘

Cuando el usuario navega a Profile:
┌─────────────────────────────────────────┐
│ [Home]  [📊 Profile]  [Notifications]   │
│  GRIS     NARANJA       GRIS            │
└─────────────────────────────────────────┘

Cuando el usuario navega a Notifications:
┌─────────────────────────────────────────┐
│ [Home]  [Profile]  [🔔 Notifications]   │
│  GRIS     GRIS        NARANJA           │
└─────────────────────────────────────────┘
```

---

## 🔧 Código de Navegación

### En HomePage
```dart
void _onNavTap(int index) {
  setState(() {
    _currentIndex = index;
  });

  switch (index) {
    case 0:
      // Ya estamos en Home, no hacer nada
      break;
    case 1:
      // Navegar a Profile
      context.push(AppRouter.profile);
      break;
    case 2:
      // Navegar a Notifications
      context.push(AppRouter.notifications);
      break;
    case 3:
      // TODO: Navegar a Settings
      break;
    case 4:
      // TODO: Navegar a Settings
      break;
  }
}
```

### En AppRouter
```dart
static const String welcome = '/';
static const String home = '/home';
static const String profile = '/profile';
static const String notifications = '/notifications';

static final GoRouter router = GoRouter(
  initialLocation: welcome,
  routes: [
    GoRoute(path: welcome, builder: (context, state) => const WelcomePage()),
    GoRoute(path: home, builder: (context, state) => const HomePage()),
    GoRoute(path: profile, builder: (context, state) => const ProfilePage()),
    GoRoute(path: notifications, builder: (context, state) => const NotificationsPage()),
  ],
);
```

---

## 📝 Rutas Disponibles

| Ruta | Constante | Página | Método |
|------|-----------|--------|--------|
| `/` | `AppRouter.welcome` | WelcomePage | `context.go()` |
| `/home` | `AppRouter.home` | HomePage | `context.go()` |
| `/profile` | `AppRouter.profile` | ProfilePage | `context.push()` |
| `/notifications` | `AppRouter.notifications` | NotificationsPage | `context.push()` |

---

## ✅ Verificación de Navegación

### Checklist
- [x] Welcome → Home funciona
- [x] Home → Profile funciona
- [x] Home → Notifications funciona
- [x] Back desde Profile funciona
- [x] Back desde Notifications funciona
- [x] BottomNavBar actualiza estado visual
- [ ] Settings tabs (pendiente)

---

## 🚀 Estado Actual

**Navegación Operativa:**
- ✅ 4 rutas configuradas
- ✅ 3 navegaciones funcionando
- ✅ Back navigation funcionando
- ✅ Estado visual del BottomNavBar
- ✅ Sin errores de compilación

**Pendiente:**
- 🚧 Implementar Settings pages
- 🚧 Mejorar persistencia del estado del tab
- 🚧 Agregar animaciones de transición

**Estado: NAVEGACIÓN FUNCIONAL** 🎉
