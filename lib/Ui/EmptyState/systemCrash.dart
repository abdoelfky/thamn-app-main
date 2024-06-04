import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Config/config.dart';
import '../Widget/widget.dart';

class SystemCrashView extends StatelessWidget {
  const SystemCrashView({required this.error, Key? key}) : super(key: key);
  final FlutterErrorDetails error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            // Image.asset(
            //     'assets/images/error_illustration.png',
            // ),
            TextX(
              kDebugMode
                  ? error.summary.toString()
                  : 'Oups! Something went wrong!',
              textAlign: TextAlign.center,
              color: kDebugMode ? Colors.red : Colors.black,
              style: TextStyleX.titleLarge,
            ),
            const SizedBox(height: 12),
            if (kDebugMode)
              const TextX(
                "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
