class GetProfileModel {
  ProfileModel? data;

  GetProfileModel({this.data});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  ProfileModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? image;

  ProfileModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.mobileNumber,
        this.email,
        this.image});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['image'] = image;
    return data;
  }
}
