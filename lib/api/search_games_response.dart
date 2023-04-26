class SearchGamesResponse {
  final List<SearchGameResult> games;

  SearchGamesResponse.fromJson(Map<String, dynamic> json)
      : games = json["data"]["results"]
            .map((game) => SearchGameResult.fromJson(game))
            .toList()
            .cast<SearchGameResult>();
}

class SearchGameResult {
  final int id;
  final String plain;
  final String title;

  SearchGameResult.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        plain = json['plain'],
        title = json['title'];
}
