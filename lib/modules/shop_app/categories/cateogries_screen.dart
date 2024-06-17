import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/models/shop_app/login_model/categories_model.dart';
import 'package:myapp/shared/components/components.dart';

import '../../../layout/shopapp_layout/cubit/cubit.dart';
import '../../../layout/shopapp_layout/cubit/states.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        return ListView.separated(
          itemBuilder: (context,index) => buildCategoryItem(cubit.shopcategoriesmodel!.data!.data[index]),
          separatorBuilder: (context,index) => myDivider(),
          itemCount: cubit.shopcategoriesmodel!.data!.data.length,
        );
      },
    );
  }
  Widget buildCategoryItem(DataModel catmodel) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(catmodel.image as String,),
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          catmodel.name as String,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    ),
  );
}
