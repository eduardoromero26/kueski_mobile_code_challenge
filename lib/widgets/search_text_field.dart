import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/movies/movies_db_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesDbBloc = context.read<MoviesDbBloc>();
    return SliverPinnedHeader(
        child: Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<MoviesDbBloc, MoviesDBState>(
        builder: (context, state) {
          return TextField(
            controller: moviesDbBloc.searchFieldController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: 'Search for movies...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: moviesDbBloc.searchFieldController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        context
                            .read<MoviesDbBloc>()
                            .searchFieldController
                            .text = '';
                        moviesDbBloc.add(GetPopularMovies());
                      },
                    )
                  : null,
            ),
            onChanged: (value) {
              if (value.length >= 3) {
                context.read<MoviesDbBloc>().add((SearchMoviesByName(
                    searchQuery: moviesDbBloc.searchFieldController.text)));
              }
            },
            onSubmitted: (value) {
              context
                  .read<MoviesDbBloc>()
                  .add(SearchMoviesByName(searchQuery: value));
            },
          );
        },
      ),
    ));
  }
}
