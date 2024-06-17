import 'package:bloc/bloc.dart';
import 'package:myapp/layout/newsapp_layout/cubit/states.dart';
import 'package:myapp/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../modules/news_app/business/business_screen.dart';
import '../../../modules/news_app/science/science_screen.dart';
import '../../../modules/news_app/sports/sports_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsAppStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int current_index = 0;
  bool? islightmode = CacheHelper.GetData(key: 'isDark');
  List<BottomNavigationBarItem> bottomitems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
  ];
  List<Widget> newsscreens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];
  List<String> newstitlescreens = [
    'Business News',
    'Science News',
    'Sports News',
  ];
  List<dynamic> business = [];
  List<dynamic> Science = [];
  List<dynamic> Sports = [];
  List<dynamic> search = [];
  void changenavbarindex(int index){
    current_index = index;
    if(index == 1){
      getScience();
    }
    if(index == 2){
      getSports();
    }
    emit(NewsBottomChangeState());
  }
  void getBusiness()
  {
    emit(NewsBusinessLoadingState());
    DioHelper.GetData(url_path: 'v2/top-headlines', query: {
      'country':'us',
      'category':'business',
      'apiKey':'73266aad52c5405a964223e399ece2f3',
    }).then((value){
      business = value.data['articles'];
      print(business[0]['author']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print('error is ${error}');
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getScience()
  {
    emit(NewsScienceLoadingState());
    DioHelper.GetData(url_path: 'v2/top-headlines', query: {
      'country':'us',
      'category':'science',
      'apiKey':'73266aad52c5405a964223e399ece2f3',
    }).then((value){
      Science = value.data['articles'];
      print(Science[0]['author']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print('error is ${error}');
      emit(NewsGetScienceErrorState(error));
    });
  }

  void getSports()
  {
    emit(NewsSportsLoadingState());
    DioHelper.GetData(url_path: 'v2/top-headlines', query: {
      'country':'us',
      'category':'sports',
      'apiKey':'73266aad52c5405a964223e399ece2f3',
    }).then((value){
      Sports = value.data['articles'];
      print(Sports[0]['author']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print('error is ${error}');
      emit(NewsGetSportsErrorState(error));
    });
  }
  void changemode() {
    islightmode = !islightmode!;
    CacheHelper.PutBoolean(key: 'isDark', value: islightmode!).then((value){
      emit(NewsChangeModeState());
    });
  }

  void getSearch(String value)
  {
    emit(NewsSearchLoadingState());
    search = [];
    DioHelper.GetData(url_path: 'v2/everything', query: {
      'q':'$value',
      'apiKey':'73266aad52c5405a964223e399ece2f3',
    }).then((value){
      search = value.data['articles'];
      print(search[0]['author']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print('error is ${error}');
      emit(NewsGetSearchErrorState(error));
    });
  }

}