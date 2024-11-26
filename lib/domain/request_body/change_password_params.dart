class ChangePasswordParams {
  final String phone;
  final String password;
  ChangePasswordParams({required this.phone, required this.password,});

  Map<String, dynamic> toMap() {
    return {
      'mobile_number': this.phone,
      'password': this.password,
    };
  }

  factory ChangePasswordParams.fromMap(Map<String, dynamic> map) {
    return ChangePasswordParams(
      phone: map['mobile_number'] as String,
      password: map['password'] as String,
    );
  }
}