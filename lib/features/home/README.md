# Home Feature

## 📱 Estructura de Widgets

### Componentes Principales

#### 1. HomeHeader
- Logo de Marval con icono naranja
- Botón de notificaciones
- Fondo blanco con padding

#### 2. UserProfileCard
- Avatar del usuario
- Nombre "Amigos Marval"
- Badges de tier (Bronze, Silver, Gold)
- Indicador de tier activo
- Flecha de navegación

#### 3. MenuCard
- Icono naranja con fondo semi-transparente
- Título y subtítulo
- Flecha de navegación
- Soporte para borde naranja (destacado)
- Fondo azul oscuro (cardBlue)

#### 4. BottomNavBar
- 5 items de navegación
- Iconos de Iconsax
- Item activo en naranja
- Items inactivos en gris
- Fondo azul marino oscuro
- Bordes redondeados superiores

#### 5. FloatingChatButton
- Botón flotante circular
- Icono de mensaje
- Fondo blanco con sombra

#### 6. TierBadge
- Badge reutilizable para tiers
- Colores: Bronze, Silver, Gold
- Estado activo/inactivo
- Bordes redondeados

## 🎨 Colores Utilizados

- **darkNavy**: `#0F172A` - Fondo del bottom nav
- **cardBlue**: `#1E293B` - Fondo de las tarjetas de menú
- **orange**: `#FF6B35` - Color de acento principal
- **bronze**: `#8B4513` - Badge Bronze
- **silver**: `#94A3B8` - Badge Silver
- **gold**: `#D4AF37` - Badge Gold

## 🔧 Funcionalidades

### Navegación
- Home (activo por defecto)
- Profile
- Notificaciones
- Settings (2 items)

### Menú Principal
1. **Referir** - Referir amigos (con borde destacado)
2. **Estado de mis referidos** - Ver estado de referidos
3. **Redimir premios** - Canjear recompensas
4. **Plan de premios** - Ver plan de recompensas

### Acciones
- Chat flotante (bottom-right)
- Notificaciones (header)
- Navegación entre secciones

## 📝 TODOs
- [ ] Implementar navegación a pantallas de referidos
- [ ] Implementar sistema de chat
- [ ] Conectar con API de usuario
- [ ] Implementar lógica de tiers
- [ ] Agregar animaciones de transición
