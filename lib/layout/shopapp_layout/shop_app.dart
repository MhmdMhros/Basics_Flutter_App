import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myapp/layout/shopapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/shopapp_layout/cubit/states.dart';
import 'package:myapp/main.dart';
import 'package:myapp/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:myapp/shared/components/components.dart';
import 'package:myapp/shared/network/local/cache_helper.dart';

import '../../modules/shop_app/search/search_screen.dart';

class ShopAppScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopAppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = ShopCubit.get(context);
          // print(cubit.islightmode);
          if(cubit.islightmode == null){
            cubit.islightmode = false;
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Salla: ${cubit.shoptitlescreens[cubit.current_index]}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: (){
                    NavigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: (){
                    cubit.changemode();
                  },
                  icon: Icon(
                    cubit.islightmode!?Icons.brightness_4_outlined:Icons.brightness_4,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: cubit.shopscreens[cubit.current_index],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: HexColor('333739'),
              items: cubit.shopbottomitems,
              currentIndex: cubit.current_index,
              onTap: (index){
                cubit.changenavbarindex(index);
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
            ),
          );
        },
    );
  }
}
