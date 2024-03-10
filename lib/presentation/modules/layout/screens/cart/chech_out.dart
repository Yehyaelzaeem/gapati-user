import 'package:cogina/presentation/modules/layout/screens/cart/widgets/custom_step1_body_widget.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/widgets/custom_step2_body_widget.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/widgets/custom_step3_body_widget.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/widgets/custom_step4_body_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundGray,
        appBar: AppBar(
          title: Text('Check Out',
          style: TextStyles.font18Black700Weight,
          ),
          centerTitle: true,
          leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_ios_rounded)),
          backgroundColor: AppColors.whiteColor,
        ),
        body:
        Stepper(
          type: StepperType.horizontal,
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
              title: const SizedBox.shrink(),
              content: const CustomStepBody1Widget(),
              isActive: currentStep >= 0,
              state: currentStep >= 0 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const SizedBox.shrink(),
              content:  CustomStepBody2Widget(),
              isActive: currentStep >= 1,
              state:
                  currentStep >= 1 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const SizedBox.shrink(),
              content:  CustomStepBody3Widget(),
              isActive: currentStep >= 2,
              state:
                  currentStep >= 2 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const SizedBox.shrink(),
              content:  CustomStepBody4Widget(),
              isActive: currentStep >= 3,
              state:
                  currentStep >= 3 ? StepState.complete : StepState.indexed,
            ),
          ],
          controlsBuilder: (BuildContext context, ControlsDetails controlsDetails) {
            return const SizedBox.shrink(); // Return an empty container to hide the buttons
          },

        ));
  }
}
