import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:kueski_mobile_code_challenge/widgets/sliver_app_bar_movie_details.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int selectedMovieId;
  const MovieDetailsScreen({super.key, required this.selectedMovieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    context.read<MovieDetailsBloc>().add(GetMovieDetailsById(
          widget.selectedMovieId,
        ));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<MovieDetailsBloc>().add(GetMovieDetailsById(
          widget.selectedMovieId,
        ));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loadingStarted: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
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
                        const SizedBox(height: 20),
                        Text(
                          selectedMovie.title,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectedMovie.releaseDate.toString()),
                            Text(
                              '${selectedMovie.voteAverage} / 10',
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 16),
                        const Text(
                          'Overview',
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              selectedMovie.overview,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 16),
                        const Text(
                          'Genres',
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          children: [
                            for (var genre in selectedMovie.genres)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                  label: Text(genre.name),
                                ),
                              ),
                          ],
                        ),
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