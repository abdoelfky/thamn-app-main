library data;

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:thamn/Config/Translation/translation.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../Config/config.dart';
import '../Core/core.dart';
import 'package:http/http.dart' as http;

part 'Constant/enum.dart';
part 'Database/Config/DBName.dart';
part 'Database/Config/DBTableNames.dart';
part 'Database/database.dart';
part 'Database/firebase.dart';
part 'Local/Config/defaultData.dart';
part 'Local/Config/localNames.dart';
part 'Local/localData.dart';
part 'Local/Storage/hive.dart';
part 'Local/Storage/cookies.dart';
part 'Model/category.dart';
part 'Model/store.dart';
part 'Model/product.dart';
part 'Model/Basic/auth.dart';
part 'Model/Basic/notification.dart';
part 'Model/Basic/settings.dart';
part 'API/API.dart';
part 'Model/subcategory.dart';
part 'Model/user.dart';
part 'Model/order.dart';
part 'Model/autoComplete.dart';
part 'Model/participationOrder.dart';
part 'Model/flyer.dart';
part 'Database/Config/DBContact.dart';
part 'Model/flyerPage.dart';
part 'Model/vendor.dart';
part 'Model/searchHistory.dart';
part 'Model/basket.dart';
part 'Model/productBasket.dart';

class DataX {
  static init() async {
    await LocalDataX.initialize();
    await DatabaseX.initialize();
  }
}
