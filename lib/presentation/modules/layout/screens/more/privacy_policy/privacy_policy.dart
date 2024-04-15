import 'package:cogina/presentation/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/translations/locale_keys.dart';
import '../../../../../component/custom_app_contant_data.dart';
import '../more_cubit.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:  CustomAppBar(
          title: LocaleKeys.privacyPolicy.tr(),
        ),
        body: BlocBuilder<MoreCubit, MoreState>(
          builder: (context, state) {
            if(state is GetDataSuccessState)
            {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child:  CustomAppContData(
                  image: '',
                  des: state.data
                  ));
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        )
    );
  }
}
