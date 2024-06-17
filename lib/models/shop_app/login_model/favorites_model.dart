class ShopChangeFavoriteModel{
  bool? status;
  String? message;
  ShopChangeFavoriteModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }
}


class ShopFavoritesModel {
  bool? status;
  String? message;
  ShopFavoritesDataModel? data;

  ShopFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? ShopFavoritesDataModel.fromJson(json['data']) : null);
  }
}

class ShopFavoritesDataModel {
  int? currentPage;
  List<DataModel> data = [];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? path;
  int? perPage;
  int? to;
  int? total;

  ShopFavoritesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      (json['data'] as List<dynamic>).forEach((element) {
        final dataobject = DataModel.fromJson(element);
        data.add(dataobject);
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

}

class DataModel {
  int? id;
  Product? product;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    (json['product'] != null ? Product.fromJson(json['product']) : null);
  }
}

class Product {
  int? id;
  dynamic? price;
  dynamic? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;


  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}