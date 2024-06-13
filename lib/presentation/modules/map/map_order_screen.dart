import 'package:cogina/core/assets_constant/images.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/modules/map/widgets/custom_colum_stepper_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/global/styles/styles.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../component/custom_elevated_button.dart';
import '../layout/layout_screen.dart';

class OrderMapScreen extends StatefulWidget {
   const OrderMapScreen({super.key});

  @override
  State<OrderMapScreen> createState() => _OrderMapScreenState();
}

class _OrderMapScreenState extends State<OrderMapScreen> {
  int currentStep = 2;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(RestaurantImages.map,width: double.infinity,fit: BoxFit.cover,),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your order code: ',
                  style:TextStyles.font16Black600Weight.copyWith(
                      fontWeight: FontWeight.w700
                  ), ),
                Text('#1564',
                  style:TextStyles.font15CustomGray400Weight.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                  ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('5 items - ',
                  style:TextStyles.font16Black600Weight.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 15
                  ), ),
                Text('250.0 ${LocaleKeys.lyd.tr()}',
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
                  title: const CustomColumStepperBody(title: 'Order placed', text: 'we have received your order'),
                  content: const SizedBox.shrink(),
                  isActive: currentStep >= 0,
                  state: currentStep >= 0 ? StepState.complete : StepState.indexed,
                ),
                Step(
                  title: const CustomColumStepperBody(title: 'Confirmed', text: 'your order has been confirmed'),
                  content:   const SizedBox.shrink(),
                  isActive: currentStep >= 1,
                  state:
                  currentStep >= 1 ? StepState.complete : StepState.indexed,
                ),
                Step(
                  title: const CustomColumStepperBody(title: 'Order Shipped', text: 'Estimated for 02 july,2023'),
                  content:   const SizedBox.shrink(),
                  isActive: currentStep >= 2,
                  state:
                  currentStep >= 2 ? StepState.complete : StepState.indexed,
                ),
                Step(
                  title: const CustomColumStepperBody(title: 'Out for delivery', text: 'Estimated for 02 july,2023'),
                  content: const SizedBox.shrink(),
                  isActive: currentStep >= 3,
                  state:
                  currentStep >= 3 ? StepState.complete : StepState.indexed,
                ),
                Step(
                  title: const CustomColumStepperBody(title: 'Delivered', text: 'Estimated for 02 july,2023'),
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
                buttonText: 'Back to Home'),
            verticalSpace(70),

          ],
        ),
      ),
    );
  }
}
