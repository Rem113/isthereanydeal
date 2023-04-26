import 'package:flutter/material.dart';
import 'package:isthereanydeal/api/search_games_response.dart';

class SearchGameCard extends StatelessWidget {
  final SearchGameResult game;

  const SearchGameCard(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2.0,
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.secondaryContainer,
          onTap: () {},
          child: SizedBox(
            height: 160.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: [
                          Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/640px-No-Image-Placeholder.svg.png",
                            // FIXME: Real URL
                            height: 160.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => {},
                                // FIXME: _showBigImage(context)
                                splashColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                          ),
                          child: Text(
                            game.title,
                            textAlign: TextAlign.start,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Expanded(
                        //       child: DurationWidget(
                        //         duration: game.mainStoryCompletionTime,
                        //         label: "Main",
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: DurationWidget(
                        //         duration: game.mainPlusExtraCompletionTime,
                        //         label: "Main + Extra",
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: DurationWidget(
                        //         duration: game.completionistCompletionTime,
                        //         label: "100%",
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
