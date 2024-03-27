import 'package:equatable/equatable.dart';


class UserEntity extends Equatable {
  final int _id;
  final String _name;
  final String _mobile;
  final String _email;
  final String _image;
  final String _accessToken;

  const UserEntity({
    required int id,
    required String name,
    required String mobile,
    required String image,
    required String email,
    required String accessToken,
  })  : _id = id,
        _name = name,
        _mobile = mobile,
        _email = email,
        _image = image,
        _accessToken = accessToken;

  @override
  List<Object> get props => [
    _id,
    _name,
    _mobile,
    _mobile,
    _email,
    _image,
    _accessToken,
  ];

  int get id => _id;
  String get name => _name;
  String get mobile => _mobile;
  String get email => _email;
  String get gender => _image;
  String get accessToken => _accessToken;


}
