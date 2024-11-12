
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/assets_constant/images.dart';
import '../../../../core/routing/navigation_services.dart';
import '../../../../core/routing/routes.dart';
import '../../../../data/app_urls/app_url.dart';
import '../../../../data/datasource/local/cache_consumer.dart';
import '../../../../data/datasource/remote/dio/dio_client.dart';
import '../../../../data/injection.dart';
import '../../../../domain/provider/local_auth_provider_cubit.dart';
import '../../../../data/injection.dart' as data_injection;
import '../../../../main.dart';
import '../../../component/custom_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;
  late final LocalAuthCubit _viewModel;
  DioClient dioClient =DioClient(AppURL.kBaseURL, getIt(),loggingInterceptor: getIt(), cacheConsumer: getIt());
  @override
  void initState() {
    super.initState();

    _viewModel = BlocProvider.of<LocalAuthCubit>(context, listen: false);
    // _loadWidget();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<Offset>(
      begin: Offset(0.0, 0.9),
      end: Offset.zero,
    ).animate(_animationController!);
    _animationController!.forward().whenComplete(() {
      navigationPage();
      // when animation completes, put your code here
    });
  }
  @override
  dispose() {
    _animationController!.dispose(); // you need this
    super.dispose();
  }

  // final splashDelay = 2550;
  // _loadWidget() async {
  //   var _duration = Duration(milliseconds: splashDelay);
  //   return Timer(_duration, navigationPage);
  // }


  navigationPage() async{
    bool isAuthed = await _viewModel.isLogin();
    if (isAuthed) {
      NavigationService.pushNamedAndRemoveUntil(RoutesRestaurants.layout,arguments: {'currentPage':0});
    }else{
      dioClient.token=null;
      NavigationService.pushNamedAndRemoveUntil(RoutesRestaurants.onBoardingScreen);
    }
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:  Color(0xff26624E),
      body: Center(
        child: Image.asset(AppImages.logo3,
          height: height,
          width: width,
        ),
      )
    );
  }
}
