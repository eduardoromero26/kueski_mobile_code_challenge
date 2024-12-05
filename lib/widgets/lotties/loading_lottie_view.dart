import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadingLottieView extends StatelessWidget {
  const LoadingLottieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Lottie.asset('assets/lotties/progress_lottie.json',
            width: MediaQuery.of(context).size.width * 0.5),
        Text(
          AppLocalizations.of(context)!.loadingMovies,
        ),
      ],
    );
  }
}
