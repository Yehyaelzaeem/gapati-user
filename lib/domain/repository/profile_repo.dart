
import 'dart:io';

import '../../data/model/base/api_response.dart';
import '../request_body/profile_body.dart';


mixin ProfileRepository {
  Future<ApiResponse> profile() ;
  Future<ApiResponse> updateProfile({required ProfileBody profileBody}) ;
  Future<ApiResponse> updateImageProfile({required File image}) ;

}
