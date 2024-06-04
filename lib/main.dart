import 'dart:io';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Config/Route/routeList.dart';
import 'Config/Translation/translation.dart';
import 'Config/config.dart';
import 'Core/core.dart';
import 'Data/data.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 10 ));

  HttpOverrides.global = MyHttpOverrides();
  await ConfigX.init();
  await DataX.init();
  await CoreX.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      ///remove mark debug
      debugShowCheckedModeBanner: false,

      ///initial Binding App Controller
      initialBinding: BindingsBuilder(() {
        Get.put<AppControllerX>(
          AppControllerX(),
          permanent: true,
        );
      }),

      ///routes
      getPages: RouteListX.routes,
      initialRoute: LocalDataX.route,

      ///Settings GetX
      smartManagement: SmartManagement.full,
      useInheritedMediaQuery: true,

      /// app name with translate
      title: InfoX.nameApp.tr,

      ///translate app
      translations: TranslationX(),
      locale: TranslationX.getLocale,
      fallbackLocale: TranslationX.fallbackLocale,

      ///theme
      themeMode: ThemeX.getTheme,
      theme: ThemeX.light,
      darkTheme: ThemeX.dark,
    );
  }
}