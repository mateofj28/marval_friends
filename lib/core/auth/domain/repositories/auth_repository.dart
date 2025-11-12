import '../models/auth_token.dart';
import '../models/user_talent.dart';

abstract class AuthRepository {
  Future<AuthToken> authenticate();
  Future<List<UserTalent>> getTalentUsers(String token);
  Future<UserTalent?> validateAndGetUser(String documento);
}
