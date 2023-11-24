import 'package:http/http.dart' as http;
import 'package:podipu/common/secrets/my_secret.dart';
import 'package:podipu/shared/consts/exception.dart';

class HttpUtil {
  static Future get({required String url}) async {
    try {
      final res = await http.get(
        Uri.parse(url),
        headers: {
          'X-ListenAPI-Key': MySecret.listenNotesApiKey,
        },
      );

      switch (res.statusCode) {
        case 200:
          return res;
        case 400:
          throw const ClientException();
        case 429:
          throw const RequestLimitException();
        default:
          throw const ServerException();
      }
    } catch (_) {
      throw const ServerException();
    }
  }

  static Future<bool> post({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {
          'X-ListenAPI-Key': MySecret.listenNotesApiKey,
        },
        body: body,
      );

      switch (res.statusCode) {
        case 200:
          return true;
        case 400:
          throw const ClientException();
        case 429:
          throw const RequestLimitException();
        default:
          throw const ServerException();
      }
    } catch (_) {
      throw const ServerException();
    }
  }
}
