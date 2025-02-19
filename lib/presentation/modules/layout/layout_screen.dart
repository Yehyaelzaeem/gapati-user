
import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:delivego/presentation/modules/layout/screens/more/address/address_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/notification/device_token.dart';
import '../../../core/tabs/tab.dart';
import '../../../core/utils/globals.dart';
import '../../../domain/provider/local_auth_provider_cubit.dart';
import '../restaurant/restaurant_cubit.dart';
import 'layout_cubit.dart';
import 'navigation_tabs.dart';
import 'widgets/bottom_navigation_bar_widget.dart';

class LayoutScreen extends StatefulWidget {
  final int? _currentPage;
  const LayoutScreen({Key? key,
    required int? currentPage,
  }) : _currentPage = currentPage, super(key: key);
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();


}
class _LayoutScreenState extends State<LayoutScreen> {
  @override
  void initState() {
    getPermission();
    context.read<LocalAuthCubit>().updateFCMToken();
    HomeCubit cubit =HomeCubit.get(context);
    getDeviceToken();
    AddressCubit addressCubit =AddressCubit.get(context);
    addressCubit.getLocation(context).then((value){
      print('value $value');
      // cubit.getStoreTypes(value);
    });
    // cubit.getHome();

    cubit.getBanner();
    cubit.getCategories();
    cubit.getsOffers();
    cubit.getBestDishes();

    BlocProvider.of<LayoutCubit>(context, listen: false).init(widget._currentPage);
    BlocProvider.of<LayoutCubit>(context, listen: false).initLayOut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    kIsArabic =context.locale.languageCode==Locale('ar').toString();

    int currentIndex = context.watch<LayoutCubit>().currentIndex;
    final LayoutCubit viewModel = BlocProvider.of<LayoutCubit>(context);
    List<NavigationTab> kTabs =getDataTabs();
    return  Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: PopScope(
        canPop: false,
        onPopInvoked: (c) async {
          if (currentIndex != 0) {
            viewModel.setCurrentIndex(0);
          } else {
            LocalAuthCubit viewModel   = BlocProvider.of<LocalAuthCubit>(context, listen: false);
            bool isAuthed = await viewModel.isLogin();
            if(isAuthed){

            }else{
              context.pop();
            }
          }
        },
        child:
        kTabs[currentIndex].initialRoute,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        onTap: viewModel.setCurrentIndex,
        currentIndex: currentIndex,
        tabs: kTabs,
      ),


    );
  }
  Future getPermission()async{
    bool service;
    LocationPermission permission;
    service =await Geolocator.isLocationServiceEnabled();
    if(service ==false){
    }
    permission =await Geolocator.checkPermission();
    if(permission ==LocationPermission.denied){
      permission =await Geolocator.requestPermission();
    }
    return permission;
  }
}
