import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_model.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/localization/localization_cubit.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/movies/movies_db_bloc.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/theme/theme_cubit.dart';
import 'package:kueski_mobile_code_challenge/presentation/widgets/movies_sliver_list.dart';
import 'package:kueski_mobile_code_challenge/presentation/widgets/search_text_field.dart';
import 'package:kueski_mobile_code_challenge/theme/colors.dart';

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
      String searchFieldController =
          context.read<MoviesDbBloc>().searchFieldController.text;
      searchFieldController == ''
          ? context
              .read<MoviesDbBloc>()
              .add(GetPopularMovies(pageNumber: pageKey))
          : context.read<MoviesDbBloc>().add(SearchMoviesByName(
              pageNumber: pageKey,
              searchQuery:
                  context.read<MoviesDbBloc>().searchFieldController.text));
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = context.watch<ThemeCubit>().state;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsTheme.getBackgroundColor(isLightTheme),
        appBar: AppBar(
        backgroundColor: ColorsTheme.getBackgroundColor(isLightTheme),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: IconButton(
                icon: const Icon(Icons.account_circle_outlined),
                onPressed: () {},
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.language_outlined),
              onPressed: () {
                context.read<LocalizationCubit>().changeLocale(
                    context.read<LocalizationCubit>().state ==
                            const Locale('en')
                        ? const Locale('es')
                        : const Locale('en'));
                _pagingController.refresh();
              },
            ),
            IconButton(
              icon: Icon(Icons.sunny),
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SearchTextField(
              pagingController: _pagingController,
              isLightTheme: isLightTheme,
            ),
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
                  orElse: () {},
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
