import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:thamn/Data/data.dart';

import '../../../../../../Config/config.dart';

class StoreDetailsController extends GetxController {
  StoreX store = Get.arguments;
  List<FlyerX> flyers = [];
  List<String> imageUrls = [];
  RxBool isSharing = false.obs;

  getData() async {
    try {
      flyers = await DatabaseX.getAllByID(
          api: DBContactX.getFlyersByStore,
          fromJson: FlyerX.fromJson,
          id: store.id);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> shareTextAndImages() async {
    try {
      // النص الذي تريد مشاركته
      String text = "Check out these offers!";
      isSharing.value = true; // تحديث حالة المشاركة لتظهر المؤشر الدائري

      // قائمة الملفات التي ستتم مشاركتها
      List<String> filePaths = [];

      // قائمة URLs للصور
      imageUrls = [];

      for (FlyerX flyer in flyers) {
        if (imageUrls.length < 15) {
          imageUrls.add(flyer.image);
        }
      }

      // تحميل الصور من URLs وحفظها في التخزين المؤقت
      for (String url in imageUrls) {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final tempDir = await getTemporaryDirectory();
          final file =
              await File('${tempDir.path}/${url.split('/').last}').create();
          await file.writeAsBytes(response.bodyBytes);
          filePaths.add(file.path);
        } else {
          throw Exception('Failed to load image');
        }
      }

      // مشاركة النص والصور
      await Share.shareXFiles(filePaths.map((path) => XFile(path)).toList(),
          text: "Check out these offers!");

      isSharing.value = false;

    } catch (e) {
      print('Error: $e');
      isSharing.value = false;

    }
  }
}
