
import 'package:delivego/core/routing/platform_page_route.dart';
import 'package:delivego/core/routing/undefined_route_screen.dart';
import 'package:flutter/cupertino.dart';
import '../../presentation/component/google_map/const_location_map.dart';
import '../../presentation/component/google_map/custom_google_map.dart';
import '../../presentation/modules/auth/forget_password/change_password/change_password.dart';
import '../../presentation/modules/auth/forget_password/forget_password_screen.dart';
import '../../presentation/modules/auth/log_as/log_as_screen.dart';
import '../../presentation/modules/auth/login/login_screen.dart';
import '../../presentation/modules/auth/register/register_screen.dart';
import '../../presentation/modules/auth/register/register_success_screen.dart';
import '../../presentation/modules/chats/presentation/chat_room.dart';
import '../../presentation/modules/chats/presentation/chats_screen.dart';
import '../../presentation/modules/intro/choose_user/choose_user_screen.dart';
import '../../presentation/modules/intro/on_boarding/on_boarding_screen.dart';
import '../../presentation/modules/intro/splash/splash_screen.dart';
import '../../presentation/modules/latest_sales/latest_sales_screen.dart';
import '../../presentation/modules/layout/layout_screen.dart';
import '../../presentation/modules/layout/screens/cart/cart_screen.dart';
import '../../presentation/modules/layout/screens/cart/check_out/chech_out_screen.dart';
import '../../presentation/modules/layout/screens/cart/order_success/order_success_screen.dart';
import '../../presentation/modules/layout/screens/home/categories/categories_screen.dart';
import '../../presentation/modules/layout/screens/home/home_screen.dart';
import '../../presentation/modules/layout/screens/home/meal/meal_details/meal_details_screen.dart';
import '../../presentation/modules/layout/screens/home/store/restaurant_screen.dart';
import '../../presentation/modules/layout/screens/more/about_us/about_us_screen.dart';
import '../../presentation/modules/layout/screens/more/address/add_address/add_address_screen.dart';
import '../../presentation/modules/layout/screens/more/address/addresses_screen.dart';
import '../../presentation/modules/layout/screens/more/privacy_policy/privacy_policy.dart';
import '../../presentation/modules/layout/screens/more/profile/change_password/change_password_screen.dart';
import '../../presentation/modules/layout/screens/more/profile/edit_profile/edit_profile_screen.dart';
import '../../presentation/modules/layout/screens/more/terms_conditions/terms_conditions.dart';
import '../../presentation/modules/layout/screens/orders/order_details_screen.dart';
import '../../presentation/modules/layout/screens/orders/orders_screen.dart';
import '../../presentation/modules/layout/screens/orders/rate/rate_screen.dart';
import '../../presentation/modules/map/map_order_screen.dart';
import '../../presentation/modules/notification/notification_screen.dart';
import '../../presentation/modules/offers/offers_screen.dart';
import '../../presentation/modules/prescription/get_all_prescription.dart';
import '../../presentation/modules/prescription/prescription.dart';
import '../../presentation/modules/restaurant/restaurants_screen.dart';
import '../../presentation/modules/search/search_screen.dart';
import 'routes.dart';

