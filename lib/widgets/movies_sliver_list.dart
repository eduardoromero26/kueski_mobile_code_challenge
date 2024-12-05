import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_model.dart';
import 'package:kueski_mobile_code_challenge/utils/route_screen_names.dart';
import 'package:kueski_mobile_code_challenge/widgets/lotties/error_lottie_view.dart';
import 'package:kueski_mobile_code_challenge/widgets/lotties/loading_lottie_view.dart';

class MoviesSliverList extends StatelessWidget {
  final PagingController<int, Movie> pagingController;

  const MoviesSliverList({super.key, required this.pagingController});

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      bottom: true,
      minimum: const EdgeInsets.only(bottom: 8.0),
      sliver: PagedSliverList<int, Movie>(
        pagingController: pagingController,
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
            return  Center(
              child: Text(AppLocalizations.of(context)!.noMoviesFound),
            );
          },
          firstPageProgressIndicatorBuilder: (context) =>
              Center(child: LoadingLottieView()),
          itemBuilder: (context, movie, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200],
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 8.0, right: 16.0),
                  title: Text(movie.title),
                  subtitle: Text(movie.releaseDate ?? ''),
                  leading: SizedBox(
                    width: 40,
                    child: Hero(
                      tag: movie.id,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/original${movie.posterPath}',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteScreenNames.details,
                      arguments: movie.id,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
