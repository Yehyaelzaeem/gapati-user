import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class CustomProfileItemWidget extends StatelessWidget {
  const CustomProfileItemWidget({super.key, required this.backgroundColor, required this.iconData, required this.text, this.onTap});
  final Color backgroundColor;
  final IconData iconData;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Row(
        children: [
           CircleAvatar(
            backgroundColor: backgroundColor.withOpacity(0.25),
            radius: 18,
            child: Icon(iconData,weight: 10,color: backgroundColor,size: 21,),
          ),
          horizontalSpace(30),
          Text(text,style: TextStyles.font18Black700Weight,),
          const Spacer(),
           Icon(Icons.arrow_forward_ios_outlined,color: AppColors.black.withOpacity(0.6),size: 20,),
          horizontalSpace(10),

        ],
      ),
    );
  }
}
