
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/model/base/api_response.dart';
import '../../data/model/response/accept_prescriptoin_params.dart';
import '../../data/model/response/home_params.dart';
import '../../data/model/response/prescription_params.dart';
import '../request_body/check_otp_body.dart';
import '../request_body/login_body.dart';
import '../request_body/otp_body.dart';
import '../request_body/register_body.dart';


mixin HomeRepository {
  Future<ApiResponse> getHome({required HomeParams  params}) ;
  Future<ApiResponse> getStores({required HomeParams  params}) ;
  Future<ApiResponse> getBanner() ;
  Future<ApiResponse> getStoreTypes() ;
  Future<ApiResponse> getOffers() ;
  Future<ApiResponse> getRestaurantsNearest(HomeParams params) ;
  Future<ApiResponse> sendPrescription({required PrescriptionParams  params}) ;
  Future<ApiResponse> acceptPrescription({required AcceptPrescriptionParams  params}) ;
  Future<ApiResponse> getPrescriptions() ;



}
