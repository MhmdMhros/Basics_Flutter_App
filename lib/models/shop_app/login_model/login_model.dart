class ShopLoginModel{
  bool? status;
  String? message;
  ShopUserData? data;
  ShopLoginModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? ShopUserData.fromJson(json['data']) : null);
  }
}

class ShopUserData{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  ShopUserData.fromJson(Map<String ,dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}