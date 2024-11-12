import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/core/helpers/spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/texts/black_texts.dart';
import '../../more/address/address_cubit.dart';
import '../home_cubit.dart';

class HomeLocationWidget extends StatelessWidget {
  const HomeLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isUser= HomeCubit.get(context).token!=null&&HomeCubit.get(context).token!.isNotEmpty;

    AddressCubit addressCubit =AddressCubit.get(context);
    if(addressCubit.addressTitle==null){
      addressCubit.getLocation(context);
    }
    return BlocConsumer<AddressCubit,AddressState>(builder: (context,state){
      return
        InkWell(
          onTap: (){
            if(isUser){
              context.pushNamed(RoutesRestaurants.addresses);
            }else{
              showToast(text: LocaleKeys.logInFirst.tr(), state: ToastStates.error, context: context);
            }
            },
          child: Row(
            children: [
              Icon(Icons.location_history_outlined,color: Colors.grey,),
              horizontalSpace(4),
              if(addressCubit.addressTitle!=null)
                Expanded(
                  child:  BlackMediumText(
                    label:addressCubit.addressTitle??"",
                  ),
                ),
              horizontalSpace(8),
              Icon(Icons.shopping_cart,color: Colors.grey,),
            ],
          ),
        );
    }, listener: (context,state){});
  }
}
