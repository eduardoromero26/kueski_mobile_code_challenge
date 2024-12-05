import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_model.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/movies/movies_db_bloc.dart';
import 'package:kueski_mobile_code_challenge/widgets/movies_sliver_list.dart';
import 'package:kueski_mobile_code_challenge/widgets/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      context.read<MoviesDbBloc>().add(GetPopularMovies(pageNumber: pageKey));
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pagingController.refresh();
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SearchTextField(),
            BlocConsumer<MoviesDbBloc, MoviesDBState>(
              listener: (context, state) {
                state.maybeWhen(
                  loadedSuccess: (movies) {
                    final isLastPage = movies.page >= movies.totalPages;
                    if (isLastPage) {
                      _pagingController.appendLastPage(movies.results);
                    } else {
                      final nextPageKey = movies.page + 1;
                      _pagingController.appendPage(movies.results, nextPageKey);
                    }
                  },
                  loadedFailed: (message) {
                    _pagingController.error = message;
                  },
                  orElse: () {
                  },
                );
              },
              builder: (context, state) {
                return MoviesSliverList(pagingController: _pagingController);
              },
            ),
          ],
        ),
      ),
    );
  }
}
