import 'package:easy_localization/easy_localization.dart';
import 'package:get_storage/get_storage.dart';
import '../../domain/repository/local_repo.dart';
import '../../main.dart';
import '../app_urls/app_url.dart';
import '../datasource/local/cache_consumer.dart';
import '../datasource/local/storage_keys.dart';
import '../datasource/remote/dio/dio_client.dart';
class LocalRepositoryImp implements LocalRepository {
  final DioClient? _dioClient;
  final CacheConsumer _cacheConsumer;

  LocalRepositoryImp({
    required DioClient? dioClient,
    required CacheConsumer cacheConsumer,
  })  : _dioClient = dioClient,
        _cacheConsumer = cacheConsumer;

  final box = GetStorage();
  // for  user token
  @override
  Future<bool> saveSecuredData(String token) async {
    await _cacheConsumer.saveSecuredData(StorageKeys.kToken, token);
    _dioClient!.token = token;
    _dioClient.dio!.options.headers = {
      'Accept': 'application/json; charset=UTF-8',
      'x-api-key': AppURL.kAPIKey,
      'Content-Language': appContext?.locale.languageCode ?? 'en',
      'Authorization': 'Bearer $token'
    };

    box.write(StorageKeys.kIsAuthed, true);
    return await _cacheConsumer.save(StorageKeys.kIsAuthed, true) ;
  }

  @override
  Future<String> getUserToken() async {
    return await _cacheConsumer.getSecuredData(StorageKeys.kToken)??'';
  }

  @override
  bool isLoggedIn() {
    box.write(StorageKeys.kIsAuthed, StorageKeys.kIsAuthed);
    return _cacheConsumer.get(StorageKeys.kIsAuthed) ?? false;
  }

  @override
  Future<bool> clearSharedData() async {
    _cacheConsumer.deleteSecuredData();
    box.remove(StorageKeys.kIsAuthed);
    _cacheConsumer.delete(StorageKeys.kIsAuthed);
    return _cacheConsumer.delete(StorageKeys.kToken);
  }

}
