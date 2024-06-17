import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/shared/components/components.dart';

import '../../../layout/shopapp_layout/cubit/cubit.dart';
import '../../../layout/shopapp_layout/cubit/states.dart';
import '../../../models/shop_app/login_model/search_model.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocConsumer<ShopCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children:
                [
                  defaultTextFormField(
                    texttype: TextInputType.text,
                    controler: searchController,
                    onchange: (value){
                    },
                    onfieldsubmit: (String text){
                      cubit.search(text);
                    },
                    validate: (value) {
                      if(value?.isEmpty == true){
                        return 'enter text to search';
                      }
                      return null;
                    },
                    textitem: 'Search',
                    prefixicon: Icons.search,
                  ),
                  SizedBox(height: 10.0,),
                  if(state is ShopSearchLoadingState)
                    LinearProgressIndicator(),
                  if(state is ShopSearchSuccessState)
                    Expanded(
                    child: ListView.separated(
                      itemBuilder: (context,index) => buildSearchItem(cubit.shopsearchmodel!.data!.data![index],context),
                      separatorBuilder: (context,index) => myDivider(),
                      itemCount: cubit.shopsearchmodel!.data!.data!.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget buildSearchItem(Product product, BuildContext context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(
                  product!.image as String,
                ),
                fit: BoxFit.cover,
                width: 120.0,
                height: 120.0,
              ),
            ],
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product!.name as String,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '${product!.price.round()}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blue,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: (){
                        ShopCubit.get(context).changeFavorites(product!.id!);
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: ShopCubit.get(context).favorites![product!.id]! ? Colors.deepOrange: Colors.grey,
                        child: Icon(
                          Icons.favorite_border,
                          size: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

}
