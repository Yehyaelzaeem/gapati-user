class LoginBody{
  String _phone;
  String _password;


  LoginBody({
    required String phone,
    required String password ,
  })  : _phone = phone,
        _password = password;



  String get password => _password;
  String get phone => _phone;

  Map<String, dynamic> toJson() {
    return {
      "mobile_number": _phone,
      "password": _password,
    };
  }
  setData({
    required String phone,
    required String password,
  }){
    _phone = phone;
    _password = password;
  }


}
