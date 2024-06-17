import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:myapp/layout/newsapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/newsapp_layout/news_app.dart';
import 'package:myapp/layout/shopapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/shopapp_layout/cubit/states.dart';
import 'package:myapp/layout/shopapp_layout/shop_app.dart';
import 'package:myapp/layout/socialapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/socialapp_layout/cubit/states.dart';
import 'package:myapp/layout/socialapp_layout/social_app.dart';
import 'package:myapp/layout/todoapp_layout/TODOAPP.dart';
import 'package:myapp/layout/todoapp_layout/cubit/states.dart';
import 'package:myapp/models/shop_app/login_model/login_model.dart';
import 'package:myapp/modules/basics/home/home_screen.dart';
import 'package:myapp/modules/basics/login/login_screen.dart';
import 'package:myapp/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:myapp/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:myapp/modules/social_app/social_login/social_login_screen.dart';
import 'package:myapp/shared/bloc_observer.dart';
import 'package:myapp/layout/todoapp_layout/cubit/cubit.dart';
import 'package:myapp/shared/components/components.dart';
import 'package:myapp/shared/network/local/cache_helper.dart';
import 'package:myapp/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/newsapp_layout/cubit/states.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'modules/native_code/native_code.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  await Firebase.initializeApp();
  socialTokenSave = CacheHelper.GetData(key: 'uId');
  // var messageToken = FirebaseMessaging.instance.getToken();
  // print(messageToken);
  // FirebaseMessaging.onMessage.listen((event) {
  //   print(event.data.toString());
  // });
  //
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print(event.data.toString());
  // });
  runApp(MyApp());
}
bool isValueTrue(dynamic value) {
  if (value != null && value is bool) {
    return value;
  }
  return false; // or handle the null case in another way
}

class MyApp extends StatelessWidget
{
  bool onboarding = isValueTrue(CacheHelper.GetData(key: 'onBoarding'));
  String? tokensave = CacheHelper.GetData(key: 'TokenSave');

  Widget widgetscreen(){
    if(onboarding == true && tokensave == null){
      return ShopLoginScreen();
    }
    else if(tokensave != null){
      return ShopAppScreen();
    }
    else{
      return OnBoardingScreen();
    }
  }
  Widget socialWidgetScreen(){
    if(socialTokenSave == null){
      return SocialLoginScreen();
    }
    else{
      return SocialLayout();
    }
  }
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => ShopLoginModel());
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => NewsCubit()..changemode(),),
        // BlocProvider(
        //   create: (context) => NewsCubit()..getBusiness(),),
        BlocProvider(
          create: (context) => ShopCubit()..GetHomePage()..GetCategoriesPage()..GetFavoritesPage()..GetUserData()..search(''),),
        // BlocProvider(
        //   create: (context) => SocialCubit()..GetUserData()..getPosts()..getUsers(),),

      ],
      child: BlocConsumer<ShopCubit,ShopAppStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                  ),
                )
            ),
            home:  HomeScreen(),
          );
        },
      ),
    );
  }
}

