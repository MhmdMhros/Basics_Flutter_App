import 'package:flutter/foundation.dart';

class ShopHomeModel{
  bool? status;
  ShopHomeData? data;
  ShopHomeModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    data = (json['data'] != null ? ShopHomeData.fromJson(json['data']) : null);
  }
}

class ShopHomeData{
  List<BannerModel> banners = [];
  List<ProductModel> products = [];
  ShopHomeData.fromJson(Map<String ,dynamic> json){
    (json['banners'] as List<dynamic>).forEach((element) {
      final banner = BannerModel.fromJson(element);
      banners.add(banner);
    });
    (json['products'] as List<dynamic>).forEach((element) {
      final product = ProductModel.fromJson(element);
      products.add(product);
    });
  }
}
class BannerModel{
  int? id;
  String? image;
  BannerModel.fromJson(Map<String ,dynamic> json){
    id = json['id'];
    image = json['image'];
  }
}
class ProductModel{
  int? id;
  dynamic? price;
  dynamic? oldPrice;
  dynamic? discount;
  String? image;
  String? name;
  bool? isFavorites;
  bool? inCart;

  ProductModel.fromJson(Map<String ,dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    isFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}