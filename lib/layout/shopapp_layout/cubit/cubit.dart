import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/layout/shopapp_layout/cubit/states.dart';
import 'package:myapp/models/shop_app/login_model/categories_model.dart';
import 'package:myapp/models/shop_app/login_model/favorites_model.dart';
import 'package:myapp/models/shop_app/login_model/home_model.dart';
import 'package:myapp/models/shop_app/login_model/search_model.dart';
import 'package:myapp/modules/shop_app/categories/cateogries_screen.dart';
import 'package:myapp/modules/shop_app/categories/cateogries_screen.dart';
import 'package:myapp/modules/shop_app/favorites/favorites_screen.dart';
import 'package:myapp/modules/shop_app/products/products_screen.dart';
import 'package:myapp/modules/shop_app/settings/settings_screen.dart';
import 'package:myapp/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/shop_app/login_model/login_model.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/local/cache_helper.dart';

class ShopCubit extends Cubit<ShopAppStates> {
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? shoploginmodel;
  ShopLoginModel? shopregistermodel;
  ShopHomeModel? shophomemodel;
  ShopCategoriesModel? shopcategoriesmodel;
  ShopChangeFavoriteModel? shopchangefavoritemodel;
  ShopFavoritesModel? shopfavoritesmodel;
  ShopLoginModel? shopprofilemodel;
  ShopSearchModel? shopsearchmodel;
  Map<int? ,bool?>? favorites = {};
  int current_index = 0;
  bool? islightmode = CacheHelper.GetData(key: 'isDark');
  List<BottomNavigationBarItem> shopbottomitems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.production_quantity_limits_outlined),
      label: 'Products',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category_outlined),
      label: 'Categories',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  List<Widget> shopscreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  List<String> shoptitlescreens = [
    'Products',
    'Categories',
    'Favorites',
    'Settings',
  ];
  List<dynamic> products = [];
  List<dynamic> categories = [];
  List<dynamic> settings = [];
  void changenavbarindex(int index){
    current_index = index;
    if(index == 1){
      GetCategoriesPage();
    }
    else if(index == 2){
      GetFavoritesPage();
    }
    else if(index == 3){

    }
    emit(ShopBottomNavHomeState());
  }


  void UserLogin({
    required String email,
    required String password,
}){
    emit(ShopLoginLoadingState());
    DioHelper.PostData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value){
      shoploginmodel = ShopLoginModel.fromJson(value.data);
      if(shoploginmodel!.status == true){
        emit(ShopLoginSuccessState(shoploginmodel!));
      }
      else{
        emit(ShopLoginErrorState(shoploginmodel!));
      }

    });
  }

  void UserRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }){
    emit(ShopRegisterLoadingState());
    DioHelper.PostData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      },
    ).then((value){
      shopregistermodel = ShopLoginModel.fromJson(value.data);
      if(shopregistermodel!.status == true){
        emit(ShopRegisterSuccessState(shopregistermodel!));
      }
      else{
        emit(ShopRegisterErrorState(shopregistermodel!));
      }

    });
  }

  void HelloHomePage(state){
    if(state is ShopLoginSuccessState || state is ShopRegisterSuccessState){
      emit(ShopInitialHomeState());
    }
  }

  void changemode() {
    islightmode = !islightmode!;
    CacheHelper.PutBoolean(key: 'isDark', value: islightmode!).then((value){
      emit(ShopChangeModeState());
    });
  }

  void GetHomePage(){
    emit(ShopHomeLoadingState());
    DioHelper.GetData(
      url_path: HOME,
      token: CacheHelper.GetData(key: 'TokenSave'),
      lang: 'en',
    ).then((value){
      shophomemodel = ShopHomeModel.fromJson(value.data);
      (shophomemodel!.data!.products as List<dynamic>).forEach((element) {
        favorites!.addAll({
          element!.id! : element!.isFavorites!,
        });
      });
      if(shophomemodel!.status == true){
        // print(shophomemodel!.data!.banners[0].id);
        emit(ShopHomeSuccessState(shophomemodel!));
      }
      else{
        emit(ShopHomeErrorState(shophomemodel!));
      }

    });
  }

  void GetCategoriesPage(){
    DioHelper.GetData(
      url_path: GET_CATEGORIES,
      lang: 'en',
      token: token,
    ).then((value){
      shopcategoriesmodel = ShopCategoriesModel.fromJson(value.data);
      if(shopcategoriesmodel!.status == true){
        // print(shophomemodel!.data!.banners[0].id);
        emit(ShopCategoriesSuccessState(shopcategoriesmodel!));
      }
      else{
        emit(ShopCategoriesErrorState(shopcategoriesmodel!));
      }

    });
  }

  void changeFavorites(int productId){
    DioHelper.PostData(
      url: FAVORITES,
      data: {
        'product_id' : productId,
      },
      lang: 'en',
      token: token,
    ).then((value){
      favorites![productId] = !(favorites![productId]!);
      emit(ShopChangeFavoritesState());
      shopchangefavoritemodel = ShopChangeFavoriteModel.fromJson(value.data);
      if(shopchangefavoritemodel!.status == true){
        GetFavoritesPage();
        emit(ShopChangeFavoritesSuccessState(shopchangefavoritemodel!));
      }
      else{
        favorites![productId] = !(favorites![productId]!);
        emit(ShopChangeFavoritesErrorState());
      }
    }).catchError((error){
      favorites![productId] = !(favorites![productId]!);
    });
  }

  void GetFavoritesPage(){
    emit(ShopFavoritesLoadingState());
    DioHelper.GetData(
      url_path: GET_FAVORITES,
      lang: 'en',
      token: token,
    ).then((value){
      shopfavoritesmodel = ShopFavoritesModel.fromJson(value.data);
      if(shopfavoritesmodel!.status == true){
        // print(shophomemodel!.data!.banners[0].id);
        emit(ShopFavoritesSuccessState(shopfavoritesmodel!));
        emit(ShopFavoritesLoadingState());
      }
      else{
        emit(ShopFavoritesErrorState(shopfavoritesmodel!));
        emit(ShopFavoritesLoadingState());
      }

    });
  }

  void GetUserData(){
    emit(ShopProfileLoadingState());
    DioHelper.GetData(
      url_path: PROFILE,
      lang: 'en',
      token: token,
    ).then((value){
      shopprofilemodel = ShopLoginModel.fromJson(value.data);
      if(shopprofilemodel!.status == true){

        emit(ShopProfileSuccessState(shopprofilemodel!));
      }
      else{
        emit(ShopProfileErrorState());
      }

    });
  }
  void UpdateUserData({
    required String name,
    required String email,
    required String phone,
}){
    emit(ShopUpdateProfileLoadingState());
    DioHelper.PutData(
      url: UPDATE_PROFILE,
      lang: 'en',
      token: token,
      data: {
        'name' : name,
        'email' : email,
        'phone' : phone,
      },
    ).then((value){
      shopprofilemodel = ShopLoginModel.fromJson(value.data);
      if(shopprofilemodel!.status == true){

        emit(ShopUpdateProfileSuccessState(shopprofilemodel!));
      }
      else{
        emit(ShopUpdateProfileErrorState(shopprofilemodel!));
      }

    });
  }

  void search(String text){
    emit(ShopSearchLoadingState());
    DioHelper.PostData(
      url: SEARCH_PRODUCT,
      lang: 'en',
      token: token,
      data: {
        'text' : text,
      },
    ).then((value){
      shopsearchmodel = ShopSearchModel.fromJson(value.data);
      if(shopsearchmodel!.status == true){

        emit(ShopSearchSuccessState(shopsearchmodel!));
      }
      else{
        emit(ShopSearchErrorState(shopsearchmodel!));
      }

    });
  }
}