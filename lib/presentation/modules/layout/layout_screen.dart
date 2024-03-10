
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/notification/FcmHandler.dart';
import '../../../core/routing/navigation_services.dart';
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
    super.initState();
    BlocProvider.of<LayoutCubit>(context, listen: false).init(widget._currentPage);
  }

  @override
  Widget build(BuildContext context) {

    int currentIndex = context.watch<LayoutCubit>().currentIndex;
    final LayoutCubit viewModel = BlocProvider.of<LayoutCubit>(context);
    return FcmHandler(navigatorKey:NavigationService.navigationKey,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: PopScope(
          canPop: false,
          onPopInvoked: (c) async {
            if (currentIndex != 0) {
              print('================================');
              viewModel.setCurrentIndex(0);
            } else {
              // _nestedNavigator.currentState!.maybePop();
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


      ),
    );
  }
}
