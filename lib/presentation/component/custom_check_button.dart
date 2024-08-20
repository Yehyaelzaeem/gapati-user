
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/global/styles/colors.dart';
import '../../core/helpers/toast_states/enums.dart';
import '../../data/model/response/category_item_model.dart';
import '../modules/layout/screens/cart/cart_cubit.dart';

class CustomCheckButton extends StatelessWidget {
  const CustomCheckButton({super.key, this.categoriesItemsModelData, this.width, this.height});
  final CategoryItemsData? categoriesItemsModelData;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return     FittedBox(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
              onPressed: () {
                if(categoriesItemsModelData!=null){
                  CartCubit.get(context).removeProduct(categoriesItemsModelData!);
                }
                },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                minimumSize:  Size(width??120.w, height??40.h), // Set your desired width and height
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
