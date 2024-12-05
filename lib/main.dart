import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kueski_mobile_code_challenge/data/repositories/movies_repository.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/localization/localization_cubit.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/movies/movies_db_bloc.dart';
import 'package:kueski_mobile_code_challenge/routes/route_generator.dart';
import 'package:kueski_mobile_code_challenge/theme/colors.dart';
import 'package:kueski_mobile_code_challenge/utils/route_screen_names.dart';

void main() async {
  await dotenv.load(fileName: "assets/env/.env.dev");
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalizationCubit()),
        BlocProvider<MoviesDbBloc>(
          create: (context) =>
              MoviesDbBloc(moviesRepository: MoviesRepository()),
        ),
        BlocProvider<MovieDetailsBloc>(
          create: (context) => MovieDetailsBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => LocalizationCubit(),
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
                title: 'Movies App',
                debugShowCheckedModeBanner: false,
                locale: locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: ColorsTheme.black, primary: ColorsTheme.deepBlue, ),
                  useMaterial3: true,
                ),
                initialRoute: RouteScreenNames.home,
                onGenerateRoute: RouteGenerator.generateRoute,
              );
        },
      ),
    );
  }
}
