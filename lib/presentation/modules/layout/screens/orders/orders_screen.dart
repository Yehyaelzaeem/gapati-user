import 'package:cogina/core/global/styles/colors.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import 'package:cogina/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:cogina/presentation/modules/layout/screens/orders/widgets/custom_order_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/assets_constant/images.dart';
import '../../../../component/custom_app_bar.dart';
import '../../../../component/custom_loading_widget.dart';
import '../../../../component/custom_not_found_data.dart';
import '../../../visitor/visitor_screen.dart';
import 'orders_cubit.dart';



class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersCubit cubit =OrdersCubit.get(context);
    cubit.getOrders();
    return
      HomeCubit.get(context).token!=null&&HomeCubit.get(context).token!.isNotEmpty?
      Scaffold(
      backgroundColor: AppColors.customWhite,
      appBar:    CustomAppBar(
        title: LocaleKeys.orders.tr(),
        isBackButtonExist: false,
      ),
      body:  BlocConsumer<OrdersCubit,OrdersState>(
        builder: (context,state){
          if(cubit.orderModel!=null){
            if(cubit.orderModel!.data!.isEmpty){
              return CustomNotFoundDataWidget(image: AppImages.cart,title: LocaleKeys.notFoundData.tr(), type: 'svg',);
            }else{
              return ListView.builder(
                  itemCount: cubit.orderModel!.data!.length,
                  itemBuilder: (context,index){
                return CustomOrderItemWidget(orderModelData: cubit.orderModel!.data![index],);
              });
            }
          }
          else{
            return CustomLoadingWidget();
          }

        },
        listener: (context,state){},
      )
    ):
       CustomVisitorScreen(screenName: 'orders',);
  }
}
