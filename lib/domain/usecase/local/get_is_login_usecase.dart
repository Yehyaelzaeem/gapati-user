

import 'package:cogina/domain/logger.dart';

import '../../../data/model/base/response_model.dart';
import '../../repository/local_repo.dart';

class IsUserLoginUseCase {
   final _tag = 'IsUserLoginUseCase';
  final LocalRepository repository;

  IsUserLoginUseCase({required this.repository});

  Future<ResponseModel> call() async {
    bool isLogin =  repository.isLoggedIn();
    log('IsUserLoginUseCase', isLogin.toString());
    if (isLogin) {
      return ResponseModel(true, 'successful');
    } else {
      return ResponseModel(false, 'error');
    }
  }
}
