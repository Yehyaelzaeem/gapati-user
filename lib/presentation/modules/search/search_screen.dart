
import 'package:delivego/presentation/modules/search/search_cubit.dart';

import '../../../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/global/styles/colors.dart';
import '../../../core/assets_constant/images.dart';
import '../../../core/global/styles/styles.dart';
import '../../../core/helpers/spacing.dart';
import '../../../data/model/response/home_model.dart';
import '../../../data/model/response/restaurants_nearst_model.dart';
import '../../component/custom_app_bar.dart';
import '../../component/custom_loading_widget.dart';
import '../../component/custom_text_field.dart';
import '../restaurant/widgets/custom_restaurant_widget.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = SearchCubit.get(context);
    return Scaffold(
      appBar:  CustomAppBar(
        title: LocaleKeys.theSearch.tr(),
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CustomTextField(
                        focusNode: _focusNode,
                        contentVerticalPadding: 10,
                        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                        fillColor: AppColors.greyColor.withOpacity(0.3),
                        borderColor: AppColors.whiteColor.withOpacity(0.0),
                        borderRadius: 50,
                        prefixIcon:  Icon(Icons.search,color: cubit.isSearchStart?AppColors.primaryColor:null,),
                        hintText: LocaleKeys.search.tr(),
                        hintColor: AppColors.black,
                        onFieldSubmitted: (String v) {
                          cubit.getSearch(searchText: v);
                        },
                        onChanged: (value) {
                          if(value.isNotEmpty){
                            cubit.changeSearchStart(true);
                            cubit.getSearch(searchText: value);
                          }else{
                            cubit.changeSearchStart(false);
                          }
                        },
                        controller: cubit.searchController,),
                      cubit.isSearchStart == true?
                      Positioned(
                        left: context.locale.languageCode.toString()=='en'?null:5,
                        right:context.locale.languageCode.toString()=='en'? 5:null,
                        top: 3,
                        bottom: 3,
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
                  if(cubit.isSearchStart==true)
                    if(cubit.searchModel!=null)
                      if( cubit.searchModel!.data!.isNotEmpty)
                        ...cubit.searchModel!.data!.map((e) => CustomRestaurantWidget(restaurant:
                        RestaurantsNearestModelData(
                          id: e.id,
                          name: e.name,
                          category: e.category,
                          image: e.image,
                          rate: e.rate,
                          banner: e.banner,
                          distance: e.distance,
                          inFav: e.isFav,
                          opening: e.opening,)))
                      else
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImages.fav),
                            Text('${LocaleKeys.notFoundData.tr()}',
                              style: TextStyles.font18Black700Weight.copyWith(
                                  color: AppColors.customBlack.withOpacity(0.6)
                              ),
                            ),
                            verticalSpace(100),
                          ],
                        )
                    else
                      CustomLoadingWidget()
                  else
                    Column(
                      children: [
                        verticalSpace(50),
                        Image.asset(AppImages.search),
                        Text(LocaleKeys.startSearch.tr(),
                          style: TextStyles.font20Black700Weight.copyWith(
                              color: AppColors.customGray
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}


