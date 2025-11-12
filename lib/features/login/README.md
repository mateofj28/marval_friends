# Módulo de Login

## Flujo de Autenticación

### 1. Usuario ingresa documento en WelcomePage
- El usuario ingresa su número de documento
- Presiona el botón "Ingresar"

### 2. Proceso de validación (automático)

#### Paso 1: Obtener Token OAuth
```
POST https://proveedores.marval.com.co/ords/api/oauth/token
Headers: Basic Auth (credenciales en base64)
Body: grant_type=client_credentials
```

#### Paso 2: Obtener lista de usuarios
```
GET https://proveedores.marval.com.co/ords/api/talent_referidos/talent_registros
Headers: Authorization: Bearer {token}
```

#### Paso 3: Validar documento
- Busca el documento ingresado en la lista de usuarios
- Compara ignorando mayúsculas/minúsculas y espacios

### 3. Resultados posibles

#### ✅ Usuario encontrado
- Navega automáticamente a HomePage
- El usuario es un "Amigo Marval"

#### ❌ Usuario no encontrado
- Muestra dialog: "Aún no eres amigo Marval"
- El usuario permanece en WelcomePage

#### ⚠️ Error de conexión/API
- Muestra dialog con el mensaje de error
- El usuario puede intentar nuevamente

## Estados del LoginBloc

- `LoginInitial`: Estado inicial
- `LoginLoading`: Validando usuario (muestra loading)
- `LoginSuccess`: Usuario válido (navega a home)
- `LoginUserNotFound`: Usuario no encontrado (muestra dialog)
- `LoginFailure`: Error en el proceso (muestra error)

## Manejo de errores

- Error de red: "Error de conexión: {detalle}"
- Error HTTP: "Error al obtener usuarios: {código} - {detalle}"
- Documento vacío: "Por favor ingresa tu documento"
- Error inesperado: "Error inesperado: {detalle}"

## Logs de debug

El proceso imprime logs detallados en consola:
- 🔐 Inicio de autenticación
- ✅ Token obtenido
- 📦 Respuesta de la API
- 👥 Total de usuarios
- 🔍 Documento buscado
- ✅/❌ Resultado de la búsqueda
