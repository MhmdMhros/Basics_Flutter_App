import 'package:flutter/foundation.dart';

class ShopCategoriesModel{
  bool? status;
  ShopCategoriesDataModel? data;
  ShopCategoriesModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    data = (json['data'] != null ? ShopCategoriesDataModel.fromJson(json['data']) : null);
  }
}

class ShopCategoriesDataModel{
  int? currentPage;
  List<DataModel> data = [];
  ShopCategoriesDataModel.fromJson(Map<String ,dynamic> json){
    (json['data'] as List<dynamic>).forEach((element) {
      final dataobject = DataModel.fromJson(element);
      data.add(dataobject);
    });
  }
}
class DataModel{
  int? id;
  String? name;
  String? image;
  DataModel.fromJson(Map<String ,dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}