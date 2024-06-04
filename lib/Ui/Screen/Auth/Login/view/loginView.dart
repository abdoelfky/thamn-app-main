import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../Widget/widget.dart';
import '../controller/loginController.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 80.0,
            bottom: 80.0,
            left: StyleX.hPaddingApp,
            right: StyleX.hPaddingApp,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(width: double.infinity,),
                  Image.asset(context.isDarkMode?ImageX.logoWhite:ImageX.logoColor,height: 50,),
                   const SizedBox(height: 30,),
                  TextX('Welcome to the world of discounts', style: TextStyleX.titleLarge,color: ColorX.greyDark,textAlign: TextAlign.center),
                ],
              ),
               Obx(() {
                 if(controller.isLoading.isTrue){
                   return const CircularProgressIndicator();
                 }else{
                   return Column(
                     children: [
                       SocialMediaLogCardX(title: 'Facebook', icon: IconX.facebook, onTap: controller.facebook),
                       SocialMediaLogCardX(title: 'Twitter', icon: IconX.twitter, onTap: controller.twitter),
                       SocialMediaLogCardX(title: 'Google', icon: IconX.google,onTap: controller.google),
                       // if(Platform.isIOS)
                       SocialMediaLogCardX(title: 'Apple', icon: IconX.apple, onTap: controller.apple),
                     ],
                   );
                 }
               }),
              // Column(
              //   children: [
              //     TextX(
              //       "don't have account?",
              //       style: TextStyleX.supTitleMedium,
              //     ),
              //     TextButton(
              //       onPressed: () => Get.toNamed(RouteNameX.signUp),
              //       child: const TextX('New Account'),
              //     ),
              //   ],
              // ),
              const LanguageButtonX()
            ],
          ),
        ),
      ),
    );
  }
}
