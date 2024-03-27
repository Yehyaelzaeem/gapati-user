
class ProfileBody {
  String? _mobile;
  String? _email;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    (_mobile ?? '').isNotEmpty ? data['mobile_number'] = _mobile : null;
    (_email ?? '').isNotEmpty ? data['email'] = _email : null;
    return data;
  }


  ProfileBody({

    required String mobile,
    required String email,

  })  :
        _mobile = mobile,
        _email = email;


  void setData(
      {
        required String phone,
        required String email,
        }) {

    _mobile = phone;
    _email = email;
  }


}