# Sistema de Internacionalización (i18n)

## Estructura

```
lib/core/l10n/
├── app_localizations.dart      # Clase principal de localización
├── l10n_provider.dart          # Provider para gestión de idioma
├── translations/
│   ├── es.json                 # Traducciones en español
│   └── en.json                 # Traducciones en inglés
└── README.md                   # Esta documentación
```

## Idiomas Soportados

- **Español (es)** - Idioma por defecto
- **Inglés (en)**

## Uso Básico

### 1. Acceder a traducciones en widgets

```dart
import '../../../../core/l10n/app_localizations.dart';

// Método 1: Usando la extensión (recomendado)
Text(context.tr('home.title'))

// Método 2: Usando parámetros
Text(context.tr('referral.success_message', params: {'name': 'Juan'}))

// Método 3: Acceso directo
Text(context.l10n.translate('home.title'))
```

### 2. Cambiar idioma

```dart
import 'package:provider/provider.dart';
import '../../../../core/l10n/l10n_provider.dart';

// Cambiar a español
context.read<L10nProvider>().setLocale(const Locale('es', ''));

// Cambiar a inglés
context.read<L10nProvider>().setLocale(const Locale('en', ''));

// Alternar entre idiomas
context.read<L10nProvider>().toggleLocale();
```

### 3. Verificar idioma actual

```dart
final l10nProvider = context.watch<L10nProvider>();

if (l10nProvider.isSpanish) {
  // Código específico para español
}

if (l10nProvider.isEnglish) {
  // Código específico para inglés
}
```

## Estructura de Archivos JSON

Los archivos de traducción usan estructura anidada:

```json
{
  "home": {
    "title": "Inicio",
    "refer": "Referir"
  },
  "referral": {
    "title": "Referir un amigo",
    "success_message": "Gracias por registrar a {name}"
  }
}
```

## Agregar Nuevas Traducciones

1. Abre `translations/es.json` y `translations/en.json`
2. Agrega la nueva clave en ambos archivos
3. Usa la clave en tu código con `context.tr('tu.nueva.clave')`

### Ejemplo:

**es.json:**
```json
{
  "settings": {
    "title": "Configuración",
    "save": "Guardar"
  }
}
```

**en.json:**
```json
{
  "settings": {
    "title": "Settings",
    "save": "Save"
  }
}
```

**En el código:**
```dart
Text(context.tr('settings.title'))
```

## Traducciones con Parámetros

Para textos dinámicos, usa llaves `{nombre_parametro}`:

**JSON:**
```json
{
  "welcome": "Hola {name}, tienes {count} mensajes"
}
```

**Código:**
```dart
Text(context.tr('welcome', params: {
  'name': 'Juan',
  'count': '5'
}))
```

## Selector de Idioma

El selector de idioma está disponible en el perfil del usuario. Los usuarios pueden cambiar entre español e inglés tocando los botones ES/EN.

## Mejores Prácticas

1. **Usa claves descriptivas**: `home.refer` en lugar de `h1`
2. **Agrupa por feature**: `referral.*`, `profile.*`, `home.*`
3. **Mantén sincronizados**: Siempre agrega traducciones en ambos idiomas
4. **Usa parámetros**: Para textos dinámicos, usa `{parametro}`
5. **Evita hardcodear textos**: Siempre usa `context.tr()`

## Componentes Traducidos

Los siguientes componentes ya están traducidos:

- ✅ Home (menú principal)
- ✅ Profile (perfil y estadísticas)
- ✅ Referral (formulario de referidos)
- ✅ Referral Status (estado de referidos)
- ✅ Referral Detail (detalle de referido)
- ✅ Rewards (redimir premios)
- ✅ Coupon (generación de cupones)
- ✅ Notifications (notificaciones)
- ✅ Chatbot (asistente virtual)

## Agregar Nuevo Idioma

Para agregar un nuevo idioma (ej: portugués):

1. Crea `translations/pt.json` con todas las traducciones
2. Actualiza `app_localizations.dart`:
   ```dart
   static const List<Locale> supportedLocales = [
     Locale('es', ''),
     Locale('en', ''),
     Locale('pt', ''), // Nuevo
   ];
   ```
3. Actualiza el método `isSupported` en `_AppLocalizationsDelegate`
4. Agrega botón en `LanguageSelector`

## Troubleshooting

### Las traducciones no aparecen
- Verifica que el archivo JSON esté bien formado
- Asegúrate de que la clave existe en ambos idiomas
- Reinicia la app después de agregar nuevas traducciones

### Error "key not found"
- La clave no existe en el archivo JSON
- Verifica la ruta completa (ej: `home.title` no `title`)

### El idioma no cambia
- Verifica que estés usando `context.watch<L10nProvider>()` en lugar de `context.read()`
- Asegúrate de que el widget esté dentro del árbol de Provider
