import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../component/custom_elevated_button.dart';
import '../forget_password_cubit.dart';


class OtpWidget extends StatefulWidget {
  const OtpWidget({super.key,});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  bool _onEditing=true;
  String _code ='';
  @override
  Widget build(BuildContext context) {
    ForgetPasswordCubit cubit =context.read<ForgetPasswordCubit>();
    return  Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.whiteColor,
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 2)
              ]),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.backGroundGray,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
                ),
                width: MediaQuery.of(context).size.width,
                height: 60.h,
                child: Center(
                  child: Text(LocaleKeys.confirmNumber.tr(),
                  style: TextStyles.font20Black700Weight,
                  ),
                ),
              ),
              verticalSpace(20),
              Text(LocaleKeys.enterCode.tr(),
                style: TextStyles.font18Black700Weight.copyWith(
                  color: Colors.grey
                ),
              ),

              Directionality(textDirection: TextDirection.ltr,
                child:  VerificationCode(
                textStyle: TextStyle(fontSize: 20.0, color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                keyboardType: TextInputType.number,
                underlineColor: AppColors.backBlue2,
                length: 4,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                cursorColor:  AppColors.backBlue2,
                clearAll: const SizedBox.shrink(),
                onCompleted: (String value) {
                  cubit.checkOtp(otp: value, context: context);
                  setState(() {
                    _code = value;
                  });
                },
                onEditing: (bool value) {
                  setState(() {
                    _onEditing = value;
                  });
                  if (!_onEditing) FocusScope.of(context).unfocus();
                },
              ),),
              verticalSpace(30),
              BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 50.w),
                                child: CustomElevatedButton(
                                  isLoading:state is CheckOtpLoadingState,
                                  loadingSize: 30,
                                  onTap: (){
                                    cubit.checkOtp(otp: _code,context: context);
                                  },
                                  buttonText:LocaleKeys.done.tr(),
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  fontSize: 17,
                                  borderRadius: 40,
                                ),
                              );
                  },
                ),
                verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
