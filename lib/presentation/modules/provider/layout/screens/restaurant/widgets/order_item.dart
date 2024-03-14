import 'package:flutter/cupertino.dart';
import 'package:cogina/core/assets_constant/images.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/decoration.dart';
import '../../../../../../component/custom_elevated_button.dart';


class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 5)]
      ),
      height: 200.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(RestaurantImages.res),
                  radius: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('مصطفي محمد',style: TextStyles.font18Black700Weight,),
                    Row(
                      children: [
                        Icon(Icons.location_on,color: Colors.grey,),
                        Text('حي الاندلس ',style: TextStyles.font15CustomGray400Weight,),
                      ],
                    ),
                    Row(
                      children: [
                        Text('تفاصيل الطلب  ',style: TextStyles.font15CustomGray400Weight.copyWith(
                            color: AppColors.backBlue2
                        ),),
                        const Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,size: 18,),
                      ],
                    )
                  ],),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(' 25 دينار',style: TextStyles.font18Black700Weight,),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.redColor.withOpacity(0.3),
                          radius: 18,
                          child:
                          const Icon(Icons.phone,
                            color: AppColors.redColor,),
                        ),
                        horizontalSpace(10),
                        CircleAvatar(
                          backgroundColor: AppColors.backBlue2.withOpacity(0.3),
                          radius: 18,
                          child:
                          const Icon(Icons.message_outlined,
                              color: AppColors.backBlue2),
                        ),
                        horizontalSpace(10),
                        CircleAvatar(
                          backgroundColor: Colors.blue.withOpacity(0.3),

                          radius: 18,
                          child:
                          const Icon(Icons.send,
                              color:  Colors.blue),
                        )
                      ],
                    )
                  ],),
              ],
            ),
          ),
          SizedBox(
            height: 80.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                horizontalSpace(10),
                Container(
                  decoration: Decorations.backGroundDecorationButton().copyWith(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: CustomElevatedButton(
                    backgroundColor: Colors.transparent,
                    onTap: (){
                    },
                    buttonText:'قبول',
                    width: MediaQuery.of(context).size.width*0.4,
                    height: 35,
                    fontSize: 17,
                    borderRadius: 40,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: CustomElevatedButton(
                    backgroundColor: Colors.transparent,
                    onTap: (){
                    },
                    buttonText:'رفض',
                    width: MediaQuery.of(context).size.width*0.4,
                    height: 35,
                    fontColor:  Colors.grey,
                    fontSize: 17,
                    borderRadius: 40,
                  ),
                ),
                horizontalSpace(10),

              ],
            ),
          )

        ],
      ),
    );
  }
}
