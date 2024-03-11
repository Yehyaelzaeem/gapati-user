import 'package:cogina/presentation/component/component.dart';
import 'package:cogina/presentation/component/custom_elevated_button.dart';
import 'package:cogina/presentation/component/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_constant/images.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/helpers/spacing.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Profile',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              verticalSpace(20),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [BoxShadow(color: Colors.black26,blurRadius: 7,
                            offset: Offset(2,4)
                        )]
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(RestaurantImages.pro2),
                      radius: 50,
                    ),
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
                            },
                            icon: const Icon(Icons.camera_alt_outlined,size: 20,color: AppColors.whiteColor,)),
                      ),
                    ),)
                ],
              ),
              verticalSpace(50),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 1,
                  offset: Offset(2,4)
                  )]
                ),
                child: CustomTextField(
                    prefixIcon: const Icon(Icons.person),
                    borderColor: AppColors.whiteColor.withOpacity(0.1),
                    hintText: 'name', controller: TextEditingController()),
              ),
              verticalSpace(30),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 1,
                        offset: Offset(2,4)
                    )]
                ),
                child: CustomTextField(
                    prefixIcon: const Icon(Icons.email),
                    borderColor: AppColors.whiteColor.withOpacity(0.1),
                    hintText: 'email', controller: TextEditingController()),
              ),
              verticalSpace(30),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 1,
                        offset: Offset(2,4)
                    )]
                ),
                child: CustomTextField(
                    prefixIcon: const Icon(Icons.phone),
                    borderColor: AppColors.whiteColor.withOpacity(0.1),
                    hintText: 'phone', controller: TextEditingController()),
              ),
              verticalSpace(70),
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
                    onTap: (){}, buttonText: 'Save'),
              )


            ],
          ),
        ),
      ),
    );
  }
}
