import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:myapp/layout/todoapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/todoapp_layout/cubit/states.dart';

import '../../../shared/components/components.dart';

class DoneTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var tasks = AppCubit.get(context).DoneTasks;
    return ConditionalTaskPages(tasks);
  }
}
