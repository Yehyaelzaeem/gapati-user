import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/assets_constant/images.dart';
import '../../../core/routing/navigation_services.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());
  static MapCubit get()=>BlocProvider.of(NavigationService.navigationKey.currentContext!);


}
