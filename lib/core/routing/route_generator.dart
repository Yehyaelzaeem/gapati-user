import 'package:cogina/core/routing/platform_page_route.dart';
import 'package:cogina/core/routing/undefined_route_screen.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import '../../presentation/modules/layout/layout_screen.dart';
import '../../presentation/modules/layout/screens/cart/cart_screen.dart';
import '../../presentation/modules/layout/screens/cart/chech_out.dart';
import '../../presentation/modules/layout/screens/cart/order_success_screen.dart';
import '../../presentation/modules/layout/screens/notification/notification_screen.dart';
import '../../presentation/modules/layout/screens/orders/order_details_screen.dart';
import '../../presentation/modules/layout/screens/profile/address_screen.dart';
import '../../presentation/modules/layout/screens/profile/edit_profile_screen.dart';
import '../../presentation/modules/layout/screens/restaurant/meal_details_screen.dart';
import '../../presentation/modules/layout/screens/restaurant/restautant_screen.dart';
import '../../presentation/modules/map/map_order_screen.dart';
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
        return platformPageRoute(const LayoutScreen(
          currentPage: 0,
        ));
      case RoutesRestaurants.successOrderScreen:
        return platformPageRoute(const OrderSuccessScreen());
      case RoutesRestaurants.mealDetailsScreen:
        return platformPageRoute(const MealDetailsScreen());
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
      default:
        return platformPageRoute(const UndefinedRouteScreen());
    }
  }
}
