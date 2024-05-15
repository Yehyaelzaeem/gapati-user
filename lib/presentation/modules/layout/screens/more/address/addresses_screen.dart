import 'package:cogina/core/global/fonts/app_fonts.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/assets_constant/images.dart';
import '../../../../../component/custom_app_bar.dart';
import '../../../../../component/custom_loading_widget.dart';
import 'address_cubit.dart';
import 'widgets/custom_expansiontile_widget.dart';


class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AddressCubit cubit =AddressCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  CustomAppBar(
        title: LocaleKeys.addresses.tr(),
        actions: [
          IconButton(onPressed: (){
            cubit.getLocation(context);
            context.pushNamed(RoutesRestaurants.addAddressScreen);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:
        BlocConsumer<AddressCubit,AddressState>(
          builder: (BuildContext context ,AddressState state){
            return
              cubit.addressModel !=null?
              Column(
              children: <Widget>[
                cubit.addressModel!.data!.length==0?
                    Padding(
                      padding:  EdgeInsets.only(top: 50.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(RestaurantImages.location),
                          Center(child: Text(LocaleKeys.notFoundData.tr(),style: TextStyles.font20Black700Weight.copyWith(
                            fontFamily: AppFonts.lateefFont,
                            fontSize: 30
                          ),),),
                        ],
                      ),
                    ):
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return
                      CustomExpansionTileWidget( addressModelData: cubit.addressModel!.data![index],);
                  },
                  itemCount: cubit.addressModel!.data!.length,
                  shrinkWrap: true,
                ),
              ],
            ) :
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),
                child: CustomLoadingWidget(),
              );
          },
          listener: (BuildContext context ,AddressState state){},
        )
      ),
    );
  }
}
