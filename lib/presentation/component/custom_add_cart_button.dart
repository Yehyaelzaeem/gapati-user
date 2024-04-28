import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/function/function.dart';
import '../../core/global/styles/colors.dart';
import '../../core/global/styles/styles.dart';
import '../../core/helpers/spacing.dart';
import '../../core/helpers/toast_states/enums.dart';
import '../../core/translations/locale_keys.dart';
import '../../data/model/response/category_item_model.dart';
import '../modules/layout/screens/cart/cart_cubit.dart';
import 'custom_check_button.dart';
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
        return Column(
          children: [
            if (cubit.products.where((CategoryItemsData element) => element.id == categoriesItemsModelData.id).toList().length == 0)
              Container(
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
                      logInFirst(function: (){
                        if( cubit.products.isEmpty){
                          cubit.addProduct(product: categoriesItemsModelData, storeName: storeName);
                        }
                        if(cubit.products[0].storeId == categoriesItemsModelData.storeId ){
                          cubit.addProduct(product: categoriesItemsModelData, storeName:storeName);
                        }else{
                          showToast(text: LocaleKeys.anotherCart.tr(), state: ToastStates.error, context: context);
                        }
                      },
                          context: context);
                    },
                    buttonText: LocaleKeys.addCart.tr()),
              ),
            if (cubit.products.where((CategoryItemsData element) => element.id == categoriesItemsModelData.id).toList().length > 0)
              CustomCheckButton(
                width: width,
                height: 35.h,
                categoriesItemsModelData:categoriesItemsModelData ,),

          ],
        );
      },
    );
  }
}
