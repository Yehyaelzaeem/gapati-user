import 'package:cogina/core/assets_constant/images.dart';
import 'package:cogina/presentation/modules/layout/screens/profile/widgets/custom_bottom_sheet_body.dart';
import 'package:cogina/presentation/modules/layout/screens/profile/widgets/custom_profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/navigation_services.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../component/custom_app_bar.dart';
import '../../../../dialog/show_logout_dialog.dart';
import '../../layout_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              verticalSpace(20),
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
              verticalSpace(20),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child:  Column(
                    children: [
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
                         viewModel.setCurrentIndex(1);
                       },
                      ),
                      verticalSpace(20),
                      CustomProfileItemWidget(backgroundColor: Colors.deepPurpleAccent, iconData: Icons.send_outlined, text: 'Addresses',
                        onTap: (){
                          NavigationService.push(RoutesRestaurants.address);
                        },
                      ),
                      // verticalSpace(20),
                      // const CustomProfileItemWidget(backgroundColor: AppColors.primaryColor, iconData: Icons.payment, text: 'Payment'),
                      // verticalSpace(20),
                      // const CustomProfileItemWidget(backgroundColor:  Colors.cyanAccent, iconData: Icons.favorite_border_rounded, text: 'Wishlist'),
                      // verticalSpace(20),
                      // const CustomProfileItemWidget(backgroundColor: Colors.deepPurpleAccent, iconData: Icons.settings, text: 'Settings'),
                      verticalSpace(20),
                      CustomProfileItemWidget(backgroundColor: Colors.redAccent, iconData: Icons.language, text: 'Language',
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomBottomSheetBody();
                          },
                        );
                      },),
                      verticalSpace(20),
                       CustomProfileItemWidget(backgroundColor: Colors.greenAccent, iconData: Icons.login_outlined, text: 'Logout',
                      onTap: (){
                        showLogoutDialog(context);
                      },),
                      verticalSpace(60),
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
