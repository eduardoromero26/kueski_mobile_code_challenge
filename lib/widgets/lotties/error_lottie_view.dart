import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorLottieView extends StatelessWidget {
  final void Function() onRetry;
  final String? message;
  const ErrorLottieView({super.key, required this.onRetry, this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('assets/lotties/error_lottie.json',
              width: MediaQuery.of(context).size.width * 0.36),
          const SizedBox(height: 40),
          Text(
            message ?? AppLocalizations.of(context)!.anErrorOccurred,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(
              AppLocalizations.of(context)!.retry,
            ),
          ),
        ],
      ),
    );
  }
}
