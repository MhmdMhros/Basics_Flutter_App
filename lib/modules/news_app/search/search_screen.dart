import 'package:myapp/layout/newsapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/newsapp_layout/cubit/states.dart';
import 'package:myapp/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchScreen extends StatelessWidget {
  var SearchControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsAppStates>(
        listener: (context,state) {},
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor('333739'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextFormField(
                    controler: SearchControler,
                    onfieldsubmit: (value){
                      print(value);
                    },
                    onchange: (value){
                      cubit.getSearch(value);
                      print(value);
                    },
                    validate: (value){
                      if(value?.isEmpty == true){
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    textitem: 'Search',
                    prefixicon: Icons.search,
                    texttype: TextInputType.text,
                  ),
                ),
                Expanded(child: ArticleBuilder(context, cubit.search,cubit,issearch: true,)),
              ],
            ),
          );
        },
    );
  }
}
