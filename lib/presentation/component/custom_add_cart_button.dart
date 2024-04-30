import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/global/styles/colors.dart';
import '../../core/helpers/toast_states/enums.dart';
import '../../core/translations/locale_keys.dart';
import '../../data/model/response/category_item_model.dart';
import '../modules/layout/screens/cart/cart_cubit.dart';
import 'custom_elevated_button.dart';

class CustomAddCartButton extends StatelessWidget {
  const CustomAddCartButton({super.key, required this.categoriesItemsModelData, required this.storeName, this.width, this.height, this.color});
  final CategoryItemsData categoriesItemsModelData;
  final String storeName;
  final double? width;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    CartCubit cubit =CartCubit.get(context);
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        var products =cubit.products.where((CategoryItemsData element) => element.id == categoriesItemsModelData.id );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (products.toList().length == 0)
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                child: Container(
                  width: width,
                  height: height??40.h,
                  child:
                  CustomElevatedButton(
                     backgroundColor: color,
                      borderRadius: 50,
                      height: height,
                      width: width,
                      borderColor:color?? AppColors.primaryColor,
                      fontColor: Colors.white,
                      onTap: () {
                        if(cubit.products.isEmpty){
                          cubit.addProduct(product: categoriesItemsModelData, storeName: storeName);
                        }
                        if(cubit.products[0].storeId == categoriesItemsModelData.storeId ){
                          cubit.addProduct(product: categoriesItemsModelData, storeName:storeName);
                        }
                        else{
                          showToast(text: LocaleKeys.anotherCart.tr(), state: ToastStates.error, context: context);
                        }
                      },
                      buttonText: LocaleKeys.addCart.tr()),
                ),
              ),
            if (products.toList().length > 0)
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: const CircleAvatar(
                        backgroundColor: AppColors.backGroundPink2,
                        radius: 13,
                        child: Icon(Icons.remove,color: AppColors.backGroundPink3,weight: 5,size: 20,),
                      ),
                      onTap: (){
                        cubit.removeQty(products.first);
                      },
                    ),
                    SizedBox(width: 10.w,),
                    CircleAvatar(
                      backgroundColor: AppColors.sandwichBackGround,
                      radius: 13,
                      child: Text('${products.first.count}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    InkWell(
                      child: const CircleAvatar(
                        backgroundColor: AppColors.sandwichBackGround,
                        radius: 13,
                        child: Icon(Icons.add,color: AppColors.primaryColor,weight: 5,size: 20,),
                      ),
                      onTap: (){
                        cubit.addQty(products.first);
                      },
                    ),
                  ],
                ),
              ),
              // CustomCheckButton(
              //   width: width,
              //   height:height?? 35.h,
              //   categoriesItemsModelData:categoriesItemsModelData ,),

          ],
        );
      },
    );
  }
}
