import 'dart:async';
import 'package:cogina/core/resources/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/values_manager.dart';
import '../on_boarding/on_boarding_screen.dart';



class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{

  // late final LocalAuthCubit _viewModel;

  _playAnimation() async{

    Timer(const Duration(seconds: 1), () async {
      _route();
    });


  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // _viewModel = BlocProvider.of<LocalAuthCubit>(context, listen: false);
    // BlocProvider.of<HomeCubit>(context).initGoogleMap();
    super.initState();
    _playAnimation();

  }
  void _route() async{

    Timer(const Duration(seconds: 2), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnBoardingScreen()));
      // bool isAuthed = await _viewModel.isLogin();
      // if (isAuthed) {
      //   NavigationService.pushNamedAndRemoveUntil( Routes.layoutScreen);
      // }else{
      //   NavigationService.pushNamedAndRemoveUntil( Routes.layoutScreen);
      //
      //   // NavigationService.pushNamedAndRemoveUntil( Routes.loginScreen);
      // }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColorDark,
        width:deviceWidth,
        height: deviceHeight,
          alignment: Alignment.center,
          child: Text('Logo',style:const TextStyle().titleStyle(fontSize: 42).colorWhite(),),
        // child: Image.asset(
        //   // width:deviceWidth,
        //   // height: deviceHeight,
        //   // fit: BoxFit.fill,
        //   Assets.imagesImgAvatarPlaceholder
        // ),
      ),
    );
  }
}


