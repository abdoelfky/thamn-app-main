import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Config/config.dart';
import '../../UI/Widget/widget.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/images/empty.png')),
          const SizedBox(height: 20.0,),
          TextX('Empty',style: TextStyleX.supTitleLarge),
        ],
      ),
    );
  }
}
