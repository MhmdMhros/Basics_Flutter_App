import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../layout/newsapp_layout/cubit/cubit.dart';
import '../../../layout/newsapp_layout/cubit/states.dart';
import '../../../shared/components/components.dart';


class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsAppStates>(
      listener: (context,state){
      },
      builder: (context,state){
        var cubit = NewsCubit.get(context);
        return ArticleBuilder(context, cubit.Science,cubit);
      },
    );
  }
}