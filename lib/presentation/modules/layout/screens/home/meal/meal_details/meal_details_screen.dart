import 'dart:async';
import 'package:badges/badges.dart' as badges;

import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/core/routing/routes.dart';

import '../../../../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../../core/global/styles/styles.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/routing/navigation_services.dart';
import '../../../../../../../data/model/response/category_item_model.dart';
import '../../../../../../../data/model/response/item_extra_model.dart';
import '../../../../../../component/choose_from_list_widget.dart';
import '../../../../../../component/drop_dowen_multi_select_widget.dart';

import '../../../../../../component/images/custom_image.dart';
import '../../../../../../component/texts/black_texts.dart';
import '../../../../../restaurant/restaurant_cubit.dart';

import '../../../cart/cart_cubit.dart';
import '../widget/custom_name_price_widget.dart';
import '../widget/custom_shimmer_chip.dart';
import '../widget/custom_top_back_widget.dart';
import '../widget/custom_top_fav_widget.dart';

class MealDetailsScreen extends StatefulWidget {
  final CategoryItemsData? categoriesItemsModelData;
  final String storeId;
  final String type;
  int? count;

  final String storeName;
  final List<ItemExtraModelData>? itemExtraList;
   MealDetailsScreen({super.key, this.categoriesItemsModelData, required this.storeId, this.count,required this.type, required this.storeName, this.itemExtraList});

  @override
  State<MealDetailsScreen> createState() => _testState();
}

class _testState extends State<MealDetailsScreen> {
  StreamController<double> priceStreamController = StreamController<double>();
  @override
  void initState() {
    productSizeData?.price = double.parse(widget.categoriesItemsModelData?.price.toString()??'0.0');
    productSizeData?.priceAfterDiscount = double.parse(widget.categoriesItemsModelData?.priceAfterDiscount.toString()??'0.0');
    priceStreamController.add(0.0);
    RestaurantCubit cubit = RestaurantCubit.get(context);
    cubit.getItemExtra(id: widget.categoriesItemsModelData!.id!,)
        .then((value) {});
    if(widget.type=='cart'){
      initData();
    }else{
      productSizeData= widget.categoriesItemsModelData?.productSize?.data?.isNotEmpty==true?
      widget.categoriesItemsModelData?.productSize?.data![0]:ProductSizeData();
      _calculatePrice();
    }

    super.initState();
  }
  initData(){
    _count=widget.count??0;
    extrasPrice=widget.categoriesItemsModelData?.itemExtraModelDataSelected?.map((e) => double.parse(e.price.toString()??'0')).toList()??[];
    productSizeData= widget.categoriesItemsModelData?.productSizeSelected?.data?.isNotEmpty==true?
        widget.categoriesItemsModelData?.productSizeSelected?.data![0]:ProductSizeData();
    _calculatePrice();
  }
  double finalPrice = 0.0;
  ProductSizeData? productSizeData;
  List<double> extrasPrice=[];
  void _calculatePrice() {
    print('dsfsdfdsf ${productSizeData?.toMap()}');
    double extrasTotal = extrasPrice.isNotEmpty
        ? extrasPrice.reduce((value, element) => value + element)
        : 0.0;
    if(widget.categoriesItemsModelData?.priceDiscount!=null&&widget.categoriesItemsModelData!.priceDiscount!='0'){
      finalPrice =   _count*((double.parse(productSizeData?.priceAfterDiscount?.toString()??(widget.categoriesItemsModelData?.priceAfterDiscount?.toString()??'0.0'))) + extrasTotal);
      priceStreamController.add(finalPrice);
    }else{
      finalPrice =   _count*((double.parse(productSizeData?.price?.toString()??(widget.categoriesItemsModelData?.price?.toString()??'0.0'))) + extrasTotal);
      priceStreamController.add(finalPrice);
    }

  }
  @override
  void dispose() {
    priceStreamController.close();
    super.dispose();
  }
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = CartCubit.get(context);
    RestaurantCubit cubit = RestaurantCubit.get(context);

