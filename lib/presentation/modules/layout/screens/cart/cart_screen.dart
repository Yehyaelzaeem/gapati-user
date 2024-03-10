
import 'package:cogina/presentation/modules/layout/screens/cart/widgets/custom_cart_item.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/widgets/custom_cart_top_widget.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/widgets/custom_total_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../component/custom_elevated_button.dart';
import '../../layout_cubit.dart';
import 'chech_out.dart';
List cartItemsList =[1,2,3,4,5];

class CartScreen extends StatelessWidget {
   const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            final LayoutCubit viewModel = BlocProvider.of<LayoutCubit>(context);
            viewModel.setCurrentIndex(0);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: Colors.white,
        title: Text('Shopping cart',
        style: TextStyles.font20Black700Weight,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            const CustomCartTopWidget(title: 'In your cart', number: '5', iconData: Icons.shopping_cart_outlined, iconBackGround: AppColors.primaryColor),
            SizedBox(height: 10.h,),
            ...cartItemsList.map((e) => const CustomCartItem()),
            SizedBox(height: 10.h,),
            const CustomTotalWidget(),
            SizedBox(height: 20.h,),
            CustomElevatedButton(
                borderRadius: 50,
                height: 43,
                fontColor: AppColors.whiteColor,
                fontSize: 16,
                width: MediaQuery.of(context).size.width*0.9,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CheckOutScreen()));
                }, buttonText: 'Checkout'),
            SizedBox(height: 60.h,),

          ],
        ),
      )
    );
  }
}
