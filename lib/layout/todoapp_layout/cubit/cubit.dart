import 'dart:async';
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:myapp/layout/todoapp_layout/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../../modules/todo_app/archived_tasks/archived_tasks_screen.dart';
import '../../../modules/todo_app/done_tasks/done_tasks_screen.dart';
import '../../../modules/todo_app/new_tasks/new_tasks_screen.dart';




class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  late Database db;
  List<Map> NewTasks = [];
  List<Map> DoneTasks = [];
  List<Map> ArchivedTasks = [];
  bool isbottomsheet = false;
  IconData floatingIcon = Icons.edit;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  void changenavbar(int index){
    currentindex = index;
    emit(AppButtomNavBarState());
  }

  Future<void> createdatabase() async {
    // id integer
    // title String
    // date String
    // time String
    // status String
    await openDatabase(
      'todo.dp',
      version: 1,
      onCreate: (db, version) {
        print('Database Created!');
        db.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value){
          print('Table Created!');
        }).catchError((onError){
          print('error when created table ${onError.toString()}');
        });
      },
      onOpen: (db) {
        GetTask(db);
        print('Database Opened!');
      },

    ).then((value){
      db = value;
      emit(AppCreateDatabaseState());
    });
  }
  Future InsertToDatabase({
    required String title,
    required String date,
    required String time,
  })
  async {
    return await db.transaction((txn) async {
      txn.rawInsert('INSERT INTO tasks (title,date,time,status) VALUES ("$title","$date","$time","new")').then((value){
        print('$value insert successfully!');
        emit(AppInsertDatabaseState());
        GetTask(db);
      }).catchError((error){
        print('error when insert raw ${error.toString()}');
      });
    });
  }

  void GetTask(db){
    NewTasks = [];
    DoneTasks = [];
    ArchivedTasks = [];
    emit(AppGetDatabaseLoadingState());
    db.rawQuery('SELECT * FROM tasks').then((value){
      value.forEach((element){
        if(element['status'] == 'new'){
          NewTasks.add(element);
        }
        else if(element['status'] == 'done'){
          DoneTasks.add(element);
        }
        else{
          ArchivedTasks.add(element);
        }
      });

      emit(AppGetDatabaseState());
    });
  }

  void ChangeFloatingButton({
    required bool isbottomsheetparam, required IconData icondata
  }){
    isbottomsheet = isbottomsheetparam;
    floatingIcon = icondata;
    emit(AppChangeIconDataState());
  }

  void UpdateDatabase({
    required String status,
    required int id,
}) async {
    db.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
        GetTask(db);
        emit(AppUpdateDatabaseState());
    });
  }

  void DeleteDatabase({
    required int id,
}) async {
    db.rawDelete('DELETE FROM tasks WHERE id = ?',[id]).then((value){
      GetTask(db);
      emit(AppDeleteDatabaseState());
    });
  }
}