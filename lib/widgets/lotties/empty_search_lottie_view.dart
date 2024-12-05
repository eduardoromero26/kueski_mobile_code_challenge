import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptySearchLottieView extends StatelessWidget {
  final String query;
  const EmptySearchLottieView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Lottie.asset('assets/lotties/not_found_lottie.json',
            width: MediaQuery.of(context).size.width * 0.5),
        const SizedBox(height: 40),
        Text(
          'Movie not founded: $query',
        ),
      ],
    ));
  }
}