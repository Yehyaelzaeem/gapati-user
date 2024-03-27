
class RegisterBody {
  String? _firstName;
  String? _lastName;
  String? _mobile;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    (_firstName ?? '').isNotEmpty ? data['first_name'] = _firstName : null;
    (_lastName ?? '').isNotEmpty ? data['last_name'] = _lastName : null;
    (_mobile ?? '').isNotEmpty ? data['mobile_number'] = _mobile : null;

    return data;
  }


  RegisterBody({
    required String firstName ,
    required String lastName,
    required String mobile,})
      : _firstName = firstName,
        _lastName = lastName,
        _mobile = mobile;


  void setData(
      {
        required String firstName,
        required String lastName,
        required String phone}) {
     _firstName = firstName;
     _lastName = lastName;
     _mobile = phone;
  }


}
