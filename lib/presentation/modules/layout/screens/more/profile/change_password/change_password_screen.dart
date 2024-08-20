
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../../core/helpers/spacing.dart';
import '../../../../../../component/custom_app_bar.dart';
import '../../../../../../component/custom_elevated_button.dart';
import '../../../../../../component/custom_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({super.key});

  bool isVisible1=true;
  TextEditingController pass=TextEditingController();
  TextEditingController confirm=TextEditingController();
  bool isVisible2=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customWhite,
      appBar: const CustomAppBar(
        title: 'Change Password',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              verticalSpace(35),
              StatefulBuilder(builder: (context,setState){
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 1,
                          offset: Offset(2,4)
                      )]
                  ),
                  child: CustomTextField(
                      isPassword: isVisible1,
                      suffixIcon: IconButton(icon:  Icon(
                          isVisible1?
                          Icons.visibility_off:Icons.visibility),onPressed: (){
                        setState(() {
                          isVisible1=!isVisible1;
                        });
                      },),
                      prefixIcon: const Icon(Icons.lock),
                      borderColor: AppColors.whiteColor.withOpacity(0.1),
                      hintText: 'New Password', controller: pass),
                );
              }),
              verticalSpace(20),
              StatefulBuilder(builder: (context,setState){
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 1,
                          offset: Offset(2,4)
                      )]
                  ),
                  child:
                  CustomTextField(
                      isPassword: isVisible2,
                      suffixIcon: IconButton(icon:  Icon(
                          isVisible2?
                          Icons.visibility_off:Icons.visibility),onPressed: (){
                        setState(() {
                          isVisible2=!isVisible2;
                        });
                      },),
                      prefixIcon: const Icon(Icons.lock),
                      borderColor: AppColors.whiteColor.withOpacity(0.1),
                      hintText: 'Confirm Password', controller: confirm),
                );
              }),

              verticalSpace(50),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 1,
                        offset: Offset(2,4)
                    )]
                ),
                child: CustomElevatedButton(
                    height: 45.h,
                    width: double.infinity,
                    onTap: (){}, buttonText: 'Sure'),
              )


            ],
          ),
        ),
      ),
    );
  }
}
