class BaseModel<E> {
  bool? status;
  String? code;
  dynamic message;
  E? responseData;
  E? response;
  E? categories;
  E? extra;

  BaseModel({ this.status, this.code,  this.message, this.responseData, this.response,this.categories,this.extra});

 factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
      status: ((json['code']??'200').toString() == '200')||((json['code']??'201').toString() == '201'),
      code: (json['code']??'200').toString(),
      message: json['message']??"Error",
      responseData: json['item'],
     response: json['all_items'],
     categories: json['categories'],
     extra: json['extra']
 );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = status;
    data['message'] = message;
    data['code'] = code;
    data['item'] = responseData??{};
    data['all_items'] = response??{};
    data['categories'] = categories??{};
    data['extra'] = extra??{};
    return data;
  }
}
