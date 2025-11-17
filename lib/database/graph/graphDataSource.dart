import 'package:http/http.dart' as http;

class GraphRemoteDataSource {
  final http.Client client;

  GraphRemoteDataSource(this.client);

  Future<String> getMe(String accessToken) async {
    final url = Uri.parse("https://graph.microsoft.com/v1.0/me");

    final response = await client.get(
      url,
      headers: {
        "Authorization": "Bearer $accessToken",
      },
    );

    if (response.statusCode != 200) {
      throw Exception("Graph error: ${response.statusCode} ${response.body}");
    }

    return response.body;
  }
}
