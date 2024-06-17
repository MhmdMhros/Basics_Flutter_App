class ShopChangeSearchModel{
  bool? status;
  String? message;
  ShopChangeSearchModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }
}


class ShopSearchModel {
  bool? status;
  String? message;
  ShopSearchDataModel? data;

  ShopSearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? ShopSearchDataModel.fromJson(json['data']) : null);
  }
}

class ShopSearchDataModel {
  int? currentPage;
  List<Product> data = [];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? path;
  int? perPage;
  int? to;
  int? total;

  ShopSearchDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      (json['data'] as List<dynamic>).forEach((element) {
        final dataobject = Product.fromJson(element);
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


class Product {
  int? id;
  dynamic? price;
  String? image;
  String? name;
  String? description;


  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}