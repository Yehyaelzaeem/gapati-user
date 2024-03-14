import 'package:cogina/core/assets_constant/images.dart';
import 'package:cogina/presentation/modules/user/layout/screens/profile/widgets/custom_bottom_sheet_body.dart';
import 'package:cogina/presentation/modules/user/layout/screens/profile/widgets/custom_profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../component/custom_app_bar.dart';
import '../../../../../dialog/show_logout_dialog.dart';
import '../../layout_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  // _launchCaller(String number) async {
  //   String url = 'tel:$number';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: CustomAppBar(
          title: 'Profile',
          onBackPress: (){
            final LayoutCubit viewModel = BlocProvider.of<LayoutCubit>(context);
            viewModel.setCurrentIndex(0);
          },
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(10),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(RestaurantImages.pro2),
                            radius: 50,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child:
                            CircleAvatar(
                              radius: 18,
                              child: Center(
                                child: IconButton(
                                    onPressed: (){
                                      NavigationService.push(RoutesRestaurants.editProfileScreen);
                                    },
                                    icon: const Icon(Icons.edit,size: 20,color: AppColors.whiteColor,)),
                              ),
                            ),)
                        ],
                      ),
                      Text(
                        'Jhon Alexa',
                        style: TextStyles.font20Black700Weight,
                      ),
                      Text(
                        'Balance \$ 12000.00',
                        style: TextStyles.font14White500Weight
                            .copyWith(color: AppColors.customGray),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(10),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child:  Column(
                    children: [
                      verticalSpace(10),
                      CustomProfileItemWidget(backgroundColor: Colors.cyanAccent.shade700, iconData: Icons.info_outline, text: 'About us',
                        onTap: (){
                          NavigationService.push(RoutesRestaurants.aboutUsScreen);
                        },
                      ),
                      verticalSpace(20),
                      CustomProfileItemWidget(backgroundColor: AppColors.primaryColorLight, iconData: Icons.notifications_none_rounded, text: 'Notification',
                        onTap: (){
                          NavigationService.push(RoutesRestaurants.notification);
                        },
                      ),
                      verticalSpace(20),
                      CustomProfileItemWidget(backgroundColor: AppColors.primaryColorDark, iconData: Icons.message_outlined, text: 'My Orders',
                        onTap: (){
                          final LayoutCubit viewModel = BlocProvider.of<LayoutCubit>(context);
                          viewModel.setCurrentIndex(2);
                        },
                      ),
                      verticalSpace(20),
                      CustomProfileItemWidget(backgroundColor: Colors.deepPurpleAccent, iconData: Icons.send_outlined, text: 'Addresses',
                        onTap: (){
                          NavigationService.push(RoutesRestaurants.address);
                        },
                      ),
                      verticalSpace(20),

                      CustomProfileItemWidget(backgroundColor: Colors.grey.shade700, iconData: Icons.privacy_tip_outlined, text: 'Privacy Policy',
                        onTap: (){
                          NavigationService.push(RoutesRestaurants.privacyPolicyScreen);
                        },
                      ),
                      verticalSpace(20),

                      CustomProfileItemWidget(backgroundColor: Colors.blueGrey, iconData: Icons.note_alt_rounded, text: 'Terms and Conditions',
                        onTap: (){
                          NavigationService.push(RoutesRestaurants.termsConditionScreen);
                        },
                      ),
                      verticalSpace(20),
                      CustomProfileItemWidget(backgroundColor: Colors.blue, iconData: Icons.language, text: 'Language',
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomBottomSheetBody();
                            },
                          );
                        },),
                      verticalSpace(20),
                      CustomProfileItemWidget(backgroundColor: AppColors.redColor, iconData: Icons.person_remove_alt_1_rounded, text: 'Delete Account',
                        onTap: (){
                          showDeleteAccountDialog(context);
                        },),
                      verticalSpace(20),
                      CustomProfileItemWidget(backgroundColor: Colors.greenAccent.shade700, iconData: Icons.logout, text: 'Logout',
                        onTap: (){
                          showLogoutDialog(context,);
                        },),
                      verticalSpace(70),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  }
}