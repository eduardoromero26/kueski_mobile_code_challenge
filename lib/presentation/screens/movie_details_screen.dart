import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:kueski_mobile_code_challenge/presentation/widgets/lotties/loading_lottie_view.dart';
import 'package:kueski_mobile_code_challenge/presentation/widgets/sliver_app_bar_movie_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kueski_mobile_code_challenge/theme/colors.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int selectedMovieId;
  const MovieDetailsScreen({super.key, required this.selectedMovieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsBloc>().add(ResetMovieDetails());
    context
        .read<MovieDetailsBloc>()
        .add(GetMovieDetailsById(widget.selectedMovieId));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return SizedBox.shrink();
            },
            loadingStarted: () {
              return Center(child: LoadingLottieView());
            },
            loadedSuccess: (selectedMovie) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBarMovieDetails(selectedMovie: selectedMovie),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 22,
                                  color: const Color.fromARGB(255, 228, 205, 4),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${selectedMovie.voteAverage.floor()/2}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 20,
                                  color: ColorsTheme.black,
                                ),
                                const SizedBox(width: 8),
                                Text(selectedMovie.releaseDate.toString().replaceAll('-', '/'),
                                    style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),
                        Text(
                          selectedMovie.title,
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          children: [
                            for (var genre in selectedMovie.genres)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                  backgroundColor: ColorsTheme.black,
                                  label: Text(genre.name,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)!.overview,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              selectedMovie.overview,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CachedNetworkImage(imageUrl: 'https://image.tmdb.org/t/p/original${selectedMovie.backdropPath}', fit: BoxFit.cover),
                      ],
                    ),
                  ))
                ],
              );
            },
            loadedFailed: (message) {
              return Center(
                child: Text(message),
              );
            },
          );
        },
      )),
    );
  }
}
