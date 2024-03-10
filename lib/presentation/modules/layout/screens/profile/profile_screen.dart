import 'package:cogina/core/assets_constant/images.dart';
import 'package:cogina/presentation/modules/layout/screens/profile/widgets/custom_profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../layout_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: AppColors.whiteColor,
            width: double.infinity,
            height: 60.h,
          ),
          Container(
            color: AppColors.whiteColor,
            width: double.infinity,
            height: 60.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        final LayoutCubit viewModel =
                            BlocProvider.of<LayoutCubit>(context);
                        viewModel.setCurrentIndex(0);
                      },
                      child: const Icon(Icons.arrow_back_ios_new_rounded)),
                  Text(
                    'Profile',
                    style: TextStyles.font20Black700Weight,
                  ),
                  verticalSpace(1)
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
              padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 20.h),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(RestaurantImages.pro2),
                    radius: 50,
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
                  const CustomProfileItemWidget(backgroundColor: AppColors.primaryColorLight, iconData: Icons.notifications_none_rounded, text: 'Notification'),
                  verticalSpace(20),
                  const CustomProfileItemWidget(backgroundColor: AppColors.primaryColorDark, iconData: Icons.message_outlined, text: 'My Orders'),
                  verticalSpace(20),
                  const CustomProfileItemWidget(backgroundColor: Colors.deepPurpleAccent, iconData: Icons.send_outlined, text: 'Addresses'),
                  verticalSpace(20),
                  const CustomProfileItemWidget(backgroundColor: AppColors.primaryColor, iconData: Icons.payment, text: 'Payment'),
                  verticalSpace(20),
                  const CustomProfileItemWidget(backgroundColor:  Colors.cyanAccent, iconData: Icons.favorite_border_rounded, text: 'Wishlist'),
                  verticalSpace(20),
                  const CustomProfileItemWidget(backgroundColor: Colors.deepPurpleAccent, iconData: Icons.settings, text: 'Settings'),
                  verticalSpace(20),
                  const CustomProfileItemWidget(backgroundColor: Colors.redAccent, iconData: Icons.language, text: 'Language'),
                  verticalSpace(20),
                  const CustomProfileItemWidget(backgroundColor: Colors.greenAccent, iconData: Icons.login_outlined, text: 'Logout'),
                  verticalSpace(60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
