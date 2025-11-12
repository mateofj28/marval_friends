# Módulo de Autenticación

## Estructura

```
auth/
├── data/
│   ├── datasources/
│   │   ├── auth_api_service.dart          # Retrofit API service
│   │   └── auth_api_service.g.dart        # Generado por build_runner
│   └── repositories/
│       └── auth_repository_impl.dart      # Implementación del repositorio
├── domain/
│   ├── models/
│   │   └── auth_token.dart                # Modelo del token
│   └── repositories/
│       └── auth_repository.dart           # Interfaz del repositorio
└── presentation/
    └── bloc/
        ├── auth_bloc.dart                 # Lógica de negocio
        ├── auth_event.dart                # Eventos
        └── auth_state.dart                # Estados
```

## Flujo de Autenticación

1. Al iniciar la app, se ejecuta `setupDependencies()` en `main.dart`
2. Se crea el `AuthBloc` y se dispara el evento `AuthenticateRequested`
3. El Bloc llama al repositorio que hace la petición HTTP
4. Se muestra un SnackBar con el resultado (éxito o error)

## Estados

- `AuthInitial`: Estado inicial
- `AuthLoading`: Autenticando
- `AuthSuccess`: Token obtenido exitosamente
- `AuthFailure`: Error en la autenticación

## Uso del Token

El token se guarda en el estado `AuthSuccess` y puede ser accedido desde cualquier parte de la app usando:

```dart
final authState = context.read<AuthBloc>().state;
if (authState is AuthSuccess) {
  final token = authState.token.accessToken;
  // Usar el token en otras peticiones
}
```
