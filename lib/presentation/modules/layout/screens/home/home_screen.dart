import 'package:cogina/presentation/modules/layout/screens/home/widgets/custom_product_item_widget.dart';
import 'package:cogina/presentation/modules/layout/screens/home/widgets/custom_restaurants_list.dart';
import 'package:flutter/material.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/assets_constant/images.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../notification/notification_screen.dart';
import 'home_cubit.dart';
// _getData(BuildContext context){
//   BlocProvider.of<HomeCubit>(context, listen: false).getOffers();
// }
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // _getData(context);
  }
  @override
  Widget build(BuildContext context) {
    return   Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: AppColors.backGroundPink,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:40.0),
                child: Stack(
                  children: [
                    SizedBox(
                        height: 236.h,
                        child:
                        Container(
                            alignment: Alignment.centerRight,
                            child: Image.asset(RestaurantImages.home1))
                    ),
                    Positioned(
                      bottom: 105.h,
                      left: 10.w,
                      child:  Text('Hi Jhon Smith',
                        style: TextStyles.font20Black700Weight.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500
                        ),
                      ),),
                    Positioned(
                      bottom: 65.h,
                      left: 10.w,
                      child:  Text('Good Morning',
                        style: TextStyles.font20Black700Weight.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,

                        ),
                      ),),
                    Positioned(
                      top: 20.h,
                      left: 10.w,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.whiteColor,
                            boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 5,
                            offset: Offset(1, 4)
                            )]
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.notifications_none_rounded,size: 27,color: AppColors.customGray.withOpacity(0.5),),
                          ),
                        ),
                      ))
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          top: 236.h,
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.customWhite,
                  borderRadius: BorderRadius.circular(20)
              ),
              height: 100,
              child:SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(20),
                    const CustomRestaurantsListWidget(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          verticalSpace(8),
                          Row(
                            children: [
                              Text('Latest Sales', style: TextStyles.font18Black700Weight,),
                              const Spacer(),
                              Text('See All', style: TextStyles.font15CustomGray400Weight,),
                            ],
                          ),
                          verticalSpace(10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomProductItemWidget(),
                              CustomProductItemWidget()
                            ],
                          ),
                          verticalSpace(10),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(RestaurantImages.banner,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                    verticalSpace(100),
                  ],
                ),
              )
          ),
        ),
      ],
    );

  }
}
