import 'package:cogina/core/routing/platform_page_route.dart';
import 'package:cogina/core/routing/undefined_route_screen.dart';
import 'package:flutter/cupertino.dart';
import '../../presentation/modules/intro/choose_user/choose_user_screen.dart';
import '../../presentation/modules/provider/auth/auth_screen.dart';
import '../../presentation/modules/provider/elements/elements_screen.dart';
import '../../presentation/modules/provider/layout/provider_layout_screen.dart';
import '../../presentation/modules/provider/layout/screens/profile/edit_profile/change_password_screen.dart';
import '../../presentation/modules/provider/layout/screens/profile/edit_profile/edit_profile_screen.dart';
import '../../presentation/modules/provider/orders/provider_orders_screen.dart';
import '../../presentation/modules/user/auth/login/login_screen.dart';
import '../../presentation/modules/user/auth/register/register_screen.dart';
import '../../presentation/modules/user/auth/register/register_success_screen.dart';
import '../../presentation/modules/user/latest_sales/latest_sales_screen.dart';
import '../../presentation/modules/user/layout/layout_screen.dart';
import '../../presentation/modules/user/layout/screens/cart/cart_screen.dart';
import '../../presentation/modules/user/layout/screens/cart/chech_out.dart';
import '../../presentation/modules/user/layout/screens/cart/order_success_screen.dart';
import '../../presentation/modules/user/layout/screens/home/home_screen.dart';
import '../../presentation/modules/user/layout/screens/home/meal/add_meal_screen.dart';
import '../../presentation/modules/user/layout/screens/orders/order_details_screen.dart';
import '../../presentation/modules/user/layout/screens/profile/about_us/about_us_screen.dart';
import '../../presentation/modules/user/layout/screens/profile/address/address_screen.dart';
import '../../presentation/modules/user/layout/screens/profile/edit_profile/change_password_screen.dart';
import '../../presentation/modules/user/layout/screens/profile/edit_profile/edit_profile_screen.dart';
import '../../presentation/modules/user/layout/screens/profile/privacy_policy/privacy_policy.dart';
import '../../presentation/modules/user/layout/screens/profile/terms_conditions/terms_conditions.dart';
import '../../presentation/modules/user/map/map_order_screen.dart';
import '../../presentation/modules/user/notification/notification_screen.dart';
import '../../presentation/modules/user/offers/offers_screen.dart';
import '../../presentation/modules/user/restaurant/meal_details/meal_details_screen.dart';
import '../../presentation/modules/user/restaurant/restaurant/restaurant_screen.dart';
import '../../presentation/modules/user/restaurant/restaurants_screen.dart';
import '../../presentation/modules/user/search/search_screen.dart';
import 'routes.dart';

class RouteRestaurantsGenerator {
  static Route generateRestaurantsBaseRoute(RouteSettings settings) {
    Map? arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RoutesRestaurants.restaurantsHome:
        return platformPageRoute(const HomeScreen());
      case RoutesRestaurants.restaurant:
        return platformPageRoute(const RestaurantScreen());
      case RoutesRestaurants.orderMapScreen:
        return platformPageRoute(const OrderMapScreen());
      case RoutesRestaurants.layout:
        return platformPageRoute( LayoutScreen(
          currentPage: arguments?['currentPage'],
        ));
      case RoutesRestaurants.successOrderScreen:
        return platformPageRoute(const OrderSuccessScreen());
        case RoutesRestaurants.loginScreen:
        return platformPageRoute( LoginScreen());
        case RoutesRestaurants.addMealScreen:
        return platformPageRoute(const AddMealScreen());
      case RoutesRestaurants.mealDetailsScreen:
        return platformPageRoute( MealDetailsScreen());
      case RoutesRestaurants.orderDetailsScreen:
        return platformPageRoute(OrderDetailsScreen());
      case RoutesRestaurants.restaurantScreen:
        return platformPageRoute(const RestaurantScreen());
      case RoutesRestaurants.cartScreen:
        return platformPageRoute(CartScreen(
          isLayOut: arguments?['isLayout'],
        ));
      case RoutesRestaurants.checkOut:
        return platformPageRoute(const CheckOutScreen());
      case RoutesRestaurants.editProfileScreen:
        return platformPageRoute(const EditProfileScreen());
      case RoutesRestaurants.address:
        return platformPageRoute(const AddressScreen());
      case RoutesRestaurants.notification:
        return platformPageRoute(const NotificationScreen());
      case RoutesRestaurants.restaurantsScreen:
        return platformPageRoute(const RestaurantsScreen());
     case RoutesRestaurants.latestSalesScreen:
        return platformPageRoute(const LatestSalesScreen());
     case RoutesRestaurants.offersScreen:
        return platformPageRoute(const OffersScreen());
     case RoutesRestaurants.searchScreen:
        return platformPageRoute(const SearchScreen());
        case RoutesRestaurants.changePasswordScreen:
        return platformPageRoute( ChangePasswordScreen());
        case RoutesRestaurants.aboutUsScreen:
        return platformPageRoute( const AboutUsScreen());
        case RoutesRestaurants.termsConditionScreen:
        return platformPageRoute( const TermsConditionScreen());
        case RoutesRestaurants.privacyPolicyScreen:
        return platformPageRoute( const PrivacyPolicyScreen());
        case RoutesRestaurants.registerScreen:
        return platformPageRoute(  RegisterScreen());
        case RoutesRestaurants.authScreen:
        return platformPageRoute(  const AuthScreen());
        case RoutesRestaurants.chooseUserScreen:
        return platformPageRoute(  const ChooseUserScreen());
        case RoutesRestaurants.changeProfilePasswordScreen:
        return platformPageRoute(   ChangeProfilePasswordScreen());
      case RoutesRestaurants.elementsScreen:
        return platformPageRoute(   ElementsScreen());
        case RoutesRestaurants.providerOrdersScreen:
        return platformPageRoute(   ProviderOrdersScreen());
        case RoutesRestaurants.editProviderProfileScreen:
        return platformPageRoute(  const EditProviderProfileScreen());
        case RoutesRestaurants.providerLayoutScreen:
        return platformPageRoute(   ProviderLayoutScreen(
          currentPage: arguments?['currentPage'],));
        case RoutesRestaurants.registerSuccessScreen:
        return platformPageRoute(  const RegisterSuccessScreen());
      default:
        return platformPageRoute(const UndefinedRouteScreen());
    }
  }
}
