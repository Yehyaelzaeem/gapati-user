
import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/presentation/modules/layout/screens/orders/widgets/custom_order_details_item.dart';
import 'package:delivego/presentation/modules/layout/screens/orders/widgets/custom_steps_order_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/navigation_services.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../data/model/response/order_model.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../component/custom_app_bar.dart';
import '../../../../component/custom_elevated_button.dart';
import '../../../../component/custom_loading_widget.dart';
import '../cart/widgets/custom_cart_item.dart';
import '../cart/widgets/custom_text_row_cart.dart';
import '../cart/widgets/custom_visa_widget.dart';
import 'orders_cubit.dart';

class OrderDetailsScreen extends StatelessWidget {
   OrderDetailsScreen({super.key, required this.orderId, required this.orderModelData, required this.phone, required this.address});
  final int orderId;
  final OrderModelData? orderModelData;
  final String phone;
  final String address;
   bool preparing=false;
   bool padding=false;

   bool onWay=false;
   bool isDone=false;

   @override
  Widget build(BuildContext context) {
    OrdersCubit cubit =OrdersCubit.get(context);
    cubit.getOrdersDetails(orderId: orderId);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocConsumer<OrdersCubit, OrdersState>(
          listener: (context, state) {},
          builder: (context, state) {
            if(cubit.orderDetailsModel?.data?.status=='padding'){
              padding=true;
            }else if(cubit.orderDetailsModel?.data?.status=='restaurant_accepted'){
              padding=true;
              preparing=true;
            }else if(cubit.orderDetailsModel?.data?.status=='start_trip'){
              padding=true;
               preparing=true;
              onWay=true;
            }else if(cubit.orderDetailsModel?.data?.status=='done'){
              padding=true;
               preparing=true;
              onWay=true;
              isDone=true;
            }
            if(cubit.orderDetailsModel!=null){
              if(cubit.orderDetailsModel!.data==null){
                return Center(child: Text(LocaleKeys.notFoundData.tr()),);
              }else{
                return
                RefreshIndicator(
                  onRefresh: ()async{
                    cubit.getOrdersDetails(orderId: orderId);
                  },
                  child:   SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child:
                      Column(
                        children: [
                          verticalSpace(10),
                          Center(child: Text('${LocaleKeys.orderNo.tr()} ${orderId}',style: TextStyles.font20Black700Weight.copyWith(
                              fontWeight: FontWeight.bold
                          ),)),
                          Center(child: Text('${cubit.orderDetailsModel!.data?.date??''}',style: TextStyles.font16Black500Weight,)),
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
                                  Text(' ${LocaleKeys.shippingAddress.tr()}',style: TextStyles.font20Black700Weight.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp
                                  ),),
                                  verticalSpace(5),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on,color: AppColors.primaryColor,),
                                      Text(address,style: TextStyles.font20Black700Weight.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.customGray,
                                          fontSize: 12.sp
                                      ),),
                                    ],
                                  ),
                                  verticalSpace(5),
                                  Text(' ${LocaleKeys.phoneNumber.tr()}',style: TextStyles.font20Black700Weight.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp
                                  ),),
                                  verticalSpace(5),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Text(phone,style: TextStyles.font20Black700Weight.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.customGray,
                                        fontSize: 12.sp
                                    ),),
                                  ),
                                  verticalSpace(40),
                                  InkWell(
                                    onTap: (){
                                      NavigationService.push(RoutesRestaurants.orderMapScreen,arguments: {'orderId':orderId,'orderTotal':orderModelData?.price??'0.0'});
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomStepsOrderWidget(text: LocaleKeys.ordered.tr(),isDone: padding,),
                                        CustomStepsOrderWidget(text: LocaleKeys.inPreparation.tr(),isDone: preparing,),
                                        CustomStepsOrderWidget(text: LocaleKeys.deliveredCourier.tr(),isDone: preparing,),
                                        CustomStepsOrderWidget(text: LocaleKeys.inDelivery.tr(),isDone:onWay ,),
                                        CustomStepsOrderWidget(text: LocaleKeys.delivered.tr(),isDone:isDone),
                                      ],
                                    ),
                                  ),
                                  verticalSpace(20),
                                ],
                              ),
                            ),
                          ),
                          ...cubit.orderDetailsModel?.data?.orderDetails?.map((e) =>  CustomOrderDetailsItemWidget(orderDetailsModelData: e,))??[],
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpace(20),
                                // Text(LocaleKeys.paymentMethod.tr(),style: TextStyles.font20Black700Weight.copyWith(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 16.sp
                                // ),),
                                // verticalSpace(10),
                                // const CustomVisaWidget(),
                                // verticalSpace(10),
                                Text(LocaleKeys.orderSummary.tr(),style: TextStyles.font20Black700Weight.copyWith(
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
                                      CustomTextRowCartWidget(title: LocaleKeys.subtotal.tr(), text: '${orderModelData?.price??'0.0'} ${LocaleKeys.lyd.tr()}',vertical: 7.h,),
                                      // CustomTextRowCartWidget(title: LocaleKeys.discount.tr(), text: '${orderModelData?.discount??'0.0'} ${LocaleKeys.lyd.tr()}',vertical: 7.h,),
                                      CustomTextRowCartWidget(title: LocaleKeys.shipping.tr(), text: '${orderModelData?.tripModel?.data?.price?.toString()??'0.0'} ${LocaleKeys.lyd.tr()}',vertical: 7.h,),
                                      CustomTextRowCartWidget(title: LocaleKeys.total.tr(), text: '${(double.parse(orderModelData?.price?.toString()??'0.0') +(double.parse(orderModelData?.tripModel?.data?.price?.toString()??'0.0')))} ${LocaleKeys.lyd.tr()}',vertical: 7.h,),
                                      verticalSpace(50),
                                    ],
                                  ),
                                ),
                                // Row(
                                //   children: [
                                //     Expanded(child:
                                //     CustomElevatedButton(
                                //         backgroundColor: AppColors.whiteColor,
                                //         borderColor: AppColors.primaryColor,
                                //         fontColor: AppColors.primaryColor,
                                //         borderRadius: 8,
                                //         height: 40.h,
                                //         onTap: (){
                                //           context.pushNamed(RoutesRestaurants.rateScreen,arguments: {'orderId':orderId});
                                //         },
                                //         buttonText: LocaleKeys.rate_trip.tr()),),
                                //     horizontalSpace(10),
                                //     Expanded(child:
                                //     CustomElevatedButton(
                                //         backgroundColor: AppColors.whiteColor,
                                //         borderColor: AppColors.primaryColor,
                                //         fontColor: AppColors.primaryColor,
                                //         borderRadius: 8,
                                //         height: 40.h,
                                //         onTap: (){
                                //           context.pushNamed(RoutesRestaurants.rateScreen,arguments: {'orderId':orderId});
                                //         },
                                //         buttonText: LocaleKeys.rate_restaurant.tr()),),
                                //   ],
                                // )

                              ],
                            ),
                          )

                        ],
                      ),

                ),);
              }
            }
            else{
              return CustomLoadingWidget();
            }

          },
        ),

    );
  }
  List items =[1,2,3,4];
}
