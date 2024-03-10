import 'package:cogina/presentation/modules/layout/layout_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/injection.dart';
import 'presentation/modules/layout/screens/home/home_cubit.dart';

class GenerateMultiBloc extends StatelessWidget {
  final Widget child;

  const GenerateMultiBloc({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///TODO add bloc
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (_) => getIt<LayoutCubit>()),
        BlocProvider(create: (_) => getIt<HomeCubit>()),

        // BlocProvider(create: (_) => getIt<OTPViewModel>()),
      ],
      child: child,
    );
  }
}
