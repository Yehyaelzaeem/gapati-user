
class RegisterBody {
  String? _firstName;
  String? _lastName;
  String? _mobile;
  String? _email;
  String? _password;
  String? _confirmPassword;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    (_firstName ?? '').isNotEmpty ? data['first_name'] = _firstName : null;
    (_lastName ?? '').isNotEmpty ? data['last_name'] = _lastName : null;
    (_mobile ?? '').isNotEmpty ? data['mobile_number'] = _mobile : null;
    (_password ?? '').isNotEmpty ? data['password'] = _password : null;
    (_email ?? '').isNotEmpty ? data['email'] = _email : null;
    (_confirmPassword ?? '').isNotEmpty ? data['password_confirmation'] = _confirmPassword : null;
    return data;
  }


  RegisterBody({
    required String firstName ,
    required String lastName,
    required String mobile,
    required String password,
    required String email,
    required String confirmPassword,


  })
      : _firstName = firstName,
        _lastName = lastName,
        _password= password,
        _email= email,
        _confirmPassword = confirmPassword,
        _mobile = mobile;



  void setData(
      {
        required String firstName,
        required String lastName,
        required String phone,
        required String password,
        required String confirmPassword,
        required String email,

      }) {
     _firstName = firstName;
     _lastName = lastName;
     _mobile = phone;
     _email = email;
     _password = password;
     _confirmPassword = confirmPassword;
  }


}
