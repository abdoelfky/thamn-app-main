part of data;

class FirebaseX {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static init() async {
    if(kIsWeb){
      await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "",
            authDomain: "",
            projectId: "",
            storageBucket: "",
            messagingSenderId: "",
            appId: "",
            measurementId: "",
        ),
      );
    }else {
      await Firebase.initializeApp();
    }
  }

  ///==========================================================================================
  /// Auth

  static Future logout() async {
    try {
      await _auth.signOut();
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
}
