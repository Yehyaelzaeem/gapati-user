import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/resources/decoration.dart';
import '../../../../component/custom_elevated_button.dart';
import '../../../../component/custom_rate.dart';


class OrderProviderItem extends StatelessWidget {
   OrderProviderItem({super.key,  this.isProfits});
  double rating =3;
  final bool? isProfits;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 5)]
      ),
      height:
      isProfits==true?
      120.h:
      140.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(10),
          Expanded(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    verticalSpace(1),
                    Text('28 نوفمبر 2023',style: TextStyles.font18Black700Weight.copyWith(
                      color: AppColors.backBlue2
                    ),),
                    isProfits==true?
                    const SizedBox.shrink():
                    Row(
                      children: [
                        const Icon(Icons.location_on,color: Colors.black,size: 19,),
                        Text(' حي الاندلس       ',style: TextStyles.font16Black500Weight.copyWith(
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.account_balance_wallet,color: Colors.black,size: 18,),
                        Text(' طريقة الدفع.كاش',style: TextStyles.font16Black500Weight.copyWith(
                        ),),
                      ],
                    ),
                    verticalSpace(1),
                  ],),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    isProfits==true?
                    const SizedBox.shrink():
                    StatefulBuilder(builder: (context,setState){
                      return  RatingWidget(
                        size: 25,
                        filledStar: Icons.star,
                        halfStar: Icons.star_half,
                        emptyStar: Icons.star_border,
                        rating: rating,
                        onChanged: (rate) {
                          setState(() {
                            rating = rate;
                          });
                        },
                      );
                    }),
                    Row(
                      children: [
                        const Icon(Icons.flag_rounded,color: AppColors.backBlue2,size: 25,),
                        Text(' 25 دينار',style: TextStyles.font18Black700Weight.copyWith(
                          color: AppColors.backBlue2
                        ),),
                      ],
                    ),
                    Container(
                      height: 37,
                      decoration:
                      isProfits==true?null:
                      Decorations.backGroundDecorationButton().copyWith(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: CustomElevatedButton(
                        backgroundColor: Colors.transparent,
                        onTap: (){
                        },
                        borderColor: isProfits==true?Colors.black87:Colors.transparent,
                        buttonText:'تفاصيل الطلب',
                        fontColor: isProfits==true?Colors.black87:Colors.white,
                        width: MediaQuery.of(context).size.width*0.35,
                        height: 35,
                        fontSize: 17,
                        borderRadius: 40,
                      ),
                    ),
                    verticalSpace(1),
                  ],),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
