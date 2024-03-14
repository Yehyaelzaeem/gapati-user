import 'package:cogina/presentation/modules/provider/auth/auth_cubit.dart';
import 'package:cogina/presentation/modules/provider/layout/provider_layout_cubit.dart';
import 'package:cogina/presentation/modules/provider/layout/screens/home/provider_home_cubit.dart';
import 'package:cogina/presentation/modules/user/layout/layout_cubit.dart';
import 'package:cogina/presentation/modules/user/layout/screens/home/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/injection.dart';

class GenerateMultiBloc extends StatelessWidget {
  final Widget child;

  const GenerateMultiBloc({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///TODO add bloc
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (_) => getIt<ProviderLayoutCubit>()),
        BlocProvider(create: (_) => getIt<ProviderHomeCubit>()),
        BlocProvider(create: (_) => getIt<AuthCubit>()),
        BlocProvider(create: (_) => getIt<LayoutCubit>()),
        BlocProvider(create: (_) => getIt<HomeCubit>()),

        // BlocProvider(create: (_) => getIt<OTPViewModel>()),
      ],
      child: child,
    );
  }
}
