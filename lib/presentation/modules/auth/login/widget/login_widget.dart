import 'package:cogina/presentation/modules/auth/login/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                ' Enter Your phone',
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
                  hintText: 'Phone',
                  controller: cubit.phoneController,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (vsl){
                    cubit.otpCode(cubit.phoneController.text,context);
                  },
              ),
              // CustomTextField(
              //     fillColor: AppColors.backGroundGray,
              //     isPassword: isVisible2,
              //     borderRadius: 40,
              //     suffixIcon: IconButton(
              //       icon: Icon(
              //           color: Colors.grey.shade500,
              //           isVisible2
              //               ? Icons.visibility_off
              //               : Icons.visibility),
              //       onPressed: () {
              //         setState(() {
              //           isVisible2 = !isVisible2;
              //         });
              //       },
              //     ),
              //     prefixIcon: const Icon(
              //       Icons.lock,
              //       color: AppColors.primaryColor,
              //     ),
              //     borderColor: AppColors.whiteColor.withOpacity(0.1),
              //     hintText: 'Password',
              //     controller: pass),
              // CustomTextFieldPhoneCode(
              //   label: 'الموبايل',
              //   initialCountryCode:'+20',
              //   controller: LoginCubit.get(context).phoneController,
              //   autofocus: true,
              //   textInputAction: TextInputAction.next,
              //   onCountryChanged: (v){
              //
              //   },
              // ),
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
                    'Remember me',
                    style: TextStyles.font18Black700Weight
                        .copyWith(fontWeight: FontWeight.w500,fontSize: 15),
                  ),
                  const Spacer(),
                  Text(
                    'Forget Password?',
                    style: TextStyles.font18Black700Weight
                        .copyWith(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.redColor.withOpacity(0.5)),
                  ),
                ],
              ),
              CustomElevatedButton(
                onTap: (){
                  // LoginCubit.get(context).changeType('otp');
                  cubit.otpCode(cubit.phoneController.text,context);

                },
                buttonText: 'Sign in',
                width: MediaQuery.of(context).size.width,
                height: 40,
                fontSize: 17,
                borderRadius: 40,
              )
            ],
          );
        }),
      ),
    );
  }
}
