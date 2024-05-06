import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../core/routing/navigation_services.dart';
import '../../../../core/routing/routes.dart';
import '../../../../data/model/response/category_item_model.dart';
import '../../../component/custom_text_field.dart';
import '../meal_details/meal_details_screen.dart';
import '../restaurant_cubit.dart';
import '../widgets/custom_best_meals_widgets.dart';
import '../widgets/custom_meal_widget.dart';
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
    return  BlocConsumer<RestaurantCubit, RestaurantState>(
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
                          top: 95.h,
                          left: context.locale.languageCode.toString()==Locale('en')?20:0,
                          right: context.locale.languageCode.toString()==Locale('en')?0:20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              horizontalSpace(1),
                              Stack(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width*0.7,
                                      height: 40.h,
                                    child: CustomTextField(
                                      contentVerticalPadding: 10,
                                      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                                      fillColor: AppColors.greyColor.withOpacity(0.85),
                                      borderColor: AppColors.whiteColor.withOpacity(0.0),
                                      borderRadius: 50,
                                      prefixIcon:  Icon(Icons.search,color: cubit.isSearchStart?AppColors.primaryColor:null,),
                                      hintText: LocaleKeys.search.tr(),
                                      hintColor: AppColors.black,
                                      onFieldSubmitted: (String v) {
                                        cubit.searchItems(searchText: v, storeId: id);
                                      },
                                      onChanged: (value) {
                                        if(value.isNotEmpty){
                                          cubit.changeSearchStart(true);
                                           cubit.searchItems(searchText: value, storeId: id);
                                        }else{
                                          cubit.changeSearchStart(false);
                                        }
                                      },
                                      controller: cubit.searchController,),
                                  ),
                                  cubit.isSearchStart == true ?
                                  Positioned(
                                    bottom: 0,
                                    top: 0,
                                    left: context.locale.languageCode.toString()=='en'?null:5,
                                    right:context.locale.languageCode.toString()=='en'? 5:null,
                                    child:
                                    Center(
                                      child: IconButton(
                                        onPressed: () {
                                          cubit.searchController.text = '';
                                          cubit.changeSearchStart(false);
                                        },
                                        icon: Icon(Icons.clear,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ) : SizedBox.shrink(),
                                ],
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
                                                      Padding(
                                                        padding:  EdgeInsets.only(top: 3.5,right: 1),
                                                        child: Text('${cartCubit.products.isNotEmpty?cartCubit.products.length:'0'}',
                                                        style: TextStyles.font14White500Weight,
                                                        ),
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
                            ],
                          ),
                          ),
                      if(cubit.isSearchStart == true)
                        Positioned.fill(
                                 top: 236.h,
                                   child:
                            Container(
                              decoration:  BoxDecoration(
                                  color: AppColors.customWhite,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if(cubit.searchItemModel!=null)
                                      if( cubit.searchItemModel!.data!.isNotEmpty)
                                        ...cubit.searchItemModel!.data!.map((e) {
                                          CategoryItemsData categoryItemsData = CategoryItemsData(
                                            id: e.id,
                                            name: e.name,
                                            description: e.description,
                                            categoryId: e.categoryId,
                                            categoryName: e.categoryName,
                                            price: e.price,
                                            priceDiscount: e.priceDiscount,
                                            priceAfterDiscount: e.priceAfterDiscount,
                                            storeId: e.storeId,
                                            image: e.image,
                                            inCart: e.incart,
                                            inFav: e.inFav,
                                            count: 1,
                                          );
                                          return InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                                  MealDetailsScreen(categoriesItemsModelData: categoryItemsData,
                                                    storeId: e.storeId.toString(), storeName: storeName, type: 'details',)));
                                            },
                                            child: CustomMealWidget(categoriesItemsModelData:categoryItemsData, storeName: storeName,),
                                          );
                                        }

                                          ,)
                                      else
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(RestaurantImages.fav),
                                            Text('${LocaleKeys.notFoundData.tr()}',
                                              style: TextStyles.font18Black700Weight.copyWith(
                                                  color: AppColors.customBlack.withOpacity(0.6)
                                              ),
                                            ),
                                            verticalSpace(100),
                                          ],
                                        )
                                    else
                                      Padding(
                                        padding: const EdgeInsets.only(top: 58.0),
                                        child: Center(child: CircularProgressIndicator(),),
                                      )
                                  ],
                                ),
                              ),
                            )
                        )
                      else
                        Positioned.fill(
                        top: 236.h,
                        child:
                        cubit.categoriesModelList!=null?
                        cubit.categoriesModelList!.isNotEmpty?
                        DefaultTabController(
                          length:cubit.categoriesModelList!.length,
                          child: Container(
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
                                     ...cubit.categoriesModelList!.map((e) => FittedBox(child: Tab(text: e.name)))
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
                          ),
                        ):
                            Container(
                                decoration:  BoxDecoration(
                                    color: AppColors.customWhite,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child:  Column(
                                  children: [
                                    SvgPicture.asset(RestaurantImages.fav,),
                                    Center(child: Text(LocaleKeys.notFoundData.tr(),style: TextStyles.font18Black700Weight,),),
                                  ],
                                )):
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
          );
  }
}
