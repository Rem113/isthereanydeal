import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:isthereanydeal/api/search_games_response.dart';

class ITAD {
  static Future<SearchGamesResponse> search(String query) async {
    final url = Uri.https("api.isthereanydeal.com", "v02/search/search", {
      'key': dotenv.env["API_KEY"],
      'q': query,
    });
    final response = await post(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.value,
      },
    );

    final body = jsonDecode(response.body);
    return SearchGamesResponse.fromJson(body);
  }
}
