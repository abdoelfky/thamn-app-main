import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thamn/Config/config.dart';

class SharingLottie extends StatelessWidget {
  const SharingLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: Center(child: Lottie.asset(JsonX.sharing)),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          "جاري التحضير لمشاركة العروض",
          style: TextStyleX.titleLarge,

        ),
      ],
    );
  }
}
