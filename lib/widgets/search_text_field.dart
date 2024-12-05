import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/movies_db_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesDBBloc = context.read<MoviesDBBloc>();
    return SliverPinnedHeader(
        child: Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<MoviesDBBloc, MoviesDBState>(
        builder: (context, state) {
          return TextField(
            controller: moviesDBBloc.searchFieldController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: 'Search for movies...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: moviesDBBloc.searchFieldController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        context
                            .read<MoviesDBBloc>()
                            .searchFieldController
                            .text = '';
                        moviesDBBloc.add(GetPopularMovies());
                      },
                    )
                  : null,
            ),
            onChanged: (value) {
              if (value.length >= 3) {
                context.read<MoviesDBBloc>().add((SearchMoviesByName(
                    searchQuery: moviesDBBloc.searchFieldController.text)));
              }
            },
            onSubmitted: (value) {
              context
                  .read<MoviesDBBloc>()
                  .add(SearchMoviesByName(searchQuery: value));
            },
          );
        },
      ),
    ));
  }
}
