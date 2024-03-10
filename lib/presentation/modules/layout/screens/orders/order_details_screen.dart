import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/modules/layout/screens/orders/widgets/custom_steps_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../cart/widgets/custom_cart_item.dart';
import '../cart/widgets/custom_text_row_cart.dart';
import '../cart/widgets/custom_visa_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
   OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_rounded)),
        backgroundColor:AppColors.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(10),
            Center(child: Text('Order No 143577',style: TextStyles.font20Black700Weight.copyWith(
              fontWeight: FontWeight.bold
            ),)),
            Center(child: Text('2 Des ,2022',style: TextStyles.font16Black500Weight,)),
            verticalSpace(10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.whiteColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' Shipping Address',style: TextStyles.font20Black700Weight.copyWith(
                        fontWeight: FontWeight.bold,
                      fontSize: 16.sp
                    ),),
                    verticalSpace(5),
                    Row(
                      children: [
                        const Icon(Icons.location_on,color: AppColors.primaryColor,),
                        Text('HR# 300. San Ramon ,Ca ,California',style: TextStyles.font20Black700Weight.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.customGray,
                            fontSize: 12.sp
                        ),),
                      ],
                    ),
                    verticalSpace(5),
                    Text(' Phone Number',style: TextStyles.font20Black700Weight.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp
                    ),),
                    verticalSpace(5),
                    Text(' + 01122344556',style: TextStyles.font20Black700Weight.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.customGray,
                        fontSize: 12.sp
                    ),),
                    verticalSpace(40),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomStepsOrderWidget(text: 'Ordered',),
                        CustomStepsOrderWidget(text: 'Processing',),
                        CustomStepsOrderWidget(text: 'Shipped',),
                        CustomStepsOrderWidget(text: 'Delivered',),
                      ],
                    ),
                    verticalSpace(20),


                  ],
                ),
              ),
            ),
            ...items.map((e) => const CustomCartItem(hasShadow: true,hasDeleteIcon: false,)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  Text('Payment Method',style: TextStyles.font20Black700Weight.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp
                  ),),
                  verticalSpace(10),
                  const CustomVisaWidget(),
                  verticalSpace(10),
                  Text('Order Summary',style: TextStyles.font20Black700Weight.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp
                  ),),
                  verticalSpace(10),

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.whiteColor
                    ),
                    child:
                     Column(
                      children: [
                        CustomTextRowCartWidget(title: 'subtotal', text: '\$290.05',vertical: 7.h,),
                        CustomTextRowCartWidget(title: 'discount', text: '\$30.05',vertical: 7.h,),
                        CustomTextRowCartWidget(title: 'shipping', text: '\$5.05',vertical: 7.h,),
                        CustomTextRowCartWidget(title: 'Total', text: '\$290.05',vertical: 7.h,),
                        verticalSpace(50),
                      ],
                    ),
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  List items =[1,2,3,4];
}
