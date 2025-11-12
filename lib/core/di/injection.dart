import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../auth/data/datasources/auth_api_service.dart';
import '../auth/data/repositories/auth_repository_impl.dart';
import '../auth/domain/repositories/auth_repository.dart';
import '../auth/presentation/bloc/auth_bloc.dart';
import '../auth/data/datasources/user_storage.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Dio
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    
    // Configurar interceptor para autenticación básica
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Agregar autenticación básica para el endpoint de token
        if (options.path.contains('/oauth/token')) {
          final credentials = 'chaZcl8b5XqK8RDgmLmOIg..:Shp6DlXjJ1CFkweZTzRvLw..';
          final basicAuth = 'Basic ${base64Encode(credentials.codeUnits)}';
          options.headers['Authorization'] = basicAuth;
        }
        return handler.next(options);
      },
    ));
    
    return dio;
  });

  // Auth API Service
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(getIt<Dio>()),
  );

  // Auth Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthApiService>()),
  );

  // Auth Bloc
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(getIt<AuthRepository>()),
  );

  // User Storage
  getIt.registerLazySingleton<UserStorage>(() => UserStorage());

  // Login Bloc
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(getIt<AuthRepository>(), getIt<UserStorage>()),
  );
}
