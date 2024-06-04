part of data;

class HiveX {
  static late Box box;
  static const String _boxName='app';

  static initialize()async{
    if(!kIsWeb){
      Directory path = await getApplicationDocumentsDirectory();
      Hive.init(path.path);
      box=await Hive.openBox(_boxName);
    }
  }

  static put({required var val, required String kay}) {
    Hive.box(_boxName).put(kay, val);
  }
  static get(String kay, {var defaultValue})
  =>box.get(kay,defaultValue: defaultValue??[]);

  static remove(String kay){
    Hive.box(_boxName).delete(kay);
  }
}
