import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/component/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheetBody extends StatefulWidget {
  const CustomBottomSheetBody({super.key});

  @override
  State<CustomBottomSheetBody> createState() => _CustomBottomSheetBodyState();
}

class _CustomBottomSheetBodyState extends State<CustomBottomSheetBody> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child:
      Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpace(40),
              Text(
                'Change Language',
                style: TextStyles.font20Black700Weight
              ),
              verticalSpace(16),
              ListTile(
                title: const Text('English'),
                leading: Radio(
                  value: 'English',
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value.toString();
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('العربية'),
                leading: Radio(
                  value: 'العربية',
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value.toString();
                    });
                  },
                ),
              ),
              verticalSpace(10),
              CustomElevatedButton(
                  height: 45.h,
                  width: MediaQuery.of(context).size.width*0.9,
                  onTap: (){
                    showDialog(context: context, builder: (context){
                      return const Center(child: CircularProgressIndicator(),);
                    });
                   Future.delayed(const Duration(seconds: 2)).then((value) {
                     Navigator.of(context).pop();
                   });
                  },
                  fontSize: 17.sp,
                  buttonText: 'Save'),
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
