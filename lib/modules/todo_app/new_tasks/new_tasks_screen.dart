import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:myapp/shared/components/components.dart';
import 'package:myapp/shared/components/constants.dart';
import 'package:myapp/layout/todoapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/todoapp_layout/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var tasks = AppCubit.get(context).NewTasks;
        return ConditionalTaskPages(tasks);
      },
    );
  }
}
