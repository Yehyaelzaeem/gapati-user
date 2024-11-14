
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/function/function.dart';
import '../../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../../data/model/response/delivery_fees_params.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../component/custom_app_bar.dart';
import '../../home/home_cubit.dart';
import '../../more/address/address_cubit.dart';
import '../cart_cubit.dart';
import '../widgets/custom_step1_body_widget.dart';
import '../widgets/custom_step2_body_widget.dart';
import '../widgets/custom_step3_body_widget.dart';
import '../widgets/custom_step4_body_widget.dart';
import 'check_out_cubit.dart';


class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutCubit cubit =CheckOutCubit.get(context);
    AddressCubit addressCubit =AddressCubit.get(context);
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar:
             CustomAppBar(title: cubit.currentStep==0?LocaleKeys.address.tr():
             cubit.currentStep==1?LocaleKeys.delivery.tr():
             cubit.currentStep==2?LocaleKeys.payment.tr():LocaleKeys.confirm.tr(),),
            body:
            Stepper(
              type: StepperType.horizontal,
              currentStep:cubit.currentStep,
              elevation: 0,
              margin: EdgeInsets.zero,
              onStepTapped: (int step) {
                // cubit.changeSteps(step);
                print('state $step');
                // if( step==1){
                //   cubit.getNearestBranch(latLng: LatLng(double.parse(addressCubit.orderAddress?.lat??'0'),double.parse(addressCubit.orderAddress?.lng??'0')));
                // }
                // if( step==2){
                //   CartCubit cartCubit =CartCubit.get(context);
                //   cubit.getDeliveryFees(params: DeliveryFeesParams(addressId: addressCubit.orderAddress?.id?.toString()??'',branchId: cartCubit.products[0].branchId!=null?cartCubit.products[0].branchId!.toString():"0"));
                //
                // }
                // if(HomeCubit.get(context).token!=null&&HomeCubit.get(context).token!.isNotEmpty){
                //    cubit.changeSteps(step);
                //    // if(AddressCubit.get(context).lastAddressModel!=null){
                //    //   cubit.changeSteps(step);
                //    // }else{
                //    //   showToast(text: LocaleKeys.mesAddress.tr(), state: ToastStates.error, context: context);
                //    // }
                //  }else{
                //    cubit.changeSteps(step);
                //  }

              },
              steps: <Step>[
                Step(
                  title: const SizedBox.shrink(),
                  content:  CustomStepBody1Widget(),
                  isActive:  cubit.currentStep >= 0,
                  state: cubit.currentStep >= 0 ? StepState.complete : StepState
                      .indexed,
                ),
                Step(
                  title: const SizedBox.shrink(),
                  content: const CustomStepBody2Widget(),
                  isActive:  cubit.currentStep >= 1,
                  state:
                  cubit.currentStep >= 1 ? StepState.complete : StepState.indexed,
                ),
                Step(
                  title: const SizedBox.shrink(),
                  content:  const CustomStepBody3Widget(),
                  isActive:  cubit.currentStep >= 2,
                  state:
                  cubit.currentStep >= 2 ? StepState.complete : StepState.indexed,
                ),
                Step(
                  title: const SizedBox.shrink(),
                  content:const CustomStepBody4Widget(),
                  isActive:  cubit.currentStep >= 3,
                  state:
                  cubit.currentStep >= 3 ? StepState.complete : StepState.indexed,
                ),
              ],
              controlsBuilder: (BuildContext context,
                  ControlsDetails controlsDetails) {
                return const SizedBox.shrink(); // Return an empty container to hide the buttons
              },

            ));
      },
    );
  }
}
