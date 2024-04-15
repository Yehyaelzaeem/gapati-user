import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/component/component.dart';
import 'package:cogina/presentation/modules/layout/screens/favorite/widgets/custom_favorite_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../visitor/visitor_screen.dart';
import '../../layout_cubit.dart';
import '../home/home_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return
      HomeCubit.get(context).token!=null&&HomeCubit.get(context).token!.isNotEmpty?
      Scaffold(
      appBar:  CustomAppBar(
        title: LocaleKeys.favorite.tr(),
        onBackPress: (){
          final LayoutCubit viewModel = BlocProvider.of<LayoutCubit>(context);
          viewModel.setCurrentIndex(0);
        },
      ),
      body:   GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9.w,
          mainAxisSpacing: 15.h,
          mainAxisExtent: 200.h,
        ),
        itemBuilder: (BuildContext context, int index) {
          return CustomFavoriteItem();
        },
        shrinkWrap: true,
        itemCount: 10,
        padding: EdgeInsets.all(16.w),
      )
    ):
      CustomVisitorScreen();

  }
}
