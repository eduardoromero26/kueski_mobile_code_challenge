import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_model.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/movies/movies_db_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchTextField extends StatelessWidget {
  final PagingController<int, Movie> pagingController;

  const SearchTextField({super.key, required this.pagingController});

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
              hintText: (AppLocalizations.of(context)!.searchForMovies),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: moviesDbBloc.searchFieldController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        context
                            .read<MoviesDbBloc>()
                            .searchFieldController
                            .clear();
                        moviesDbBloc.add(ResetSearchMovies());
                        pagingController.refresh();
                      },
                    )
                  : null,
            ),
            onChanged: (value) {
              if (value.length >= 3 &&
                  value == moviesDbBloc.searchFieldController.text) {
                pagingController.refresh();
              }
            },
            onSubmitted: (value) {
              pagingController.refresh();
            },
          );
        },
      ),
    ));
  }
}
