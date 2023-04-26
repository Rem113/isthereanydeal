import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:isthereanydeal/api/itad.dart';
import 'package:isthereanydeal/api/search_games_response.dart';
import 'package:isthereanydeal/presentation/components/search_game_card.dart';

class SearchResultsScreenArgs {
  final String query;

  SearchResultsScreenArgs(this.query);
}

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final PagingController<int, SearchGameResult> _pagingController =
      PagingController(firstPageKey: 1);
  late SearchResultsScreenArgs args;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    args =
        ModalRoute.of(context)!.settings.arguments as SearchResultsScreenArgs;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results for \"${args.query}\""),
      ),
      body: PagedListView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<SearchGameResult>(
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: Text("No games found for \"${args.query}\""),
          ),
          itemBuilder: (context, game, index) => SearchGameCard(
            game,
            key: Key(game.id.toString()),
          ),
        ),
      ),
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    final response = await ITAD.search(args.query);
    _pagingController.appendLastPage(response.games);
  }
}
