
class ProfileBody {
  String? _image;
  String? _name;
  String? _mobile;
  String? _email;
  // DropDownEntity? _city;
  String _password;
  String _code;
  bool _isConfirmTerms;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    (_name ?? '').isNotEmpty ? data['first_name'] = _name : null;
    (_mobile ?? '').isNotEmpty ? data['phone'] = _mobile : null;
    (_email ?? '').isNotEmpty ? data['email'] = _email : null;
    (_email ?? '').isNotEmpty ? data['email'] = _email : null;
    // data['city_id'] = _city?.id;
    data['password'] = _password;
    return data;
  }


  ProfileBody({
    String name = '',
    String? mobile,
    String? email,
    // DropDownEntity? city,
    String password = '',
    String code = '20',
    String confirmPassword = '',
    bool isConfirmTerms = false,
  })  : _name = name,
        _mobile = mobile,
        _email = email,
        // _city = city,
        _code = code,
        _password = password,
        _isConfirmTerms = isConfirmTerms;

  // updateCity(DropDownEntity? city) {_city= city;}
  updateImage(String? image) {_image= image;}
  updateConfirmTerms(bool isConfirmed){_isConfirmTerms =isConfirmed;}
  updateCode(String? code) {_code = code ?? '20';}

  void setData(
      {required String name,
        required String phone,
        required String email,
        required String password, String? confirmPassword}) {
    _name = name;
    _mobile = phone;
    _email = email;
    _password = password;
  }

  // DropDownEntity? get city => _city;
  String get code => _code;

  bool get isConfirmTerms => _isConfirmTerms;
  String? get image => _image;
}