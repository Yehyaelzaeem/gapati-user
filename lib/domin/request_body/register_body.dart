
 // const Country _countryEg =  Country(name: "Egypt",flag: "🇪🇬",code: "EG",dialCode: "20",minLength: 10,maxLength: 10);

class RegisterBody {
  String? _image;
  String? _name;
  String? _mobile;
  String? _email;
  String _password;
  String? _confirmPassword;
  // Country  _country;
  bool _isConfirmTerms;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    (_name ?? '').isNotEmpty ? data['name'] = _name : null;
    (_mobile ?? '').isNotEmpty ? data['mobile_number'] = _mobile : null;
    (_email ?? '').isNotEmpty ? data['email'] = _email : null;

    data['password'] = _password;
    // data['country_code'] = _country.dialCode;
    // data['country_iso'] = _country.code;

    return data;
  }


  RegisterBody({
    String name = '',
    String? mobile,
    String? email,
    String password = '',
    // Country country = _countryEg,
    String confirmPassword = '',
    bool isConfirmTerms = false,
  })  : _name = name,
        _mobile = mobile,
        _email = email,
        // _country = country,
        _password = password,
        _isConfirmTerms = isConfirmTerms,
        _confirmPassword = confirmPassword;

  updateImage(String? image) {_image= image;}
  updateConfirmTerms(bool isConfirmed){_isConfirmTerms =isConfirmed;}
  // updateCode(Country? country) {_country = country ?? _countryEg;}

  void setData(
      {required String name,
        required String phone,
        required String email,
        required String password, String? confirmPassword}) {
    _name = name;
    _mobile = phone;
    _email = email;
    _password = password;
    _confirmPassword = confirmPassword;
  }

  // String get code => _country.dialCode;
  // Country get country => _country;
  bool get isConfirmTerms => _isConfirmTerms;
  String? get image => _image;
}
