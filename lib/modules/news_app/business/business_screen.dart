import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:myapp/layout/newsapp_layout/cubit/states.dart';
import 'package:myapp/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../layout/newsapp_layout/cubit/cubit.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsAppStates>(
        listener: (context,state){
        },
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          return ArticleBuilder(context, cubit.business,cubit);
        },
    );
  }
}