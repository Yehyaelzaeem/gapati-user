import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../core/routing/navigation_services.dart';
import '../../../../core/routing/routes.dart';
import '../../../component/custom_text_field.dart';
import '../restaurant_cubit.dart';
import '../widgets/custom_best_meals_widgets.dart';
import '../widgets/shimmer_categories_restaurant.dart';
import 'package:badges/badges.dart' as badges;

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key, required this.id, required this.storeName});
  final int id;
  final String storeName;

  @override
  Widget build(BuildContext context) {
    RestaurantCubit cubit =RestaurantCubit.get(context);
    CartCubit cartCubit =CartCubit.get(context);
    // cartCubit.getCart(context);
    cubit.getCategories(id: id);
    return  DefaultTabController(
      length: 3,
      child: BlocConsumer<RestaurantCubit, RestaurantState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Scaffold(
                    backgroundColor:AppColors.backGroundPink ,
                    body:
                    Stack(
                      fit: StackFit.expand,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                                height: 280.h,
                                child:
                                Image.asset(RestaurantImages.mc1,fit: BoxFit.cover,)
                            ),
                          ],
                        ),
                        Positioned(
                            top: 60.h,
                            left: context.locale.languageCode==Locale('en').toString()?10.w:null,
                            right: context.locale.languageCode==Locale('en').toString()?null:10.w,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.whiteColor,
                                    boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 7,
                                        offset: Offset(1, 5)
                                    )]
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Icon(Icons.arrow_back_ios_new_rounded,size: 18,color: AppColors.customGray.withOpacity(0.4),),
                                ),
                              ),
                            )),
                        Positioned(
                            top: 120.h,
                            left: 0,
                            right: 0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                horizontalSpace(1),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.7,
                                  height: 45.h,
                                  child: CustomTextField(
                                    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                                    fillColor: AppColors.whiteColor.withOpacity(0.6),
                                    borderColor: AppColors.whiteColor.withOpacity(0.0),
                                    borderRadius: 30,
                                    prefixIcon: const Icon(Icons.search),
                                    hintText: LocaleKeys.search.tr(),
                                    hintColor: AppColors.black,
                                    controller: TextEditingController(),),
                                ),
                                BlocConsumer<CartCubit, CartState>(
                                          listener: (context, state) {},
                                          builder: (context, state) {
                                            return InkWell(
                                                      onTap: (){
                                                        NavigationService.push(
                                                            RoutesRestaurants.cartScreen,
                                                            arguments: {'isLayout': false});
                                                      },
                                                      child:
                                                      badges.Badge(
                                                         position: badges.BadgePosition.topEnd(top: -15,end:
                                                         context.locale.languageCode==Locale('en').toString()? -25:30),
                                                        showBadge: cartCubit.products.isNotEmpty?true:false,
                                                        ignorePointer: false,
                                                        onTap: () {},
                                                        badgeContent:
                                                        Text('${cartCubit.products.isNotEmpty?cartCubit.products.length:'0'}',
                                                        style: TextStyles.font14White500Weight,
                                                        ),
                                                        badgeAnimation: badges.BadgeAnimation.rotation(
                                                          animationDuration: Duration(seconds: 1),
                                                          colorChangeAnimationDuration: Duration(seconds: 1),
                                                          loopAnimation: false,
                                                          curve: Curves.fastOutSlowIn,
                                                          colorChangeAnimationCurve: Curves.easeInCubic,
                                                        ),
                                                        child: Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 30,)
                                                      ),);
                                          },
                                        ),
                                horizontalSpace(1),

                                  // const Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 30,))
                              ],
                            ),
                            ),
                        Positioned.fill(
                          top: 236.h,
                          child:
                          cubit.categoriesModelList!=null?
                          cubit.categoriesModelList!.isNotEmpty?
                          Container(
                              decoration:  BoxDecoration(
                                  color: AppColors.customWhite,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child:
                              StatefulBuilder(builder: (context,setState){
                                return  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TabBar(
                                      labelStyle: TextStyles.font18Black700Weight,
                                      indicatorColor: AppColors.primaryColor,
                                      labelColor:  AppColors.primaryColor,
                                      tabs:[
                                     ...cubit.categoriesModelList!.map((e) => Tab(text: e.name))
                                      ]
                                    ),
                                     Expanded(
                                       child: TabBarView(
                                         children: [
                                           ...cubit.categoriesModelList!.map((e) =>
                                            CustomBestMealsWidget(categoryId: e.id!, storeId: id, storeName:storeName,),)
                                         ],
                                       ),
                                     ),
                                  ],
                                );
                              },)
                          ):
                              Container(
                                  decoration:  BoxDecoration(
                                      color: AppColors.customWhite,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child:  Center(child: Text(LocaleKeys.notFoundData.tr(),style: TextStyles.font18Black700Weight,),)):
                              Container(
                                  decoration:  BoxDecoration(
                                      color: AppColors.customWhite,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: const CategoriesRestaurantShimmer()),
                        ),
                      ],
                    ),
                  );
              },
            ),
    );
  }
}
