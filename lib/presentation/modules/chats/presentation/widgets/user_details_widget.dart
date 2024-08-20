import 'package:flutter/material.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../component/images/custom_image.dart';
import '../../../../component/texts/black_texts.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserDetails userDetails;
  const UserDetailsWidget({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    var mq =MediaQuery.of(context).size;
    return Container(
      height: mq.height*0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          CustomImage(image: userDetails.image,
            height: mq.height*0.6,
            width: double.infinity,
            radius: 20,
          ),
          Container(
            height: mq.height*0.6,
            width: double.infinity,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [Colors.black87,Colors.black54,Colors.black45,Colors.black12]
              )
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                verticalSpace(10),
                BlackBoldText(
                  label: userDetails.name,
                  fontSize: 18,
                  labelColor: AppColors.whiteColor,
                ),
                BlackMediumText(
                  label: userDetails.phone,
                  fontSize: 14,
                  labelColor:  Colors.white70,
                ),

              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child:
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlackMediumText(
                  fontSize: 14,
                  label: userDetails.status,
                  labelColor:Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class UserDetails{
  final String image;
  final String name;
  final String phone;
  final String status;

  UserDetails({required this.image,required this.name,required this.phone,required this.status});
}