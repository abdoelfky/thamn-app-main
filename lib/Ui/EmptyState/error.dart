import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../Config/config.dart';
import '../Widget/widget.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({this.error, Key? key}) : super(key: key);
  final String? error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Iconsax.forbidden_2,color: ColorX.danger,size: 100.0,),
            TextX('${titleError(error ?? 'Error')}'.tr,style: TextStyleX.titleMedium.copyWith(color: ColorX.danger),textAlign: TextAlign.center,)
          ],
      ),
    );
  }
}

titleError(val){
  switch (val){
    case '[cloud_firestore/unavailable] Failed to get document because the client is offline.':
      return 'there is no Internet';
    default:
      return val;
  }
}