import 'package:cogina/core/routing/platform_page_route.dart';
import 'package:cogina/core/routing/undefined_route_screen.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import '../../presentation/modules/layout/screens/cart/chech_out.dart';
import '../../presentation/modules/layout/screens/cart/order_success_screen.dart';
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

        case RoutesRestaurants.successOrderScreen:
        return platformPageRoute(const OrderSuccessScreen());

        case RoutesRestaurants.checkOut:
        return platformPageRoute(const CheckOutScreen());
      default:return platformPageRoute(const UndefinedRouteScreen());


    }
  }
}
