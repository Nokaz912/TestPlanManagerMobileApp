import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/config/app_config.dart';

class AuthRemoteDataSource {
  Future<String> exchangeCode({
    required String code,
    required String verifier,
  }) async {
    final url =
        "https://login.microsoftonline.com/${AuthConfig.tenantId}/oauth2/v2.0/token";

    final res = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "client_id": AuthConfig.clientId,
        "grant_type": "authorization_code",
        "code": code,
        "redirect_uri": AuthConfig.redirectUri,
        "code_verifier": verifier,
      },
    );

    final data = jsonDecode(res.body);

    if (data["access_token"] == null) {
      throw Exception("Token error: ${data["error_description"]}");
    }

    return data["access_token"];
  }
}
