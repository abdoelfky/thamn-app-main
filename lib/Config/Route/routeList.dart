import 'package:get/get.dart';
import '../../Ui/Screen/Basic/About/CallUs/view/View.dart';
import '../../Ui/Screen/Basic/About/PrivacyPolicy/controller/Controller.dart';
import '../../Ui/Screen/Basic/About/PrivacyPolicy/view/View.dart';
import '../../Ui/Screen/Basic/About/TermsOfService/controller/Controller.dart';
import '../../Ui/Screen/Basic/About/TermsOfService/view/View.dart';
import '../../Ui/Screen/Basic/SideMenu/controller/Controller.dart';
import '../../Ui/Screen/Screen/Basket/ActiveBasket/controller/Controller.dart';
import '../../Ui/Screen/Screen/Basket/ActiveBasket/view/View.dart';
import '../../Ui/Screen/Screen/Basket/SavedBasketDetails/controller/Controller.dart';
import '../../Ui/Screen/Screen/Basket/SavedBasketDetails/view/View.dart';
import '../../Ui/Screen/Screen/Basket/SavedBaskets/controller/Controller.dart';
import '../../Ui/Screen/Screen/Basket/SavedBaskets/view/View.dart';
import '../../Ui/Screen/Screen/Root/Home/controller/Controller.dart';
import '../../Ui/Screen/Screen/Root/Root/controller/Controller.dart';
import '../../Ui/Screen/Screen/Root/Root/view/View.dart';
import '../../Ui/Screen/Screen/Store/StoreDetails/controller/Controller.dart';
import '../../Ui/Screen/Screen/Store/StoreDetails/view/View.dart';
import '../../Ui/Screen/Screen/Store/StoresSelection/controller/Controller.dart';
import '../../Ui/Screen/Screen/Store/StoresSelection/view/View.dart';
import '../../Ui/Screen/Screen/Store/FlyerDetails/controller/Controller.dart';
import '../../Ui/Screen/Screen/Store/FlyerDetails/view/View.dart';
import '../../Ui/Screen/Screen/Order/CompletedOrders/controller/Controller.dart';
import '../../Ui/Screen/Screen/Order/CompletedOrders/view/View.dart';
import '../../Ui/Screen/Screen/Order/OrderDetails/controller/Controller.dart';
import '../../Ui/Screen/Screen/Order/OrderDetails/view/View.dart';
import '../../Ui/Screen/Screen/Order/OrderTracking/controller/Controller.dart';
import '../../Ui/Screen/Screen/Order/OrderTracking/view/View.dart';
import '../../Ui/Screen/Screen/Order/ParticipationOrders/controller/Controller.dart';
import '../../Ui/Screen/Screen/Order/ParticipationOrders/view/View.dart';
import '../../Ui/Screen/Screen/Product/ProductDetails/controller/Controller.dart';
import '../../Ui/Screen/Screen/Product/ProductDetails/view/View.dart';
import '../../Ui/Screen/Screen/Root/Profile/EditProfile/controller/Controller.dart';
import '../../Ui/Screen/Screen/Root/Profile/EditProfile/view/View.dart';
import '../../Ui/Screen/Screen/Root/Profile/Profile/controller/Controller.dart';
import '../../Ui/Screen/Screen/Root/Profile/Profile/view/View.dart';
import '../../Ui/Screen/Screen/Search/ResearchResults/controller/Controller.dart';
import '../../Ui/Screen/Screen/Search/ResearchResults/view/View.dart';
import '../../Ui/Screen/Screen/Search/Searching/controller/Controller.dart';
import '../../Ui/Screen/Screen/Search/Searching/view/View.dart';
import '../../Ui/Screen/Screen/SetLocation/controller/setLocationController.dart';
import '../../Ui/Screen/Screen/SetLocation/view/setLocationView.dart';
import '../config.dart';
import '../../../Ui/Screen/Basic/Settings/controller/Controller.dart';
import '../../../Ui/Screen/Basic/Settings/view/View.dart';
import '../../UI/Screen/Auth/Login/controller/loginController.dart';
import '../../UI/Screen/Auth/Login/view/loginView.dart';

class RouteListX {
  ///list routes
  static final List<GetPage<dynamic>> routes = [
    GetPage(
        name: RouteNameX.root,
        page: () => RootView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => RootController());
          Get.lazyPut(() => HomeController(),
            fenix: true);
          Get.lazyPut(() => ProfileController(),
            fenix: true);
          Get.lazyPut(() => ActiveBasketController(),
              fenix: true);
          Get.lazyPut(() => SideMenuController(),
              fenix: true);
        })),

    ///Auth
    GetPage(
        name: RouteNameX.login,
        page: () => const LoginView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => LoginController());
        })),
    GetPage(
        name: RouteNameX.settings,
        page: () => const SettingsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SettingsController(),
            fenix: true,
          );
        })),
    GetPage(
        name: RouteNameX.callUs,
        page: () =>  CallUsView(),
       ),
    GetPage(
        name: RouteNameX.termsOfService,
        page: () => const TermsOfServiceView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => TermsOfServiceController());
        })),
    GetPage(
        name: RouteNameX.privacyPolicy,
        page: () => const PrivacyPolicyView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => PrivacyPolicyController());
        })),
    GetPage(
        name: RouteNameX.setLocation,
        page: () => const SetLocationView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => SetLocationController());
        })),
    GetPage(
        name: RouteNameX.activeBasket,
        page: () => const ActiveBasketView(),
       ),
    GetPage(
        name: RouteNameX.storeDetails,
        page: () => const StoreDetailsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => StoreDetailsController());
        })),
    GetPage(
        name: RouteNameX.flyerDetails,
        page: () => const FlyerDetailsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => FlyerDetailsController());
        })),
    GetPage(
        name: RouteNameX.storesSelection,
        page: () => const StoresSelectionView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => StoresSelectionController());
        })),




    GetPage(
        name: RouteNameX.savedBasketDetails,
        page: () => const SavedBasketDetailsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => SavedBasketDetailsController());
        })),
    GetPage(
        name: RouteNameX.savedBaskets,
        page: () => const SavedBasketsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => SavedBasketsController());
        })),
    GetPage(
        name: RouteNameX.completedOrders,
        page: () => const CompletedOrdersView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => CompletedOrdersController());
        })),

    GetPage(
        name: RouteNameX.orderDetails,
        page: () => const OrderDetailsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => OrderDetailsController());
        })),
    GetPage(
        name: RouteNameX.orderTracking,
        page: () => const OrderTrackingView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => OrderTrackingController());
        })),
    GetPage(
        name: RouteNameX.participationOrders,
        page: () => const ParticipationOrdersView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => ParticipationOrdersController());
        })),
    GetPage(
        name: RouteNameX.productDetails,
        page: () => const ProductDetailsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => ProductDetailsController());
        })),
    GetPage(
        name: RouteNameX.profile,
        page: () => const ProfileView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => ProfileController());
        })),
    GetPage(
        name: RouteNameX.editProfile,
        page: () => const EditProfileView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => EditProfileController());
        })),
    GetPage(
        name: RouteNameX.researchResults,
        page: () => const ResearchResultsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => ResearchResultsController());
        })),
    GetPage(
        name: RouteNameX.searching,
        page: () => const SearchingView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => SearchingController());
        })),

    // GetPage(
    //     name: RouteNameX.,
    //     page: () => const View(),
    //     binding: BindingsBuilder(() {
    //       Get.lazyPut(
    //               () => Controller());
    //     })),
  ];
}
