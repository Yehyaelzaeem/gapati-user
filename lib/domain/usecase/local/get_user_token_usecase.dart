


import '../../../core/routing/navigation_services.dart';
import '../../../data/model/base/response_model.dart';
import '../../../presentation/modules/layout/screens/home/home_cubit.dart';
import '../../repository/local_repo.dart';

class GetUserTokenUseCase {
  // final _tag = 'GetUserTokenDataUseCase';
  final LocalRepository repository;

  GetUserTokenUseCase({required this.repository});

  Future<ResponseModel> call() async {
    String? token =await repository.getUserToken();
     HomeCubit.get(NavigationService.navigationKey.currentContext!).getToken(tk: token);
    if (token.isNotEmpty) {
      return ResponseModel(true, 'successful', data: token);
    } else {
      return ResponseModel(false, 'error');
    }
  }
}
