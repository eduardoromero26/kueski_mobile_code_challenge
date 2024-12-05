import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadingLottieView extends StatelessWidget {
  const LoadingLottieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('assets/lotties/progress_lottie.json',
              width: MediaQuery.of(context).size.width * 0.36),
          const SizedBox(height: 40),
          Text(
            AppLocalizations.of(context)!.loadingMovies,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