class RouteRestaurantsGenerator {
  static Route generateRestaurantsBaseRoute(RouteSettings settings) {
    Map? arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RoutesRestaurants.restaurantsHome:
        return platformPageRoute(const HomeScreen());
        case RoutesRestaurants.categoriesScreen:
        return platformPageRoute(const CategoriesScreen());
        case RoutesRestaurants.getAllPrescription:
        return platformPageRoute(const GetAllPrescription());
        case RoutesRestaurants.prescriptionScreen:
        return platformPageRoute( PrescriptionScreen(storeId: arguments?['storeId'], branchId:  arguments?['branchId'],));

      case RoutesRestaurants.orderMapScreen:
        return platformPageRoute( OrderMapScreen(orderId: arguments?['orderId'], orderTotal: arguments?['orderTotal'],));
      case RoutesRestaurants.layout:
        return platformPageRoute( LayoutScreen(
          currentPage: arguments?['currentPage'],
        ));
      case RoutesRestaurants.successOrderScreen:
        return platformPageRoute( OrderSuccessScreen());
        case RoutesRestaurants.ordersScreen:
        return platformPageRoute( OrdersScreen());
        case RoutesRestaurants.rateScreen:
        return platformPageRoute( RateScreen(orderId:  arguments?['orderId'],));
        case RoutesRestaurants.loginScreen:
        return platformPageRoute( const LoginScreen());

        case RoutesRestaurants.chatsScreen:
        return platformPageRoute(const ChatsScreen());
        case RoutesRestaurants.chatRoomScreen:
        return platformPageRoute( ChatRoomScreen(user: arguments?['user'],));
      case RoutesRestaurants.mealDetailsScreen:
        return platformPageRoute( MealDetailsScreen(

          storeId: arguments?['storeId'],
          count: arguments?['count'],itemExtraList: arguments?['itemExtraList'],

          storeName:arguments?['storeName'],
          categoriesItemsModelData:  arguments?['categoriesItemsModelData'], type:  arguments?['type'], ));
      case RoutesRestaurants.orderDetailsScreen:
        return platformPageRoute(OrderDetailsScreen(
          orderId: arguments?['orderId'],
          orderModelData: arguments?['orderModelData'], phone: arguments?['phone'], address:arguments?['address'],
        ));
      case RoutesRestaurants.splashScreen:
        return platformPageRoute(const SplashPage());
        case RoutesRestaurants.changePasswordScreen:
        return platformPageRoute( ChangePasswordScreen(phone: arguments?['phone'],));
        case RoutesRestaurants.forgetPasswordScreen:
        return platformPageRoute(const ForgetPasswordScreen());
        case RoutesRestaurants.onBoardingScreen:
        return platformPageRoute(const OnBoardingScreen());
      case RoutesRestaurants.restaurantScreen:
        return platformPageRoute( RestaurantScreen(id: arguments?['id'],image: arguments?['image'], storeName:arguments?['storeName'], inFav:  arguments?['isFav'],
            categoryId: arguments?['categoryId'],branchId: arguments?['branchId']));
      case RoutesRestaurants.cartScreen:
        return platformPageRoute(CartScreen(
          isLayOut: arguments?['isLayout'],
        ));
      case RoutesRestaurants.checkOut:
        return platformPageRoute(const CheckOutScreen());
        case RoutesRestaurants.logAsScreen:
        return platformPageRoute(const LogAsScreen());
      case RoutesRestaurants.editProfileScreen:
        return platformPageRoute(const EditProfileScreen());
        case RoutesRestaurants.addAddressScreen:
        return platformPageRoute(const AddAddressScreen());
        case RoutesRestaurants.customGoogleMapScreen:
        return platformPageRoute(  CustomGoogleMapScreen(lat: arguments?['lat'], long: arguments?['long'],));
       case RoutesRestaurants.constLocationMap:
        return platformPageRoute(  ConstLocationMap(lat: arguments?['lat'], long: arguments?['long'],));
      case RoutesRestaurants.addresses:
        return platformPageRoute(const AddressesScreen());
      case RoutesRestaurants.notification:
        return platformPageRoute(const NotificationScreen());
      // case RoutesRestaurants.restaurantsScreen:
      //   return platformPageRoute(const RestaurantsScreen());
     case RoutesRestaurants.latestSalesScreen:
        return platformPageRoute(const LatestSalesScreen());
     case RoutesRestaurants.offersScreen:
        return platformPageRoute(const OffersScreen());
     case RoutesRestaurants.searchScreen:
        return platformPageRoute(const SearchScreen());

        case RoutesRestaurants.aboutUsScreen:
        return platformPageRoute( const AboutUsScreen());
        case RoutesRestaurants.termsConditionScreen:
        return platformPageRoute( const TermsConditionScreen());
        case RoutesRestaurants.privacyPolicyScreen:
        return platformPageRoute( const PrivacyPolicyScreen());
        case RoutesRestaurants.registerScreen:
        return platformPageRoute(  RegisterScreen());
        case RoutesRestaurants.chooseUserScreen:
        return platformPageRoute(  const ChooseUserScreen());
        case RoutesRestaurants.registerSuccessScreen:
        return platformPageRoute(  const RegisterSuccessScreen());
      default:
        return platformPageRoute(const UndefinedRouteScreen());
    }
  }
}
