import 'package:cogina/core/assets_constant/images.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/component/custom_loading_widget.dart';
import 'package:cogina/presentation/modules/map/widgets/custom_colum_stepper_body.dart';
import 'package:cogina/presentation/modules/map/widgets/map_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/global/styles/styles.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../domain/logger.dart';
import '../../component/custom_elevated_button.dart';
import '../layout/layout_screen.dart';
import '../layout/screens/orders/orders_cubit.dart';

class OrderMapScreen extends StatefulWidget {
  final int orderId;
  final String orderTotal;
  const OrderMapScreen({super.key, required this.orderId, required this.orderTotal});

  @override
  State<OrderMapScreen> createState() => _OrderMapScreenState();
}

class _OrderMapScreenState extends State<OrderMapScreen> {
  int currentStep = 2;

  @override
  Widget build(BuildContext context) {
    OrdersCubit cubit =OrdersCubit.get(context);
    return Scaffold(
      body: BlocConsumer<OrdersCubit, OrdersState>(
              listener: (context, state) {},
              builder: (context, state) {
                if(cubit.orderDetailsModel!=null) {
                  final data =cubit.orderDetailsModel!.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.5,
                        child: GoogleMapScreen(tripId: widget.orderId,),
                      ),
                     Expanded(
                       child: SingleChildScrollView(
                         child: Column(
                           children: [
                             verticalSpace(20),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text('${LocaleKeys.yourOrderCode.tr()}: ',
                                   style:TextStyles.font16Black600Weight.copyWith(
                                       fontWeight: FontWeight.w700
                                   ), ),
                                 Text('#${widget.orderId}',
                                   style:TextStyles.font15CustomGray400Weight.copyWith(
                                       fontWeight: FontWeight.w600,
                                       color: AppColors.primaryColor
                                   ),),
                               ],
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text('${data.length} ${LocaleKeys.items.tr()} - ',
                                   style:TextStyles.font16Black600Weight.copyWith(
                                       fontWeight: FontWeight.w700,
                                       fontSize: 15
                                   ), ),
                                 Text('${widget.orderTotal} ${LocaleKeys.lyd.tr()}',
                                   style:TextStyles.font15CustomGray400Weight.copyWith(
                                       fontWeight: FontWeight.w600,
                                       color: AppColors.redColor.withOpacity(0.5),
                                       fontSize: 15

                                   ),),
                               ],
                             ),
                             Stepper(
                               physics: const NeverScrollableScrollPhysics(),
                               type: StepperType.vertical,
                               currentStep: currentStep,
                               elevation: 0,
                               margin: EdgeInsets.zero,
                               onStepTapped: (int step) {
                                 setState(() {
                                   currentStep = step;
                                 });
                               },
                               steps: <Step>[
                                 Step(
                                   title:  CustomColumStepperBody(title:LocaleKeys.orderPlaced.tr(), text: LocaleKeys.orderPlacedMess.tr()),
                                   content: const SizedBox.shrink(),
                                   isActive: currentStep >= 0,
                                   state: currentStep >= 0 ? StepState.complete : StepState.indexed,
                                 ),
                                 Step(
                                   title:  CustomColumStepperBody(title: LocaleKeys.confirm.tr(), text: LocaleKeys.confirmedMess.tr()),
                                   content:   const SizedBox.shrink(),
                                   isActive: currentStep >= 1,
                                   state:
                                   currentStep >= 1 ? StepState.complete : StepState.indexed,
                                 ),
                                 Step(
                                   title:  CustomColumStepperBody(title:  LocaleKeys.orderShipped.tr(), text: '${LocaleKeys.estimatedFor.tr()} 02 july,2023'),
                                   content:   const SizedBox.shrink(),
                                   isActive: currentStep >= 2,
                                   state:
                                   currentStep >= 2 ? StepState.complete : StepState.indexed,
                                 ),
                                 Step(
                                   title:  CustomColumStepperBody(title: LocaleKeys.outForDelivery.tr(), text: '${LocaleKeys.estimatedFor.tr()} 02 july,2023'),
                                   content: const SizedBox.shrink(),
                                   isActive: currentStep >= 3,
                                   state:
                                   currentStep >= 3 ? StepState.complete : StepState.indexed,
                                 ),
                                 Step(
                                   title:  CustomColumStepperBody(title: LocaleKeys.delivered.tr(), text: '${LocaleKeys.estimatedFor.tr()} 02 july,2023'),
                                   content: const SizedBox.shrink(),
                                   isActive: currentStep >= 4,
                                   state:
                                   currentStep >= 4 ? StepState.complete : StepState.indexed,
                                 ),
                               ],
                               controlsBuilder: (BuildContext context, ControlsDetails controlsDetails) {
                                 return const SizedBox.shrink(); // Return an empty container to hide the buttons
                               },
                             ),
                             verticalSpace(30),
                             CustomElevatedButton(
                                 borderRadius: 50,
                                 height: 45,
                                 width: MediaQuery.of(context).size.width*0.9,
                                 onTap: (){
                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LayoutScreen(currentPage: 0,)));

                                 },
                                 buttonText: LocaleKeys.backToHome.tr()),
                             verticalSpace(70),
                           ],
                         ),
                       ),
                     )
                    ],
                  );
                 }else{
                  return CustomLoadingWidget();
                }

              },
            ),
    );
  }
}
