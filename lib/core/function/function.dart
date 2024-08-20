
import 'package:flutter/cupertino.dart';

import '../../presentation/dialog/show_logout_dialog.dart';
import '../../presentation/modules/layout/screens/home/home_cubit.dart';

void logInFirst({required Function function,required String screenName,required BuildContext context}){
  if(HomeCubit.get(context).token!=null&&HomeCubit.get(context).token!.isNotEmpty){
    function();
  }else{
    showSignUpDialog(context: context, screenName: screenName);
  }
}