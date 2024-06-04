import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyC0fUYASQXlqfp1d5EFSIT7_0lg0_OIxq0")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
//     func application(
//         _ app: UIApplication,
//         open url: URL,
//         options: [UIApplication.OpenURLOptionsKey : Any] = [:]
//     ) -> Bool {
//         ApplicationDelegate.shared.application(
//             app,
//             open: url,
//             sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
//             annotation: options[UIApplication.OpenURLOptionsKey.annotation]
//         )
//     }
}
