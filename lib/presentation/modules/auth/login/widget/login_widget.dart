import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/modules/auth/login/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/helpers/toast_states/enums.dart';
import '../../../../component/custom_elevated_button.dart';
import '../../../../component/custom_text_field.dart';
import '../../../../component/inputs/phone_country/custom_text_field_phone_code.dart';

class LoginWidget extends StatelessWidget {
   LoginWidget({super.key});

  bool isVisible2 = true;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit =LoginCubit.get(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.whiteColor,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 2)
          ]),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 18.w, vertical: 25.h),
        child: StatefulBuilder(builder: (context, setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              Text(
                LocaleKeys.enterPhone.tr(),
                style: TextStyles.font18Black700Weight
                    .copyWith(fontWeight: FontWeight.w500,
                    color: AppColors.customGray,
                    fontSize: 15.sp
                ),
              ),
              verticalSpace(10),
              CustomTextField(
                textInputType: TextInputType.number,
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: AppColors.primaryColor,
                  ),
                  fillColor: AppColors.backGroundGray,
                  borderRadius: 30,
                  borderColor: AppColors.whiteColor.withOpacity(0.1),
                  hintText: LocaleKeys.phone.tr(),
                  controller: cubit.phoneController,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (vsl){
                    cubit.otpCode(cubit.phoneController.text,context);
                  },
              ),
              verticalSpace(20),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primaryColor,
                    value: _isChecked,
                    onChanged: (newValue) {
                      setState(() {
                        _isChecked = newValue!;
                      });
                    },
                  ),
                  Text(
                    LocaleKeys.rememberMe.tr(),
                    style: TextStyles.font18Black700Weight
                        .copyWith(fontWeight: FontWeight.w500,fontSize: 15),
                  ),
                  const Spacer(),
                  Text(
                    LocaleKeys.forgetPassword.tr(),
                    style: TextStyles.font18Black700Weight
                        .copyWith(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.secondPrimaryColor),
                  ),
                ],
              ),
              BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return CustomElevatedButton(
                                        isLoading: state is OtpLoadingState,
                                        onTap: (){
                                          cubit.otpCode(cubit.phoneController.text,context);
                                        },
                                        buttonText: LocaleKeys.signIn.tr(),
                                        width: MediaQuery.of(context).size.width,
                                        height: 40,
                                        fontSize: 17,
                                        borderRadius: 40,
                                      );
                          },
                        )
            ],
          );
        }),
      ),
    );
  }
}
