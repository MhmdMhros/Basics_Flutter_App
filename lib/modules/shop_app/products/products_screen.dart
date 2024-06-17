import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/layout/shopapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/shopapp_layout/cubit/states.dart';
import 'package:myapp/models/shop_app/login_model/categories_model.dart';
import 'package:myapp/models/shop_app/login_model/home_model.dart';

import '../../../shared/components/components.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopAppStates>(
      listener: (context,state){
        if(state is ShopChangeFavoritesSuccessState){
          if(state.model.status!){
            ShowToastMessage(message: state.model.message!, state: ToastStates.ERROR);
          }
        }
      },
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.shophomemodel != null && cubit.shopcategoriesmodel != null,
            builder: (context) => productsBuilder(cubit.shophomemodel! , cubit.shopcategoriesmodel! ,context),
            fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
  Widget productsBuilder(ShopHomeModel homemodel , ShopCategoriesModel categoriesmodel ,BuildContext context) => SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: homemodel.data!.banners.map((e) => Image(
              image: NetworkImage('${e.image}'),
              width: double.infinity,
              fit: BoxFit.cover,
            ),).toList(),
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              aspectRatio: 16/9,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
            )
        ),
        SizedBox(
          height: 12.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                 fontSize: 24.0,
                 fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => buildCategoryItem(categoriesmodel.data!.data[index]),
                  separatorBuilder: (context,index) => SizedBox(width: 10.0,),
                  itemCount: categoriesmodel.data!.data.length,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'New Products',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1 / 1.51,
            children: List.generate(
                  homemodel.data!.products.length,
                  (index) => buildGridProduct(homemodel.data!.products[index] , context),
            ),
          ),
        ),
      ],
    ),
  );
  Widget buildGridProduct(ProductModel productmodel , context) => Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(
              '${productmodel.image}',
            ),
              width: double.infinity,
              height: 200.0,
            ),
            if(productmodel.discount != 0)
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
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                productmodel.name as String,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${productmodel.price.round()}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 8.0,),
                  if(productmodel.discount != 0)
                    Text(
                      '${productmodel.oldPrice.round()}',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.black54,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                      onPressed: (){
                        ShopCubit.get(context).changeFavorites(productmodel.id!);
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: ShopCubit.get(context).favorites![productmodel.id]! ? Colors.deepOrange: Colors.grey,
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
  );
  Widget buildCategoryItem(DataModel categorymodel) => Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
        image: NetworkImage(categorymodel.image as String,),
        height: 100.0,
        width: 100.0,
        fit: BoxFit.cover,
      ),
      Container(
        color: Colors.black.withOpacity(0.8,),
        width: 100.0,
        child: Text(
          categorymodel.name as String,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
