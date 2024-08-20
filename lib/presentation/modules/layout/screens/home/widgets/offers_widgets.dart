import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_cubit.dart';
import 'custom_product_item_widget.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);
    return
      BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return
            GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10,
              childAspectRatio: (1 / 1.3),
              children: List.generate(cubit.offerList!.length, (index) {
                return  FittedBox(child: CustomProductItemWidget(offersModelData: cubit.offerList![index],));
              })
          );
        },
      );
  }
}























































