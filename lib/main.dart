import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kueski_mobile_code_challenge/presentation/bloc/movies_db_bloc.dart';
import 'package:kueski_mobile_code_challenge/presentation/screens/home_screen.dart';

void main()async  {
    await dotenv.load(fileName: "assets/env/.env.dev");
   runApp(
     BlocProvider(
      create: (context) => MoviesDBBloc(),
      child: const MyApp(),
    ),
   );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
