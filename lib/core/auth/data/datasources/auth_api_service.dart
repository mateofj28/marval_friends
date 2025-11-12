import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/models/auth_token.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: 'https://proveedores.marval.com.co/ords/api')
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/oauth/token')
  @FormUrlEncoded()
  Future<AuthToken> getToken(
    @Field('grant_type') String grantType,
  );

  @GET('/talent_referidos/talent_registros')
  Future<HttpResponse<dynamic>> getTalentUsers(
    @Header('Authorization') String authorization,
  );
}
