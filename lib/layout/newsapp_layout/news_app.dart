import 'package:myapp/layout/newsapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/newsapp_layout/cubit/states.dart';
import 'package:myapp/shared/components/components.dart';
import 'package:myapp/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../modules/news_app/search/search_screen.dart';

class NewsAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsAppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubitobj = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor('333739'),
              title: Text(
                'News App :${cubitobj.newstitlescreens[cubitobj.current_index]}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
                    cubitobj.changemode();
                  },
                  icon: Icon(
                    cubitobj.islightmode!?Icons.brightness_4_outlined:Icons.brightness_4,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: cubitobj.newsscreens[cubitobj.current_index],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: HexColor('333739'),
              items: cubitobj.bottomitems,
              currentIndex: cubitobj.current_index,
              onTap: (index){
                cubitobj.changenavbarindex(index);
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

