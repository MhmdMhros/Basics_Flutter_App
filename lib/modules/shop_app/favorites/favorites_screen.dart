import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/models/shop_app/login_model/favorites_model.dart';

import '../../../layout/shopapp_layout/cubit/cubit.dart';
import '../../../layout/shopapp_layout/cubit/states.dart';
import '../../../shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: state is ShopFavoritesLoadingState,
          builder: (context) => ListView.separated(
            itemBuilder: (context,index) => buildFavoriteItem(cubit.shopfavoritesmodel!.data!.data![index],context),
            separatorBuilder: (context,index) => myDivider(),
            itemCount: cubit.shopfavoritesmodel!.data!.data!.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
  Widget buildFavoriteItem(DataModel datamodel, BuildContext context) => Padding(
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
                  datamodel.product!.image as String,
                ),
                fit: BoxFit.cover,
                width: 120.0,
                height: 120.0,
              ),
              if(datamodel.product!.discount != 0)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 3.0,),
                  child: Text(
                    'DISCOUNT',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  datamodel.product!.name as String,
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
                      '${datamodel.product!.price.round()}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 8.0,),
                    if(datamodel.product!.discount != 0)
                      Text(
                        '${datamodel.product!.oldPrice.round()}',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.black54,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                      onPressed: (){
                        ShopCubit.get(context).changeFavorites(datamodel.product!.id!);
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: ShopCubit.get(context).favorites![datamodel.product!.id]! ? Colors.deepOrange: Colors.grey,
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
