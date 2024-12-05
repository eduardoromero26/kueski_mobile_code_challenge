import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_model.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/movies/movies_db_bloc.dart';
import 'package:kueski_mobile_code_challenge/widgets/lotties/empty_search_lottie_view.dart';
import 'package:kueski_mobile_code_challenge/widgets/lotties/error_lottie_view.dart';
import 'package:kueski_mobile_code_challenge/widgets/lotties/loading_lottie_view.dart';
import 'package:kueski_mobile_code_challenge/widgets/movies_sliver_list.dart';
import 'package:kueski_mobile_code_challenge/widgets/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<MoviesDbBloc>().add(GetPopularMovies());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<MoviesDbBloc>().add(GetPopularMovies());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: <Widget>[
          const SearchTextField(),
          BlocBuilder<MoviesDbBloc, MoviesDBState>(
            builder: (context, state) {
              return state.when(initial: () {
                return const LoadingLottieView();
              }, loadingStarted: () {
                return const LoadingLottieView();
              }, loadedSuccess: (MovieResponse movies) {
                return movies.results.isNotEmpty
                    ? MoviesSliverList(
                        movies: movies,
                      )
                    : EmptySearchLottieView(
                        query: context
                            .read<MoviesDbBloc>()
                            .searchFieldController
                            .text,
                      );
              }, loadedFailed: (String message) {
                return ErrorLottieView(
                  onRetry: () {},
                  message: message,
                );
              });
            },
          ),
        ],
      )),
    );
  }
}
