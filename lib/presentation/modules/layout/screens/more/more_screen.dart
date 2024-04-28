import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/more/address/address_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/more/profile/profile_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/more/widgets/custom_bottom_sheet_body.dart';
import 'package:cogina/presentation/modules/layout/screens/more/widgets/custom_profile_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/routing/navigation_services.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../core/translations/locale_keys.dart';
import '../../../../component/custom_app_bar.dart';
import '../../../../component/custom_elevated_button.dart';
import '../../../../component/custom_is_user.dart';
import '../../../../component/images/custom_image.dart';
import '../../../../dialog/show_logout_dialog.dart';
import '../../layout_cubit.dart';
import 'more_cubit.dart';


class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = ProfileCubit.get(context);
    bool isUser= HomeCubit.get(context).token!=null&&HomeCubit.get(context).token!.isNotEmpty;
    MoreCubit moreCubit =MoreCubit.get(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.more.tr(),
        onBackPress: () {
          final LayoutCubit viewModel = BlocProvider.of<LayoutCubit>(context);
          viewModel.setCurrentIndex(0);
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              verticalSpace(10),
              CustomIsUser(
                isUser: isUser,
                widget:
                BlocConsumer<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (cubit.profileModel != null) {
                      return Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 100.w, vertical: 20.h),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 115.h,
                                    width: 115.h,
                                    child: CustomImage(image:cubit.profileModel!.image!, radius: 100,),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 18,
                                      child: Center(
                                        child: IconButton(
                                            onPressed: () {
                                              NavigationService.push(
                                                  RoutesRestaurants
                                                      .editProfileScreen);
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 20,
                                              color: AppColors.whiteColor,
                                            )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              verticalSpace(5),
                              Text(
                                '${cubit.profileModel!.firstName} ${cubit.profileModel!.lastName}',
                                style: TextStyles.font20Black700Weight,
                              ),
                              Text(
                                '${cubit.profileModel!.email}',
                                style: TextStyles.font14White500Weight
                                    .copyWith(color: AppColors.customGray,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                  listener: (context, state) {},
                ),
                hasLogo: true,
              ),

              verticalSpace(10),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      verticalSpace(10),

                      CustomIsUser(
                        isUser: isUser,
                        widget:  CustomProfileItemWidget(
                          backgroundColor: AppColors.secondPrimaryColor,
                          iconData: Icons.notifications_none_rounded,
                          text: LocaleKeys.notification.tr(),
                          onTap: () {
                            NavigationService.push(RoutesRestaurants.notification);
                          },
                        ),),
                      CustomIsUser(
                          isUser: isUser,
                        widget:  verticalSpace(20)),
                      CustomIsUser(
                        isUser: isUser,
                        widget: CustomProfileItemWidget(
                          backgroundColor: AppColors.primaryColorDark,
                          iconData: Icons.reorder_sharp,
                          text: LocaleKeys.myOrders.tr(),
                          onTap: () {
                            final LayoutCubit viewModel =
                            BlocProvider.of<LayoutCubit>(context);
                            viewModel.setCurrentIndex(2);
                          },
                        ),),
                      CustomIsUser(
                        isUser: isUser,
                        widget: verticalSpace(20),),
                      // CustomIsUser(
                      //   isUser: isUser,
                      //   widget: CustomProfileItemWidget(
                      //   backgroundColor: Colors.deepPurpleAccent,
                      //   iconData: Icons.location_on_outlined,
                      //   text: LocaleKeys.addresses.tr(),
                      //   onTap: () {
                      //     AddressCubit.get(context).getAllAddress();
                      //     NavigationService.push(RoutesRestaurants.addresses);
                      //   },
                      // ),),
                      // verticalSpace(20),
                      CustomProfileItemWidget(
                        backgroundColor: Colors.cyanAccent.shade700,
                        iconData: Icons.info_outline,
                        text: LocaleKeys.aboutUs.tr(),
                        onTap: () {
                          moreCubit.getAboutUs();
                          NavigationService.push(RoutesRestaurants.aboutUsScreen);
                        },
                      ),
                      CustomIsUser(
                        isUser: isUser,
                        widget: verticalSpace(20),),
                      CustomProfileItemWidget(
                        backgroundColor: Colors.grey.shade700,
                        iconData: Icons.privacy_tip_outlined,
                        text: LocaleKeys.privacyPolicy.tr(),
                        onTap: () {
                          moreCubit.getPrivacy();
                          NavigationService.push(
                              RoutesRestaurants.privacyPolicyScreen);
                        },
                      ),
                      verticalSpace(20),
                      CustomProfileItemWidget(
                        backgroundColor: Colors.blueGrey,
                        iconData: IonIcons.hammer,
                        text: LocaleKeys.termsAndConditions.tr(),
                        onTap: () {
                          moreCubit.getTerms();
                          NavigationService.push(
                              RoutesRestaurants.termsConditionScreen);
                        },
                      ),
                      verticalSpace(20),
                      CustomProfileItemWidget(
                        backgroundColor: Colors.blue,
                        iconData: Icons.language,
                        text: LocaleKeys.language.tr(),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return  CustomBottomSheetBody();
                            },
                          );
                        },
                      ),
                      verticalSpace(20),
                      CustomIsUser(
                        isUser: isUser,
                        widget:  CustomProfileItemWidget(
                          backgroundColor: Colors.greenAccent.shade700,
                          iconData: Icons.logout,
                          text: LocaleKeys.logout.tr(),
                          onTap: () {
                            showLogoutDialog(
                              context,
                            );
                          },
                        ),),

                      CustomIsUser(
                        isUser: isUser,
                        widget: verticalSpace(20),),
                      CustomIsUser(
                        isUser: isUser,
                        widget: CustomProfileItemWidget(
                          backgroundColor: AppColors.redColor,
                          iconData: Icons.person_remove_alt_1_rounded,
                          text: LocaleKeys.deleteAccount.tr(),
                          onTap: () {
                            showDeleteAccountDialog(context);
                          },
                        ),),
                      CustomIsUser(
                        isUser: isUser,
                        widget: verticalSpace(20),),                  ],
                  ),
                ),
              ),
              CustomIsUser(isUser: !isUser, widget:
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 20.h),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
                    child: Column(
                      children: [
                        Text('Log_in_first'.tr(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            // fontFamily: AppFontsFamily.fontCairo,
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        CustomElevatedButton(
                          height: 40.h,
                          width: 200.w,
                          onTap: (){
                            context.pushNamedAndRemoveUntil(RoutesRestaurants.logAsScreen, predicate: (route) => route.isFirst);

                          }, buttonText:'sign_up'.tr(), ),                ],
                    ),
                  ),
                ),
              ),),

            ],
          ),
        ),
      ),
    );
  }
}
