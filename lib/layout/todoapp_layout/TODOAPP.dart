import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:myapp/shared/components/components.dart';
import 'package:myapp/layout/todoapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/todoapp_layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../shared/components/constants.dart';

class ToDoApp extends StatelessWidget
{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey2 = GlobalKey<FormState>();
  var titlecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createdatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates states){},
        builder: (BuildContext context,AppStates states){
          var cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.limeAccent,
              title: Text(
                'Todo App : ${cubit.titles[cubit.currentindex]}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition: states is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentindex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                if(cubit.isbottomsheet)
                {
                  if(formKey2.currentState!.validate() == true){
                    cubit.InsertToDatabase(title: titlecontroller.text, date: datecontroller.text, time: timecontroller.text);
                    Navigator.pop(context);
                  }
                }
                else
                {
                  scaffoldKey.currentState!.showBottomSheet(
                        (context) => Container(
                      color: Colors.grey[100],
                      padding: EdgeInsets.all(10.0),
                      child: Form(
                        key: formKey2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultTextFormField(
                              texttype: TextInputType.text,
                              controler: titlecontroller,
                              onfieldsubmit: (value){print(value);},
                              onchange: (value){print(value);},
                              validate: (value){
                                if(value?.isEmpty == true){
                                  return 'title task must not be empty';
                                }
                              },
                              textitem: 'Task Title',
                              prefixicon: Icons.title,
                            ),
                            SizedBox(height: 7.0,),
                            defaultTextFormField(
                              controler: datecontroller,
                              onfieldsubmit: (value){print(value);},
                              onchange: (value){print(value);},
                              validate: (value){
                                if(value?.isEmpty == true){
                                  return 'date task must not be empty';
                                }
                              },
                              ontap: () {
                                showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2024-02-27'),
                                ).then((value){
                                  datecontroller.text = DateFormat.yMMMd().format(value!);
                                  print(datecontroller.text);
                                });
                              },
                              textitem: 'Task Date',
                              prefixicon: Icons.date_range_outlined,
                            ),
                            SizedBox(height: 7.0,),
                            defaultTextFormField(
                              controler: timecontroller,
                              onfieldsubmit: (value){print(value);},
                              onchange: (value){print(value);},
                              validate: (value){
                                if(value?.isEmpty == true){
                                  return 'time task must not be empty';
                                }
                              },
                              ontap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),).then((value){
                                  timecontroller.text = value!.format(context).toString();
                                  print(timecontroller.text);
                                });
                              },
                              textitem: 'Task Time',
                              prefixicon: Icons.watch_later_outlined,
                            ),

                          ],
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  ).closed.then((value){
                    cubit.ChangeFloatingButton(isbottomsheetparam: false, icondata: Icons.edit);
                  });
                  cubit.ChangeFloatingButton(isbottomsheetparam: true, icondata: Icons.add);
                }

              },
              child: Icon(
                cubit.floatingIcon,
                color: Colors.black,
              ),
              backgroundColor: Colors.limeAccent,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 10.0,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.yellow,
              currentIndex: cubit.currentindex,
              onTap: (index){
                cubit.changenavbar(index);
                print(cubit.currentindex);
              },
              items:
              [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.done,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive,
                  ),
                  label: 'Archives',
                ),
              ],
            ),

          );
        },
      ),
    );

  }



}

