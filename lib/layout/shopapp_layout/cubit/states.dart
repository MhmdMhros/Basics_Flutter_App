import 'package:myapp/models/shop_app/login_model/categories_model.dart';
import 'package:myapp/models/shop_app/login_model/favorites_model.dart';
import 'package:myapp/models/shop_app/login_model/home_model.dart';
import 'package:myapp/models/shop_app/login_model/login_model.dart';
import 'package:myapp/models/shop_app/login_model/search_model.dart';

abstract class ShopAppStates{}
class ShopInitialState extends ShopAppStates{}
class ShopLoginLoadingState extends ShopAppStates{}
class ShopLoginSuccessState extends ShopAppStates{
  final ShopLoginModel model;
  ShopLoginSuccessState(this.model);
}
class ShopLoginErrorState extends ShopAppStates{
  final ShopLoginModel model;
  ShopLoginErrorState(this.model);
}

class ShopSearchInitialState extends ShopAppStates{}
class ShopSearchLoadingState extends ShopAppStates{}
class ShopSearchSuccessState extends ShopAppStates{
  final ShopSearchModel model;
  ShopSearchSuccessState(this.model);
}
class ShopSearchErrorState extends ShopAppStates{
  final ShopSearchModel model;
  ShopSearchErrorState(this.model);
}

class ShopRegisterLoadingState extends ShopAppStates{}
class ShopRegisterSuccessState extends ShopAppStates{
  final ShopLoginModel model;
  ShopRegisterSuccessState(this.model);
}
class ShopRegisterErrorState extends ShopAppStates{
  final ShopLoginModel model;
  ShopRegisterErrorState(this.model);
}

class ShopUpdateProfileLoadingState extends ShopAppStates{}
class ShopUpdateProfileSuccessState extends ShopAppStates{
  final ShopLoginModel model;
  ShopUpdateProfileSuccessState(this.model);
}
class ShopUpdateProfileErrorState extends ShopAppStates{
  final ShopLoginModel model;
  ShopUpdateProfileErrorState(this.model);
}

class ShopInitialHomeState extends ShopAppStates{}
class ShopBottomNavHomeState extends ShopAppStates{}
class ShopChangeModeState extends ShopAppStates{}

class ShopHomeLoadingState extends ShopAppStates{}
class ShopHomeSuccessState extends ShopAppStates{
  final ShopHomeModel model;
  ShopHomeSuccessState(this.model);
}
class ShopHomeErrorState extends ShopAppStates{
  final ShopHomeModel model;
  ShopHomeErrorState(this.model);
}

class ShopCategoriesSuccessState extends ShopAppStates{
  final ShopCategoriesModel model;
  ShopCategoriesSuccessState(this.model);
}
class ShopCategoriesErrorState extends ShopAppStates{
  final ShopCategoriesModel model;
  ShopCategoriesErrorState(this.model);
}

class ShopChangeFavoritesSuccessState extends ShopAppStates{
  final ShopChangeFavoriteModel model;
  ShopChangeFavoritesSuccessState(this.model);
}
class ShopChangeFavoritesErrorState extends ShopAppStates{}
class ShopChangeFavoritesState extends ShopAppStates{}


class ShopFavoritesSuccessState extends ShopAppStates{
  final ShopFavoritesModel model;
  ShopFavoritesSuccessState(this.model);
}
class ShopFavoritesErrorState extends ShopAppStates{
  final ShopFavoritesModel model;
  ShopFavoritesErrorState(this.model);
}

class ShopFavoritesLoadingState extends ShopAppStates{}

class ShopProfileLoadingState extends ShopAppStates{}
class ShopProfileSuccessState extends ShopAppStates{
  final ShopLoginModel model;
  ShopProfileSuccessState(this.model);
}
class ShopProfileErrorState extends ShopAppStates{
}

