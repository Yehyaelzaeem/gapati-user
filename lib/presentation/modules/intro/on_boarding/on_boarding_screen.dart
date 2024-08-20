import 'dart:async';

import 'package:delivego/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/global/styles/colors.dart';
import '../../../../core/global/styles/styles.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routing/routes.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../component/custom_button.dart';
import '../../../component/spaces.dart';
import 'widgets/page_pop_view.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();

}
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController(initialPage: 0);
  List<PageViewData> pageViewModelData = [];
  late Timer sliderTimer;
  var currentShowIndex = 0;

  @override
  void initState() {
    addData();
    super.initState();
  }

  @override
  void dispose() {
    sliderTimer.cancel();
    super.dispose();
  }
  addData(){
    pageViewModelData.add( PageViewData(
      titleText: LocaleKeys.easyTrackOrder.tr(),
      subText: LocaleKeys.easyTrackOrderDesc.tr(),
      assetsImage: Assets.imagesIntro2,
    ));

    pageViewModelData.add( PageViewData(
      titleText: LocaleKeys.onlineDelivery.tr(),
      subText: LocaleKeys.onlineDeliveryDesc.tr(),
      assetsImage: Assets.imagesIntro3,
    ));

    pageViewModelData.add( PageViewData(
      titleText: LocaleKeys.onlineFoodDelivery.tr(),
      subText: LocaleKeys.onlineFoodDeliveryDesc.tr(),
      assetsImage: Assets.imagesIntro4,
    ));

    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(MediaQuery.of(context).size.width * 1, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {

        pageController.animateTo(MediaQuery.of(context).size.width * 2, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 2) {
        pageController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top,),
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: pageController,
                  pageSnapping: true,
                  onPageChanged: (index) {
                    currentShowIndex = index;
                  },
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    PagePopup(imageData: pageViewModelData[0]),
                    PagePopup(imageData: pageViewModelData[1]),
                    PagePopup(imageData: pageViewModelData[2]),
                  ],
                ),
                Positioned(
                  top: 30.h,
                  left: 16.w,
                  child:
                  InkWell(
                    onTap: () {
                      if (context.locale == const Locale('en')) {
                        context.setLocale(const Locale('ar')).then((value) {
                          context.pushNamedAndRemoveUntil(RoutesRestaurants.splashScreen, predicate: (route) => route.isFirst);
                        });
                      }
                      else {
                        context.setLocale(const Locale('en')).then((value){
                          context.pushNamedAndRemoveUntil(RoutesRestaurants.splashScreen, predicate: (route) => route.isFirst);

                        });
                      }
                    },
                    child: SizedBox(
                      child: Text(LocaleKeys.onLanguage.tr(),
                        style: TextStyles.font18Black700Weight.copyWith(
                          color: Colors.deepPurpleAccent
                        ),
                      ),
                    ),
                  ),),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: kScreenPaddingNormal.h,horizontal: kScreenPaddingLarge.w),
            child: CustomButton(
              title: LocaleKeys.getStarted.tr(),
              color: Theme.of(context).primaryColor,
              onTap: (){
                context.pushNamed(RoutesRestaurants.logAsScreen);
              }
            ),
          ),
          Padding(
            padding: EdgeInsets.all(kScreenPaddingNormal.r),
            child: SmoothPageIndicator(
              controller: pageController, // PageController
              count: 3,
              effect: WormEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: AppColors.hoverColor,
                dotHeight: 12.0,
                dotWidth: 12.0,
                spacing: 5.0,
              ), // your preferred effect
              onDotClicked: (index) {},
            ),
          ),
          VerticalSpace(kScreenPaddingNormal.h)
        ],
      ),
    );
  }


}
