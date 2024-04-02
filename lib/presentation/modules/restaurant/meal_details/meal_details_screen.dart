import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:cogina/presentation/modules/restaurant/restaurant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../data/model/response/category_item_model.dart';
import '../../../../domain/request_body/add_item_body.dart';
import '../../../component/custom_elevated_button.dart';
import '../../layout/screens/cart/cart_cubit.dart';
import '../widgets/custom_chip.dart';
import '../widgets/custom_sandwich_widget.dart';

class MealDetailsScreen extends StatelessWidget {
  MealDetailsScreen({super.key, this.categoriesItemsModelData, required this.storeId});
  final CategoryItemsData? categoriesItemsModelData;
  final String storeId;
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    RestaurantCubit cubit = RestaurantCubit.get(context);
    cubit.getItemExtra(id: categoriesItemsModelData!.id!);
    return Scaffold(
      backgroundColor: const Color(0xffF1F2F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child:
                          CustomImage(image: categoriesItemsModelData!.image!)),
                ),
                Positioned(
                    top: 60.h,
                    left: 20.w,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 7,
                                  offset: Offset(1, 5))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: AppColors.customGray.withOpacity(0.4),
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    top: 60.h,
                    right: 20.w,
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.whiteColor.withOpacity(0.7),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 7,
                                    offset: Offset(1, 5))
                              ]),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: isFav == true
                                  ? const Icon(
                                      Icons.favorite,
                                      size: 25,
                                      color: AppColors.redColor,
                                    )
                                  : const Icon(
                                      Icons.favorite_border_rounded,
                                      size: 25,
                                      color: AppColors.customGray,
                                    ),
                            ),
                          ),
                        );
                      },
                    )),
                categoriesItemsModelData!.priceDiscount != null
                    ? Positioned(
                        bottom: 0.h,
                        left: 0.w,
                        child: Container(
                          width: 40.w,
                          decoration: const BoxDecoration(
                              color: AppColors.redColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8))),
                          child: Center(
                              child: Text(
                            '${categoriesItemsModelData!.priceDiscount!}%',
                            style: TextStyles.font16Black600Weight
                                .copyWith(color: AppColors.whiteColor),
                          )),
                        ))
                    : const SizedBox.shrink()
              ],
            ),
            Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Text(
                                categoriesItemsModelData!.name!,
                                style: TextStyles.font18Black700Weight.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: AppColors.customBlack),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  categoriesItemsModelData!.priceDiscount !=
                                          null
                                      ? Text(
                                          '\$${categoriesItemsModelData!.price}',
                                          style: TextStyles.font16Black600Weight
                                              .copyWith(
                                                  fontSize: 14,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      : const SizedBox.shrink(),
                                  horizontalSpace(10),
                                  Text(
                                    '\$${categoriesItemsModelData!.priceAfterDiscount}',
                                    style: TextStyles.font16Black600Weight
                                        .copyWith(
                                            color: AppColors.redColor
                                                .withOpacity(0.6),
                                            fontSize: 18),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffF1F2F6),),
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(10),
                            Text(
                              'Description',
                              style: TextStyles.font18Black700Weight.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black),
                            ),
                            Text(
                              '${categoriesItemsModelData!.description}',
                              style: TextStyles.font18Black700Weight.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.customBlack),
                            ),
                            verticalSpace(15),
                            BlocConsumer<RestaurantCubit, RestaurantState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5.h,),
                                    cubit.itemExtraModelDataList != null
                                        ? cubit.itemExtraModelDataList!
                                                .isNotEmpty
                                            ?  Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Extra components',
                                                      style: TextStyles.font18Black700Weight
                                                          .copyWith(
                                                          fontWeight: FontWeight.bold,
                                                          color: AppColors.black),
                                                    ),
                                                    verticalSpace(10),
                                                     Wrap(
                                                        spacing: 10,
                                                        children: [
                                                          ...cubit.itemExtraModelDataList!.map((e) => OutlinedChip(
                                                            backgroundColor: AppColors.sandwichBackGround,
                                                            avatarBackgroundColor: AppColors.primaryColor,
                                                            label: e.name!,
                                                            price: '${e.price}',
                                                          ),)
                                                        ]),
                                                  ],
                                                ),
                                              )
                                            : const SizedBox.shrink()
                                        : Shimmer.fromColors(
                                            enabled: true,
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 5),
                                              child:
                                                  Wrap(spacing: 10, children: [
                                                OutlinedChip(
                                                  label: '11111111',
                                                  price: '111',
                                                ),
                                                OutlinedChip(
                                                  label: '11111111',
                                                  price: '111',
                                                ),
                                                OutlinedChip(
                                                  label: '11111111',
                                                  price: '111',
                                                ),
                                                OutlinedChip(
                                                  label: '11111111',
                                                  price: '111',
                                                ),
                                              ]),
                                            )),
                                  ],
                                );
                              },
                            ),
                            verticalSpace(10),
                            Text('choose the first sandwich',
                              style: TextStyles.font18Black700Weight.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black
                              ),),
                            SizedBox(height: 10.h,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomSandwichWidget(),
                                CustomSandwichWidget(),
                                CustomSandwichWidget(),
                              ],
                            ),
                            SizedBox(height: 15.h,),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     const CircleAvatar(
                            //       backgroundColor: AppColors.backGroundPink2,
                            //       radius: 30,
                            //       child: Icon(Icons.remove,color: AppColors.backGroundPink3,weight: 5,size: 45,),
                            //     ),
                            //     Padding(
                            //       padding: const EdgeInsets.symmetric(horizontal: 10),
                            //       child: CustomElevatedButton(
                            //           borderRadius: 50,
                            //           height: 50,
                            //           width: 200,
                            //           borderColor: AppColors.primaryColor,
                            //           fontColor: Colors.white,
                            //           onTap: (){
                            //             NavigationService.push(RoutesRestaurants.cartScreen,arguments: {'isLayout':false});
                            //
                            //           }, buttonText: 'Add to Cart'),
                            //     ),
                            //     const CircleAvatar(
                            //       backgroundColor: AppColors.sandwichBackGround,
                            //       radius: 30,
                            //       child: Icon(Icons.add,color: AppColors.primaryColor,weight: 5,size: 45,),
                            //     ),
                            //   ],
                            // ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CustomElevatedButton(
                                    borderRadius: 50,
                                    height: 40.h,
                                    width: 200.w,
                                    borderColor: AppColors.primaryColor,
                                    fontColor: Colors.white,
                                    onTap: () {
                                      AddItemBody addItemBody=
                                      AddItemBody(itemId: categoriesItemsModelData!.id.toString(), qt: '1', storeId: storeId);
                                      CartCubit.get(context).addItemCart(addItemBody: addItemBody, context: context);

                                      // NavigationService.push(
                                      //     RoutesRestaurants.cartScreen,
                                      //     arguments: {'isLayout': false});
                                    },
                                    buttonText: 'Add to Cart'),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
