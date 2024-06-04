import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Config/config.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../EmptyState/error.dart';
import '../controller/Controller.dart';

class TermsOfServiceView extends GetView<TermsOfServiceController> {
  const TermsOfServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: 'Terms Of Service',),
      body: FutureBuilder(
        future: controller.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: ErrorView(
                error: snapshot.error.toString(),
              ),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: StyleX.hPaddingApp, vertical: StyleX.vPaddingApp),
            child: TextX(controller.termsOfService),
          );
        },)
    );
  }
}
