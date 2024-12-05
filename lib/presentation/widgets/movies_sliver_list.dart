import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_model.dart';
import 'package:kueski_mobile_code_challenge/theme/colors.dart';
import 'package:kueski_mobile_code_challenge/utils/route_screen_names.dart';
import 'package:kueski_mobile_code_challenge/presentation/widgets/lotties/empty_search_lottie_view.dart';
import 'package:kueski_mobile_code_challenge/presentation/widgets/lotties/error_lottie_view.dart';
import 'package:kueski_mobile_code_challenge/presentation/widgets/lotties/loading_lottie_view.dart';

class MoviesSliverList extends StatelessWidget {
  final PagingController<int, Movie> pagingController;

  const MoviesSliverList({super.key, required this.pagingController});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(12.0),
      sliver: PagedSliverGrid<int, Movie>(
        pagingController: pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.54,
        ),
        addAutomaticKeepAlives: true,
        builderDelegate: PagedChildBuilderDelegate<Movie>(
          firstPageErrorIndicatorBuilder: (context) {
            return Center(
              child: ErrorLottieView(onRetry: () {
                pagingController.refresh();
              }),
            );
          },
          noItemsFoundIndicatorBuilder: (context) {
            return Center(child: EmptySearchLottieView());
          },
          firstPageProgressIndicatorBuilder: (context) =>
              Center(child: LoadingLottieView()),
          itemBuilder: (context, movie, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: ColorsTheme.black.withOpacity(0.16),
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 1,
                shadowColor: Colors.white70,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteScreenNames.details,
                      arguments: movie.id,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/original${movie.posterPath}',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          width: double.infinity,
                          height: 280,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorsTheme.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
