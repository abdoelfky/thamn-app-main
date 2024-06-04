part of core;

class CatchErrorX{
  static console(error){
    FlutterError.reportError(FlutterErrorDetails(exception: error,library: 'Saker Dakak'));
  }

  static systemCrash(){
    ErrorWidget.builder=(FlutterErrorDetails error){
      return SystemCrashView(error: error);
    };
  }
}