import 'package:delivego/core/assets_constant/images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/function/function.dart';
import '../../../../../../../data/model/response/category_item_model.dart';
import '../../../favorite/favorite_cubit.dart';

class CustomTopFavWidget extends StatelessWidget {
   CustomTopFavWidget({super.key, required this.categoryItemsData});
  final CategoryItemsData categoryItemsData;

  @override
  Widget build(BuildContext context) {
    FavoriteCubit favoriteCubit =FavoriteCubit.get(context);
    return
      Positioned(
        top: MediaQuery.of(context).size.height * 0.31,
        left:context.locale.languageCode==Locale('en').toString()? null:20.w,
        right:context.locale.languageCode==Locale('en').toString()? 20.w:null,
        child: StatefulBuilder(
          builder: (context, setState) {
            return

             Stack(
               children: [
                 Image.asset(AppImages.path),
                Positioned(
                  top: 12,
                  left:12,
                  right:20,
                  bottom: 20,
                  child: InkWell(onTap: (){
                  logInFirst(function: (){
                    setState(() {
                      if(categoryItemsData.inFav==false){
                        favoriteCubit.addFavorite(itemId: categoryItemsData.id!, context: context,);
                        categoryItemsData.inFav=true;
                      }else{
                        favoriteCubit.removeFavorite(itemId: categoryItemsData.id!, context: context);
                        categoryItemsData.inFav=false;
                      }
                    });
                  }, context: context, screenName: 'favoriteDetails');
                }, child:categoryItemsData.inFav==true? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_rounded,color: Colors.grey,)),
                )
               ],
             );
            //   Container(
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(50),
            //       color: AppColors.whiteColor.withOpacity(0.9),
            //       boxShadow: const [
            //         BoxShadow(
            //             color: Colors.black12,
            //             blurRadius: 7,
            //             offset: Offset(1, 5))
            //       ]),
            //   child:
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child:
            //     InkWell(onTap: (){
            //     logInFirst(function: (){
            //       setState(() {
            //         if(categoryItemsData.inFav==false){
            //           favoriteCubit.addFavorite(itemId: categoryItemsData.id!, context: context,);
            //           categoryItemsData.inFav=true;
            //         }else{
            //           favoriteCubit.removeFavorite(itemId: categoryItemsData.id!, context: context);
            //           categoryItemsData.inFav=false;
            //         }
            //       });
            //     }, context: context, screenName: 'favoriteDetails');
            //     }, child:categoryItemsData.inFav==true? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_rounded,color: Colors.grey,)),
            //   ),
            //
            // );
          },
        ));
  }
}
