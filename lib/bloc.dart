
import 'package:cogina/presentation/modules/auth/login/login_cubit.dart';
import 'package:cogina/presentation/modules/auth/register/register_cubit.dart';
import 'package:cogina/presentation/modules/layout/layout_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/check_out/check_out_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/favorite/favorite_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/more/address/address_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/more/more_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/more/profile/profile_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/orders/orders_cubit.dart';
import 'package:cogina/presentation/modules/restaurant/restaurant_cubit.dart';
import 'package:cogina/presentation/modules/search/search_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/injection.dart';
import 'domain/provider/local_auth_provider_cubit.dart';

class GenerateMultiBloc extends StatelessWidget {
  final Widget child;

  const GenerateMultiBloc({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///TODO add bloc
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<LocalAuthCubit>()),
        BlocProvider(create: (_) => getIt<LayoutCubit>()),
        BlocProvider(create: (_) => getIt<HomeCubit>()),
        BlocProvider(create: (_) => getIt<LoginCubit>()),
        BlocProvider(create: (_) => getIt<RegisterCubit>()),
        BlocProvider(create: (_) => getIt<ProfileCubit>()),
        BlocProvider(create: (_) => getIt<RestaurantCubit>()),
        BlocProvider(create: (_) => getIt<CartCubit>()),
        BlocProvider(create: (_) => getIt<CheckOutCubit>()),
        BlocProvider(create: (_) => getIt<OrdersCubit>()),
        BlocProvider(create: (_) => getIt<AddressCubit>()),
        BlocProvider(create: (_) => getIt<MoreCubit>()),
        BlocProvider(create: (_) => getIt<FavoriteCubit>()),
        BlocProvider(create: (_) => getIt<SearchCubit>()),
      ],
      child: child,
    );
  }
}
