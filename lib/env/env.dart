import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(requireEnvFile: true)
final class Env {
  @EnviedField(varName: 'BASE_URL')
  static String baseUrl = _Env.baseUrl;
  @EnviedField(varName: 'SALT_KEY')
  static String saltKey = _Env.saltKey;
  @EnviedField(varName: 'SECRET_KEY')
  static String secretKey = _Env.secretKey;
}