    return WillPopScope(
      onWillPop: () {
        cartCubit.updateData();
        context.pop();
        return Future.value(false);
      },
      child:
      Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return
              StreamBuilder<double>(
                stream: priceStreamController.stream,
                builder: (context, snapshot)
            {
              double totalPrice = snapshot.data ?? 0.0;
              return  SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.4,
                                    child: CustomImage(image:widget.categoriesItemsModelData?.image??'',fit: BoxFit.contain,)),
                              ],
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 280.h, width: 375.w,),
                              Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomNamePriceWidget(
                                        categoriesItemsModelData: widget.categoriesItemsModelData??CategoryItemsData(),
                                        name:  widget.categoriesItemsModelData?.name??'',priceDiscount:widget.categoriesItemsModelData?.priceDiscount!=null?widget.categoriesItemsModelData!.priceDiscount!:null,
                                        price:
                                        (widget.categoriesItemsModelData!.price!=null && widget.categoriesItemsModelData!.price!.toString() !='0')?widget.categoriesItemsModelData!.price.toString():
                                        ((widget.categoriesItemsModelData?.productSize?.data?.isNotEmpty??false)? (widget.categoriesItemsModelData?.productSize?.data?[0].price??'0'):'0' ),
                                        priceAfterDiscount:
                                        (widget.categoriesItemsModelData!.priceAfterDiscount!=null && widget.categoriesItemsModelData!.priceAfterDiscount!.toString() !='0')?
                                        widget.categoriesItemsModelData!.priceAfterDiscount.toString():
                                        ((widget.categoriesItemsModelData?.productSize?.data?.isNotEmpty??false)? (widget.categoriesItemsModelData?.productSize?.data?[0].priceAfterDiscount??'0'):'0' ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w, vertical: 0.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              LocaleKeys.description.tr(),
                                              style: TextStyles.font18Black700Weight.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: AppColors.black),
                                            ),
                                            Text(
                                              '${widget.categoriesItemsModelData?.description??''}',
                                              style: TextStyles.font18Black700Weight.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: AppColors.customGray),
                                            ),
                                            verticalSpace(15),
                                            if(widget.categoriesItemsModelData?.productSize!=null && widget.categoriesItemsModelData!.productSize!.data!=null && widget.categoriesItemsModelData!.productSize!.data!.isNotEmpty)
                                              ...[
                                                Text(
                                                  LocaleKeys.size.tr(),
                                                  style: TextStyles.font18Black700Weight.copyWith(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16,
                                                      color: AppColors.black),
                                                ),
                                                ChooseFromListItemWidget(
                                                    initialSelection: widget.categoriesItemsModelData?.productSizeSelected?.data?.isNotEmpty==true?
                                                    ChooseItemListModel(id: widget.categoriesItemsModelData?.productSizeSelected?.data?[0].id??0, title: widget.categoriesItemsModelData?.productSizeSelected?.data?[0].name??'', value: widget.categoriesItemsModelData?.productSizeSelected?.data?[0].price.toString()??'0', value2: widget.categoriesItemsModelData?.productSizeSelected?.data?[0].priceAfterDiscount.toString()??'0'):null,
                                                    onChoose: (ChooseItemListModel item) {
                                                      productSizeData = ProductSizeData(
                                                          id: item.id,
                                                          name: item.title,
                                                          price: item.value,
                                                          priceAfterDiscount: item.value2,
                                                      );
                                                       _calculatePrice();
                                                      if(widget.type=='cart'){
                                                        if (cartCubit.products.where((CategoryItemsData element) => element.id == widget.categoriesItemsModelData!.id ).toList().length > 0){
                                                          cartCubit.updateProductSize(widget.categoriesItemsModelData!,
                                                              productSizeData??ProductSizeData()
                                                            // ProductSizeData(id: widget.categoriesItemsModelData?.productSizeSelected?.data?[0].id??0, name: widget.categoriesItemsModelData?.productSizeSelected?.data?[0].name??'', value: widget.categoriesItemsModelData?.productSizeSelected?.data?[0].price.toString()??'0', value2: widget.categoriesItemsModelData?.productSizeSelected?.data?[0].priceAfterDiscount.toString()??'0'):null,
                                                          );
                                                        }
                                                      }
                                                    },
                                                    items: widget.categoriesItemsModelData?.productSize?.data?.map((e) =>
                                                        ChooseItemListModel(id: e.id??0, title: e.name??'', value: e.price.toString()??'0', value2: e.priceAfterDiscount.toString()??'0')).toList() ??[]),

                                              ],
                                            SizedBox(height: 15.h,),
                                            BlocConsumer<RestaurantCubit, RestaurantState>(
                                              listener: (context, state) {},
                                              builder: (context, state) {
                                                return
                                                  cubit.itemExtraModelDataList!=null?
                                                  cubit.itemExtraModelDataList!.isNotEmpty ?
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                            vertical: 0,
                                                            horizontal: 0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              LocaleKeys.extraComponents.tr(),
                                                              style: TextStyles.font18Black700Weight.copyWith(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 16,
                                                                  color: AppColors.black),
                                                            ),
                                                            verticalSpace(15),


                                                            StatefulBuilder(builder: (context,setState){
                                                              // categoriesItemsModelData!.itemExtraModelMain!=cubit.itemExtraModelDataList;
                                                              List<ItemExtraModelData>? initialSelection;
                                                              if(cartCubit.products.isNotEmpty&&widget.type!='cart'){
                                                                if(cartCubit.products.where((element) =>
                                                                element.id==widget.categoriesItemsModelData!.id!).length!=0){
                                                                  CategoryItemsData lastProducts =cartCubit.products.lastWhere((element) =>
                                                                  element.id==widget.categoriesItemsModelData!.id!);
                                                                  if(cartCubit.products.where((element) =>
                                                                  element.id==widget.categoriesItemsModelData!.id!).length!=0){
                                                                    initialSelection = cubit.itemExtraModelDataList!.where((element) =>
                                                                    lastProducts.itemExtraModelDataSelected!=null&&lastProducts.itemExtraModelDataSelected!.isNotEmpty&&
                                                                        lastProducts.itemExtraModelDataSelected!.any((e) => e.id == element.id)).toList();
                                                                  }
                                                                }
                                                              }

                                                              List<DropDownItemData>? itemsInitialSelection = [];

                                                              if (widget.type == 'cart') {
                                                                itemsInitialSelection = cubit.itemExtraModelDataList
                                                                    ?.where((item) =>
                                                                widget.itemExtraList?.any((element) => element.id == item.id) ?? false)
                                                                    .map((item) =>
                                                                    DropDownItemData(id: item.id.toString(), title: item.name.toString(), value:item.price.toString()))
                                                                    .toList();
                                                              } else {
                                                                itemsInitialSelection = initialSelection?.map((item) =>  DropDownItemData(id: item.id.toString(), title: item.name.toString(), value:item.price.toString()))
                                                                    .toList()??[];
                                                              }
                                                              return Column(
                                                                children: [
                                                                  DropdownMultiSelectWidget(
                                                                      selectedItems: (List<DropDownItemData> selectedItems ) {
                                                                        widget.categoriesItemsModelData!.itemExtraModelDataSelected = selectedItems.map((e) => ItemExtraModelData(
                                                                          id: int.parse(e.id),
                                                                          name: e.title,
                                                                          price: e.value,
                                                                        )).toList();
                                                                        extrasPrice= widget.categoriesItemsModelData?.itemExtraModelDataSelected?.map((e) => double.parse(e.price.toString()??'0')).toList()??[];
                                                                        _calculatePrice();
                                                                        if(widget.type=='cart'){
                                                                          if (cartCubit.products.where((CategoryItemsData element) => element.id == widget.categoriesItemsModelData!.id ).toList().length > 0){
                                                                            cartCubit.updateExtra(widget.categoriesItemsModelData!,  selectedItems.map((e) => ItemExtraModelData(
                                                                              id: int.parse(e.id),
                                                                              name: e.title,
                                                                              price: e.value,
                                                                            )).toList());
                                                                          }
                                                                        }

                                                                      },
                                                                      hint: LocaleKeys.extraComponents.tr(),
                                                                      items:  cubit.itemExtraModelDataList?.map((e) =>
                                                                          DropDownItemData(id: e.id.toString(), title: e.name??'', value:e.price??'0')).toList()??[],
                                                                      itemsInitialSelection: itemsInitialSelection??[]
                                                                  ),
                                                                  verticalSpace(20),
                                                                  // MultiSelectChip(
                                                                  //     onSelectionChanged: (value){
                                                                  //       categoriesItemsModelData!.itemExtraModelDataSelected = value.map((e) => e).toList();
                                                                  //       // log('value d', value.map((e) => e.toJson()).toList().toString());
                                                                  //       if(type=='cart'){
                                                                  //         if (cartCubit.products.where((CategoryItemsData element) => element.id == categoriesItemsModelData!.id ).toList().length > 0){
                                                                  //           cartCubit.updateExtra(categoriesItemsModelData!, value.map((e) => e).toList());
                                                                  //         }
                                                                  //       }
                                                                  //     },
                                                                  //     reportList: cubit.itemExtraModelDataList!,
                                                                  //     initialSelection:
                                                                  //     type=='cart'?
                                                                  //     cubit.itemExtraModelDataList?.where((item) =>
                                                                  //     itemExtraList?.any((element) => element.id == item.id) ?? false).toList() :initialSelection
                                                                  //
                                                                  // ),

                                                                ],
                                                              );
                                                            })
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ): const SizedBox.shrink()
                                                      : Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CustomShimmerChip(),
                                                          CustomShimmerChip(),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          CustomShimmerChip(),
                                                          CustomShimmerChip(),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                              },
                                            ),
                                            SizedBox(height: 15.h,),
                                          ],
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                              height: 170.h,
                                              width: double.infinity,
                                              child: SizedBox()
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 265.w,
                                            child: Container(
                                              height: 170.h,
                                              width: 50.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius: BorderRadius.only(
                                                      bottomRight: Radius.circular(60),
                                                      topRight: Radius.circular(60)
                                                  )
                                              ),
                                              child: Center(),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 25.h,
                                            top: 25.h,
                                            left: 50.w,
                                            right: 41.w,
                                            child:
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: AppColors.whiteColor,
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(50),
                                                      topLeft: Radius.circular(50)
                                                  )
                                              ),
                                              child:  Center(
                                                  child:
                                                 StatefulBuilder(builder: (context,setState){
                                                   return   Column(
                                                     children: [
                                                       Column(
                                                         children: [
                                                           BlackRegularText(label: '${LocaleKeys.totalPrice.tr()}',fontSize: 12.sp,),
                                                           verticalSpace(5),
                                                           BlackBoldText(label: '${totalPrice.toStringAsFixed(1)} ${LocaleKeys.lyd.tr()}',fontSize: 20.sp,),
                                                         ],
                                                       ),
                                                       Padding(
                                                           padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                                                           child:
                                                           FittedBox(
                                                             fit: BoxFit.scaleDown,
                                                             child:    Row(
                                                               mainAxisAlignment: MainAxisAlignment.center,
                                                               children: [
                                                                 InkWell(
                                                                   onTap: (){
                                                                     if(widget.type=='cart'){
                                                                       if(_count>0) {
                                                                         setState(() {
                                                                           _count--;
                                                                         });
                                                                       }
                                                                       cartCubit.removeQty(widget.categoriesItemsModelData!,cartCubit.products.indexOf(widget.categoriesItemsModelData!));

                                                                       _calculatePrice();

                                                                     }else{
                                                                       if(_count>0) {
                                                                         setState(() {
                                                                           _count--;
                                                                         });
                                                                       }
                                                                       _calculatePrice();
                                                                     }


                                                                     // cubit.removeQty(products.last);

                                                                   },
                                                                   child: Container(
                                                                     height: 30.h,
                                                                     width: 50.w,
                                                                     decoration: BoxDecoration(
                                                                         color: AppColors.primaryColor,
                                                                         border: Border.all(color: AppColors.primaryColor),
                                                                         borderRadius: BorderRadius.circular(15)),
                                                                     child: Icon(Icons.remove,color: AppColors.whiteColor,weight: 5,size: 15,),
                                                                   ),
                                                                 ),

                                                                 SizedBox(width: 5.w,),
                                                                 Container(
                                                                     height: 30.h,
                                                                     width: 50.w,
                                                                     decoration: BoxDecoration(
                                                                         color: AppColors.whiteColor,
                                                                         border: Border.all(color: AppColors.primaryColor),
                                                                         borderRadius: BorderRadius.circular(15)),
                                                                     child: Center(
                                                                       child: Text('${_count}',
                                                                         style: const TextStyle(
                                                                             color:AppColors.primaryColor,
                                                                             fontSize: 13
                                                                         ),
                                                                       ),
                                                                     )
                                                                 ),

                                                                 SizedBox(width: 5.w,),
                                                                 InkWell(
                                                                   onTap: (){
                                                                     if(widget.type=='cart'){
                                                                       setState(() {
                                                                         _count++;
                                                                       });
                                                                       _calculatePrice();
                                                                       cartCubit.addQty(widget.categoriesItemsModelData!,cartCubit.storeName??'');
                                                                     }else {
                                                                       setState(() {
                                                                         _count++;
                                                                       });
                                                                       _calculatePrice();
                                                                       print('dsfsdfdsf ${productSizeData?.toMap()}');
                                                                     }



                                                                   },
                                                                   child: Container(
                                                                     height: 30.h,
                                                                     width: 50.w,
                                                                     decoration: BoxDecoration(
                                                                         color: AppColors.primaryColor,
                                                                         border: Border.all(color: AppColors.primaryColor),
                                                                         borderRadius: BorderRadius.circular(15)),
                                                                     child: Icon(Icons.add,color: AppColors.whiteColor,weight: 5,size: 15,),
                                                                   ),
                                                                 ),

                                                               ],
                                                             ),
                                                           )
                                                       ),

                                                     ],
                                                   );
                                                 }),
                                                // CustomAddCartButton(
                                                //   hasTotal: true,
                                                //   type: type,
                                                //   width: 200.w,
                                                //   categoriesItemsModelData:  categoriesItemsModelData??CategoryItemsData(), storeName: storeName??'',),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 50.h,
                                            right: 41.w,
                                            child:
                                            Container(
                                                child:
                                                BlocConsumer<CartCubit, CartState>(
                                                  listener: (context, state) {},
                                                  builder: (context, state) {
                                                    return InkWell(
                                                      onTap: () {
                                                        NavigationService.push(RoutesRestaurants.cartScreen,
                                                            arguments: {'isLayout': false});
                                                      },
                                                      child: badges.Badge(
                                                          position: badges.BadgePosition.topEnd(
                                                              top: -15,
                                                              end: context.locale.languageCode ==
                                                                  Locale('en').toString()
                                                                  ? -25
                                                                  : 30),
                                                          showBadge:
                                                          cartCubit.products.isNotEmpty ? true : false,
                                                          ignorePointer: false,
                                                          onTap: () {},
                                                          badgeContent: Padding(
                                                            padding: EdgeInsets.only(top: 3.5, right: 1),
                                                            child: Text(
                                                              '${cartCubit.products.isNotEmpty ? cartCubit.products.length : '0'}',
                                                              style: TextStyles.font14White500Weight,
                                                            ),
                                                          ),
                                                          badgeAnimation: badges.BadgeAnimation.rotation(
                                                            animationDuration: Duration(seconds: 1),
                                                            colorChangeAnimationDuration:
                                                            Duration(seconds: 1),
                                                            loopAnimation: false,
                                                            curve: Curves.fastOutSlowIn,
                                                            colorChangeAnimationCurve: Curves.easeInCubic,
                                                          ),
                                                          child: Icon(Icons.shopping_cart,
                                                            color: AppColors.primaryColor,),),
                                                    );
                                                  },
                                                ),

                                            ),
                                          ),
                                        ],
                                      ),
                                      verticalSpace(20),
                                     if(widget.type!='cart')
                                     ...[ if(_count>0)
                                      Center(
                                        child:
                                        Container(
                                          alignment: Alignment.center,
                                          height:45.h,
                                          child:
                                          InkWell(
                                            onTap: ()async{
                                              CategoryItemsData product = CategoryItemsData(
                                                  id: widget.categoriesItemsModelData?.id??0,
                                                  name: widget.categoriesItemsModelData?.name??'',
                                                  description: widget.categoriesItemsModelData?.description??'',
                                                  categoryId: widget.categoriesItemsModelData?.categoryId??0,
                                                  categoryName: widget.categoriesItemsModelData?.categoryName??'',
                                                  price: productSizeData?.price?? (widget.categoriesItemsModelData?.price??0),
                                                  priceDiscount: widget.categoriesItemsModelData?.priceDiscount??0,
                                                  priceAfterDiscount:
                                                  productSizeData?.priceAfterDiscount??
                                                   (widget.categoriesItemsModelData?.priceAfterDiscount??0),
                                                  storeId: widget.categoriesItemsModelData?.storeId??0,
                                                  image: widget.categoriesItemsModelData?.image??'',
                                                  inCart: widget.categoriesItemsModelData?.inCart??false,
                                                  inFav: widget.categoriesItemsModelData?.inFav??false,
                                                  count: _count,
                                                  branchId: widget.categoriesItemsModelData?.branchId??0,
                                                  productSize: widget.categoriesItemsModelData?.productSize,
                                                  productSizeSelected: ProductSize(
                                                    data:[
                                                      ProductSizeData(
                                                        id: productSizeData?.id??0,
                                                        name: productSizeData?.name??'',
                                                        nameEn: productSizeData?.nameEn??'',
                                                        nameAr: productSizeData?.nameAr??'',
                                                        price: productSizeData?.price??0,
                                                        priceAfterDiscount: productSizeData?.priceAfterDiscount??0,
                                                      ),

                                                    ]
                                                  ),
                                                  itemExtraModelDataSelected: widget.categoriesItemsModelData?.itemExtraModelDataSelected??null,
                                                );
                                              print(product.toJson());
                                             await cartCubit.addProduct(product: product, storeName: widget.storeName).then((value)  {
                                               if(value==true){
                                                 _count=0;
                                                 _calculatePrice();
                                               }
                                             });

                                              },
                                            child: Container(
                                              height: 45.h,
                                              // width: MediaQuery.sizeOf(context).width*0.8,
                                              padding: EdgeInsets.symmetric(horizontal: 20.w)+EdgeInsets.only(top: 5.h),
                                                decoration: BoxDecoration(
                                                    color: AppColors.primaryColor,
                                                    border: Border.all(color: AppColors.primaryColor),
                                                    borderRadius: BorderRadius.circular(12)),
                                                child:
                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    BlackBoldText(label: '${LocaleKeys.addCart.tr()}',fontSize: 12.sp,
                                                      labelColor: Colors.white,
                                                    ),
                                                    horizontalSpace(10),
                                                    Icon(Icons.add_shopping_cart_outlined,color: AppColors.whiteColor,weight: 5,size: 15,)
                                                  ],
                                                ),
                                            ),
                                          ),

                                          // CustomElevatedButton(
                                          //     backgroundColor: color,
                                          //     borderRadius: 50,
                                          //     height: height,
                                          //     width: width,
                                          //     borderColor:color?? AppColors.primaryColor,
                                          //     fontColor: Colors.white,
                                          //     onTap: () {
                                          //       if(cubit.products.isEmpty){
                                          //         cubit.addProduct(product: categoriesItemsModelData, storeName: storeName);
                                          //       }
                                          //       if(cubit.products[0].storeId == categoriesItemsModelData.storeId ){
                                          //         cubit.addProduct(product: categoriesItemsModelData, storeName:storeName);
                                          //       }
                                          //       else{
                                          //         showToast(text: LocaleKeys.anotherCart.tr(), state: ToastStates.error, context: context);
                                          //       }
                                          //     },
                                          //     buttonText: LocaleKeys.addCart.tr()),
                                        ),
                                      )]
                                    ],
                                  )),
                              SizedBox(height: 50.h,),
                            ],
                          ),
                        ),
                        CustomTopFavWidget(categoryItemsData: widget.categoriesItemsModelData?? CategoryItemsData(),),
                        CustomTopBackWidget(type: widget.type,),
                      ],
                    )
                  ],
                ),
              );
            });
          },
        ),
      ),);
  }

}


 // Widget ssads (){
 //  return Scaffold(
 //    backgroundColor: Colors.white,
 //    body: BlocBuilder<CartCubit, CartState>(
 //      // listener: (context, state) {},
 //      builder: (context, state) {
 //        return Stack(
 //          fit:StackFit.expand ,
 //          children: [
 //            Stack(
 //              children: [
 //                SizedBox(
 //                    width: MediaQuery.of(context).size.width,
 //                    height: MediaQuery.of(context).size.height * 0.4,
 //                    child: CustomImage(image:categoriesItemsModelData?.image??'')),
 //                CustomTopBackWidget(type: type,),
 //
 //              ],
 //            ),
 //            Positioned.fill(
 //                top: MediaQuery.of(context).size.height * 0.25,
 //                child:
 //                Stack(
 //                  children: [
 //                    Positioned(
 //                      top: MediaQuery.of(context).size.height * 0.10,
 //                      left: 0,
 //                      right: 0,
 //                      child:  SingleChildScrollView(
 //                        padding: EdgeInsets.only(bottom: 100.h),
 //                        physics: BouncingScrollPhysics(),
 //                        child:
 //                        Column(
 //                          children: [
 //                            Container(
 //                                decoration: BoxDecoration(
 //                                    color: AppColors.whiteColor,
 //                                    borderRadius: BorderRadius.circular(20)),
 //                                child: Column(
 //                                  crossAxisAlignment: CrossAxisAlignment.start,
 //                                  children: [
 //                                    CustomNamePriceWidget(
 //                                      categoriesItemsModelData: categoriesItemsModelData??CategoryItemsData(),
 //                                      name:  categoriesItemsModelData!.name!,priceDiscount:categoriesItemsModelData!.priceDiscount!=null?categoriesItemsModelData!.priceDiscount!:null,
 //                                      price:categoriesItemsModelData!.price!=null?categoriesItemsModelData!.price.toString():null,
 //                                      priceAfterDiscount:categoriesItemsModelData!.priceAfterDiscount!=null?categoriesItemsModelData!.priceAfterDiscount.toString():null,
 //                                    ),
 //                                    Padding(
 //                                      padding: EdgeInsets.symmetric(
 //                                          horizontal: 16.w, vertical: 0.h),
 //                                      child: Column(
 //                                        crossAxisAlignment: CrossAxisAlignment.start,
 //                                        children: [
 //                                          Text(
 //                                            LocaleKeys.description.tr(),
 //                                            style: TextStyles.font18Black700Weight.copyWith(
 //                                                fontWeight: FontWeight.w500,
 //                                                fontSize: 16,
 //                                                color: AppColors.black),
 //                                          ),
 //                                          Text(
 //                                            '${categoriesItemsModelData!.description}',
 //                                            style: TextStyles.font18Black700Weight.copyWith(
 //                                                fontWeight: FontWeight.w400,
 //                                                fontSize: 12,
 //                                                color: AppColors.customGray),
 //                                          ),
 //                                          verticalSpace(15),
 //                                          BlocConsumer<RestaurantCubit, RestaurantState>(
 //                                            listener: (context, state) {},
 //                                            builder: (context, state) {
 //
 //                                              return
 //                                                cubit.itemExtraModelDataList!=null?
 //                                                cubit.itemExtraModelDataList!.isNotEmpty ?
 //                                                Column(
 //                                                  crossAxisAlignment: CrossAxisAlignment.start,
 //                                                  children: [
 //                                                    Padding(
 //                                                      padding: const EdgeInsets.symmetric(
 //                                                          vertical: 0,
 //                                                          horizontal: 0),
 //                                                      child: Column(
 //                                                        crossAxisAlignment: CrossAxisAlignment.start,
 //                                                        children: [
 //                                                          Text(
 //                                                            LocaleKeys.extraComponents.tr(),
 //                                                            style: TextStyles.font18Black700Weight.copyWith(
 //                                                                fontWeight: FontWeight.w500,
 //                                                                fontSize: 16,
 //                                                                color: AppColors.black),
 //                                                          ),
 //                                                          verticalSpace(15),
 //
 //
 //                                                          StatefulBuilder(builder: (context,setState){
 //                                                            // categoriesItemsModelData!.itemExtraModelMain!=cubit.itemExtraModelDataList;
 //                                                            List<ItemExtraModelData>? initialSelection;
 //                                                            if(cartCubit.products.isNotEmpty&&type!='cart'){
 //                                                              if(cartCubit.products.where((element) =>
 //                                                              element.id==categoriesItemsModelData!.id!).length!=0){
 //                                                                CategoryItemsData lastProducts =cartCubit.products.lastWhere((element) =>
 //                                                                element.id==categoriesItemsModelData!.id!);
 //                                                                if(cartCubit.products.where((element) =>
 //                                                                element.id==categoriesItemsModelData!.id!).length!=0){
 //                                                                  initialSelection = cubit.itemExtraModelDataList!.where((element) =>
 //                                                                  lastProducts.itemExtraModelDataSelected!=null&&lastProducts.itemExtraModelDataSelected!.isNotEmpty&&
 //                                                                      lastProducts.itemExtraModelDataSelected!.any((e) => e.id == element.id)).toList();
 //                                                                }
 //                                                              }
 //                                                            }
 //                                                            List<DropDownItemData>? itemsInitialSelection = [];
 //
 //                                                            if (type == 'cart') {
 //                                                              itemsInitialSelection = cubit.itemExtraModelDataList
 //                                                                  ?.where((item) =>
 //                                                              itemExtraList?.any((element) => element.id == item.id) ?? false)
 //                                                                  .map((item) =>
 //                                                                  DropDownItemData(id: item.id.toString(), title: item.name.toString(), value:item.price.toString()))
 //                                                                  .toList();
 //                                                            } else {
 //                                                              itemsInitialSelection = initialSelection?.map((item) =>  DropDownItemData(id: item.id.toString(), title: item.name.toString(), value:item.price.toString()))
 //                                                                  .toList()??[];
 //                                                            }
 //                                                            return Column(
 //                                                              children: [
 //                                                                DropdownMultiSelectWidget(
 //                                                                    selectedItems: (List<DropDownItemData> selectedItems ) {
 //                                                                      categoriesItemsModelData!.itemExtraModelDataSelected = selectedItems.map((e) => ItemExtraModelData(
 //                                                                        id: int.parse(e.id),
 //                                                                        name: e.title,
 //                                                                        price: e.value,
 //                                                                      )).toList();
 //                                                                      if(type=='cart'){
 //                                                                        if (cartCubit.products.where((CategoryItemsData element) => element.id == categoriesItemsModelData!.id ).toList().length > 0){
 //                                                                          cartCubit.updateExtra(categoriesItemsModelData!,  selectedItems.map((e) => ItemExtraModelData(
 //                                                                            id: int.parse(e.id),
 //                                                                            name: e.title,
 //                                                                            price: e.value,
 //                                                                          )).toList());
 //                                                                        }
 //                                                                      }
 //
 //                                                                    },
 //                                                                    hint: LocaleKeys.extraComponents.tr(),
 //                                                                    items:  cubit.itemExtraModelDataList?.map((e) =>
 //                                                                        DropDownItemData(id: e.id.toString(), title: e.name??'', value:e.price??'0')).toList()??[],
 //                                                                    itemsInitialSelection: itemsInitialSelection??[]
 //                                                                ),
 //                                                                verticalSpace(20),
 //                                                                // MultiSelectChip(
 //                                                                //     onSelectionChanged: (value){
 //                                                                //       categoriesItemsModelData!.itemExtraModelDataSelected = value.map((e) => e).toList();
 //                                                                //       // log('value d', value.map((e) => e.toJson()).toList().toString());
 //                                                                //       if(type=='cart'){
 //                                                                //         if (cartCubit.products.where((CategoryItemsData element) => element.id == categoriesItemsModelData!.id ).toList().length > 0){
 //                                                                //           cartCubit.updateExtra(categoriesItemsModelData!, value.map((e) => e).toList());
 //                                                                //         }
 //                                                                //       }
 //                                                                //     },
 //                                                                //     reportList: cubit.itemExtraModelDataList!,
 //                                                                //     initialSelection:
 //                                                                //     type=='cart'?
 //                                                                //     cubit.itemExtraModelDataList?.where((item) =>
 //                                                                //     itemExtraList?.any((element) => element.id == item.id) ?? false).toList() :initialSelection
 //                                                                //
 //                                                                // ),
 //
 //                                                              ],
 //                                                            );
 //                                                          })
 //                                                        ],
 //                                                      ),
 //                                                    )
 //                                                  ],
 //                                                ): const SizedBox.shrink()
 //                                                    : Column(
 //                                                  children: [
 //                                                    Row(
 //                                                      children: [
 //                                                        CustomShimmerChip(),
 //                                                        CustomShimmerChip(),
 //                                                      ],
 //                                                    ),
 //                                                    Row(
 //                                                      children: [
 //                                                        CustomShimmerChip(),
 //                                                        CustomShimmerChip(),
 //                                                      ],
 //                                                    ),
 //                                                  ],
 //                                                );
 //                                            },
 //                                          ),
 //                                          SizedBox(height: 15.h,),
 //
 //
 //
 //                                        ],
 //                                      ),
 //                                    ),
 //                                    Stack(
 //                                      children: [
 //                                        Container(
 //                                            height: 170.h,
 //                                            width: double.infinity,
 //                                            child: SizedBox()
 //                                        ),
 //                                        Positioned(
 //                                          bottom: 0,
 //                                          left: 0,
 //                                          right: 265.w,
 //                                          child: Container(
 //                                            height: 170.h,
 //                                            width: 50.w,
 //                                            decoration: BoxDecoration(
 //                                                color: AppColors.primaryColor,
 //                                                borderRadius: BorderRadius.only(
 //                                                    bottomRight: Radius.circular(60),
 //                                                    topRight: Radius.circular(60)
 //                                                )
 //                                            ),
 //                                            child: Center(),
 //                                          ),
 //                                        ),
 //                                        Positioned(
 //                                          bottom: 25.h,
 //                                          top: 25.h,
 //                                          left: 50.w,
 //                                          right: 41.w,
 //                                          child: Container(
 //                                            decoration: BoxDecoration(
 //                                                color: AppColors.whiteColor,
 //                                                borderRadius: BorderRadius.only(
 //                                                    bottomLeft: Radius.circular(50),
 //                                                    topLeft: Radius.circular(50)
 //                                                )
 //                                            ),
 //                                            child:  Center(
 //                                              child: CustomAddCartButton(
 //                                                hasTotal: true,
 //                                                type: type,
 //                                                width: 200.w,
 //                                                categoriesItemsModelData:  categoriesItemsModelData!, storeName: storeName,),
 //                                            ),
 //                                          ),
 //                                        ),
 //                                        Positioned(
 //                                          top: 50.h,
 //                                          right: 41.w,
 //                                          child: Container(
 //                                              child:  InkWell(
 //                                                child: Icon(Icons.shopping_cart,
 //                                                  color: AppColors.primaryColor,),
 //                                                onTap: (){
 //                                                  NavigationService.push(
 //                                                      RoutesRestaurants.cartScreen,
 //                                                      arguments: {'isLayout': false});
 //
 //                                                },
 //                                              )
 //                                          ),
 //                                        ),
 //                                      ],
 //                                    ),
 //
 //                                  ],
 //                                )),
 //                          ],
 //                        ),
 //                      ),),
 //                  ],
 //                )),
 //
 //
 //            CustomTopFavWidget(categoryItemsData: categoriesItemsModelData?? CategoryItemsData(),),
 //
 //          ],
 //        );
 //      },
 //    ),
 //  ),
 //   );


 // }