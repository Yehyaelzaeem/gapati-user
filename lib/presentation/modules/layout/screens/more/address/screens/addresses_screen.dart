import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../component/custom_app_bar.dart';
import '../address_cubit.dart';
import '../widgets/custom_expansiontile_widget.dart';


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
            context.pushNamed(RoutesRestaurants.addAddressScreen);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: BlocConsumer<AddressCubit,AddressState>(
          builder: (BuildContext context ,AddressState state){
            return
              cubit.addressModel !=null?
              Column(
              children: <Widget>[
                // CustomAddAddressButton(),
                cubit.addressModel!.data!.length==0?
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),
                      child: Center(child: Text(LocaleKeys.notFoundData.tr()),),
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
                child: Center(child: CircularProgressIndicator(),),
              );
          },
          listener: (BuildContext context ,AddressState state){},
        )
      ),
    );
  }
}
