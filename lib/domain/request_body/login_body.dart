class LoginBody{
  String _phone;
  String _otp;


  LoginBody({
    required String phone,
    required String otp ,
  })  : _phone = phone,
        _otp = otp;



  String get otp => _otp;
  String get phone => _phone;

  Map<String, dynamic> toJson() {
    return {
      "mobile_number": _phone,
      "otp": _otp,
    };
  }
  setData({
    required String phone,
    required String otp,
  }){
    _phone = phone;
    _otp = otp;
  }


}
