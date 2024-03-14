import 'dart:async';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
    pageViewModelData.add(const PageViewData(
      titleText: LocaleKeys.onlineRides,
      subText: LocaleKeys.onlineRidesDesc,
      assetsImage: Assets.imagesIntro1,
    ));

    pageViewModelData.add(const PageViewData(
      titleText: LocaleKeys.easyTrackOrder,
      subText: LocaleKeys.easyTrackOrderDesc,
      assetsImage: Assets.imagesIntro2,
    ));

    pageViewModelData.add(const PageViewData(
      titleText: LocaleKeys.onlineDelivery,
      subText: LocaleKeys.onlineDeliveryDesc,
      assetsImage: Assets.imagesIntro3,
    ));

    pageViewModelData.add(const PageViewData(
      titleText: LocaleKeys.onlineFoodDelivery,
      subText: LocaleKeys.onlineFoodDeliveryDesc,
      assetsImage: Assets.imagesIntro4,
    ));

    pageViewModelData.add(const PageViewData(
      titleText: LocaleKeys.easyOnlinePayment,
      subText: LocaleKeys.easyOnlinePaymentDesc,
      assetsImage: Assets.imagesIntro5,
    ));
    pageViewModelData.add(const PageViewData(
      titleText: LocaleKeys.requestYourServiceOnline,
      subText: LocaleKeys.requestYourServiceOnlineDesc,
      assetsImage: Assets.imagesIntro6,
    ));

    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(MediaQuery.of(context).size.width, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {
        pageController.animateTo(MediaQuery.of(context).size.width * 2, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 2) {
        pageController.animateTo(MediaQuery.of(context).size.width * 3, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 3) {
        pageController.animateTo(MediaQuery.of(context).size.width * 4, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 4) {
        pageController.animateTo(MediaQuery.of(context).size.width * 5, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 5) {
        pageController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    sliderTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top,),
          Expanded(
            child: PageView(
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
                PagePopup(imageData: pageViewModelData[3]),
                PagePopup(imageData: pageViewModelData[4]),
                PagePopup(imageData: pageViewModelData[5]),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: kScreenPaddingNormal.h,horizontal: kScreenPaddingLarge.w),
            child: CustomButton(
              title: tr(LocaleKeys.getStarted),
              color: Theme.of(context).primaryColorDark,
              onTap: (){
                context.pushNamed(RoutesRestaurants.chooseUserScreen);
              }
            ),
          ),
          Padding(
            padding: EdgeInsets.all(kScreenPaddingNormal.r),
            child: SmoothPageIndicator(
              controller: pageController, // PageController
              count: 6,
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
