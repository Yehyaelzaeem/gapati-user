import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/component/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/translations/locale_keys.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../layout_cubit.dart';

class CustomBottomSheetBody extends StatelessWidget {
   CustomBottomSheetBody({super.key});
  int _selectedLanguage = 0;
  @override
  Widget build(BuildContext context) {
    if(context.locale.languageCode == const Locale('en').toString()){
      _selectedLanguage=0;
    }else{
      _selectedLanguage=1;
    }
    return SizedBox(
      width: double.infinity,
      child:
      Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpace(30),
              Text(
                  LocaleKeys.changeLanguage.tr(),
                style: TextStyles.font20Black700Weight
              ),
              verticalSpace(10),
              StatefulBuilder(builder: (context,setState){
                return  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                  child:
                  Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value:0 ,
                            groupValue:_selectedLanguage,
                            onChanged: (value) {
                              setState(() {
                                _selectedLanguage = value!;
                              });
                            },
                          ),
                           Text(LocaleKeys.en.tr()),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _selectedLanguage,
                            onChanged: (value) {
                              setState(() {
                                _selectedLanguage = value!;
                              });
                            },
                          ),
                           Text(LocaleKeys.ar.tr()),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              verticalSpace(10),
              CustomElevatedButton(
                  height: 45.h,
                  width: MediaQuery.of(context).size.width*0.9,
                  onTap: (){
                    showDialog(context: context, builder: (context){
                      return const Center(child: CircularProgressIndicator(),);
                    });
                    Future.delayed(const Duration(seconds: 1)).then((value) {
                      context.pushNamedAndRemoveUntil(RoutesRestaurants.splashScreen, predicate: (route) => route.isFirst);
                      if(_selectedLanguage==1){
                        context.setLocale(const Locale('ar'));
                      }else{
                        context.setLocale(const Locale('en'));
                      }
                      // Navigator.of(context).pop();
                    });
                  },
                  fontSize: 17.sp,
                  buttonText: LocaleKeys.save.tr()),
              verticalSpace(20),

            ],
          ),
          Positioned(
              top: 10.h,
              right: 5.w,
              child: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.clear,color: AppColors.primaryColor,),))
        ],
      ),
    );
  }
}
