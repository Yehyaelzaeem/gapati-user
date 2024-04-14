import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/global/styles/colors.dart';
import '../../core/helpers/toast_states/enums.dart';

class CustomCheckButton extends StatelessWidget {
  const CustomCheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    return     FittedBox(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
              onPressed: () {
                // showToast(text: '', state: ToastStates.error, context: context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                minimumSize: const Size(100, 30), // Set your desired width and height
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              child:Icon(Icons.check_circle,color: Colors.white,)
          )),
    );
  }
}
