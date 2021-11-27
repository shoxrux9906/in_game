import 'package:in_game/src/inGameProvider/in_game_provider.dart';
import 'package:in_game/src/models/http_result.dart';

class InGameRepository {
  static final _provider = InGameProvider();

  static Future<HttpResult> registerApi(
    String password,
    String fullName,
    String phone,
    String conPassword,
  ) =>
      _provider.registerApi(
        password,
        fullName,
        phone,
        conPassword,
      );

  static Future<HttpResult> loginApi(
    String login,
    String password,
  ) =>
      _provider.loginApi(
        login,
        password,
      );

  static Future<HttpResult> getUserApi() => _provider.getUserApi();

  static Future<HttpResult> getClubApi() => _provider.getClub();

  static Future<HttpResult> getGameEndApi() => _provider.getGameEndApi();

  static Future<HttpResult> getPitchesApi() => _provider.getPitchesApi();
}
