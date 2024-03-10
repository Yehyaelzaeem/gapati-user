import 'package:cogina/core/resources/decoration.dart';
import 'package:cogina/core/resources/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../component/component.dart';
import '../../layout_cubit.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      width: deviceWidth,
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
                padding:  EdgeInsets.all(kScreenPaddingNormal.r),
                height: 20,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(onTap: ()=>BlocProvider.of<LayoutCubit>(context).setCurrentIndex(0),child: Container(margin:const EdgeInsets.all(kFormPaddingAllSmall),child: Icon( Icons.arrow_back, color: Theme.of(context).cardColor))),

                        Text(tr(LocaleKeys.more), style: const TextStyle().regularStyle(fontSize: 16).colorWhite().boldStyle()),
                      ],
                    ),
                  ],
                )
            ),


            Positioned.fill(
              top: 72.h,
              child: Container(

                decoration: const BoxDecoration().listStyle().copyWith(borderRadius:const BorderRadius.vertical(top: Radius.circular(kFormRadiusLarge))),
                padding: EdgeInsets.all(kScreenPaddingNormal.r).copyWith(top:42.h),
                child: ListAnimator(
                  children: [
                    // _buildItem(context,image: Assets.svgMenuLanguageIcon, title: tr(LocaleKeys.language),onTap:()=>showChangeLanguageSheet(context),),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80.w),
                      child: CustomButton(
                        onTap: () {
                          // showLogoutDialog(context)
                        },
                        isRounded: true,
                        isOutlined: true,

                        color: Theme.of(context).hintColor,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout,color:Theme.of(context).hintColor,size:  22.r),
                            // SvgPicture.asset( Assets.svgMenuLogoutIcon,color:Theme.of(context).hintColor,width: 22.r,height: 22.r,),
                            const HorizontalSpace(kScreenPaddingNormal),
                            Text(tr(LocaleKeys.logOut),style: const TextStyle().regularStyle().hintStyle(),),
                          ],
                        ),
                      ),
                    ),
                    VerticalSpace(kScreenPaddingNormal.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  _buildItem(BuildContext context,{required String image , required String title , Color? color ,GestureTapCallback? onTap}){
    return ListTile(
      onTap: onTap,
      trailing:color!=null?null: Icon(Icons.arrow_forward_ios,size: 16.r,color: color??Theme.of(context).hintColor,),
      title: Text(title,style: const TextStyle().regularStyle().customColor(color??Colors.black),),
      leading: SvgPicture.asset(image,color: color??Theme.of(context).primaryColor,width: 22.r,height: 22.r,),
    );
  }
}
