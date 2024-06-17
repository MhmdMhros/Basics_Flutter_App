import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/layout/newsapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/todoapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/todoapp_layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../modules/news_app/webview/web_view_screen.dart';
import '../network/local/cache_helper.dart';

String token = CacheHelper.GetData(key: 'TokenSave');
String? socialTokenSave = CacheHelper.GetData(key: 'uId');

Widget defaultButton({
  Color textcolor = Colors.black,
  Color backgroundcolor = Colors.limeAccent,
  double width = double.infinity,
  required String text,
  double radius = 0.0,
  bool isUpperCase = true,
  VoidCallback? function,
}) => Container(
  width: width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radius,
    ),
    color: backgroundcolor,
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase ?text.toUpperCase():text,
      style: TextStyle(
        color: textcolor,
      ),
    ),

  ),
);


Widget defaultTextFormField({
  TextInputType? texttype,
  required TextEditingController controler,
  bool ispassword = false,
  required ValueChanged<String>? onfieldsubmit,
  required ValueChanged<String>? onchange,
  required FormFieldValidator<String>? validate,
  GestureTapCallback? ontap,
  required String textitem,
  required IconData prefixicon,

  IconData? suffixicon,
  VoidCallback? onpressobsecure,
}) => TextFormField(
  keyboardType: texttype,
  controller: controler,
  onFieldSubmitted: onfieldsubmit,
  onChanged: onchange,
  validator: validate,
  onTap: ontap,
  obscureText: ispassword,
  decoration: InputDecoration(
    labelText: textitem,
    prefixIcon: Icon(
      prefixicon,
    ),
    suffixIcon: suffixicon != null ? IconButton(
      onPressed: onpressobsecure,
      icon: Icon(
        suffixicon,),
    ):null,
    border: OutlineInputBorder(),
  ),

);


Widget defaultTaskItem(Map task , context) => Dismissible(
  key: Key(task['id'].toString()),
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundColor: Colors.limeAccent,
          child: Text(
            '${task['time']}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 10.0,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${task['title']}',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 27.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${task['date']}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.0,),
        IconButton(
          onPressed: (){
            AppCubit.get(context).UpdateDatabase(status: 'done', id: task['id']);
          },
          icon: Icon(
            Icons.check_box,
            color: Colors.green,
          ),
        ),
        SizedBox(width: 10.0,),
        IconButton(
          onPressed: (){
            AppCubit.get(context).UpdateDatabase(status: 'archived', id: task['id']);
          },
          icon: Icon(
            Icons.archive,
            color: Colors.blue,
          ),
        ),
      ],
    ),
  ),
  onDismissed: (direction){
    AppCubit.get(context).DeleteDatabase(id: task['id']);
  },
);


Widget ConditionalTaskPages(List<Map> tasks) => ConditionalBuilder(
  condition: tasks.length > 0,
  builder: (context) => ListView.separated(itemBuilder: (context,index) => defaultTaskItem(tasks[index],context), separatorBuilder: (context,index) => myDivider(), itemCount: tasks.length),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          color: Colors.grey,
          size: 100.0,
        ),
        Text(
          'No Tasks Yet, Please Add Some Tasks!',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);

Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey,
);
Widget defaultNewsItems(Map news,Color mode_color,context) => InkWell(
  onTap: (){
    NavigateTo(context, WebViewScreen(news['url']));
  },
  child:   Container(
    color: mode_color,
    child:   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(
                  '${news['urlToImage']}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Container(
              height: 100.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${news['title']}',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 21.0,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${news['publishedAt']}',
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);

void NavigateTo(context,widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void NavigateToAndReplacement(context,widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
  (route){
    return false;
  },
);

Widget ArticleBuilder(context,list , cubit ,{issearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index) => defaultNewsItems(list[index],cubit.islightmode!?Colors.white:HexColor('333739'),context),
    separatorBuilder: (context,index) => myDivider(),
    itemCount: list.length,
  ),
  fallback: (context) => issearch? Container() : Center(child: CircularProgressIndicator()),
);

void ShowToastMessage({
  required String message,
  required ToastStates state,
}) => Fluttertoast.showToast(
  msg: message,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: ChooseToastColor(state),
  textColor: Colors.white,
  fontSize: 16.0,
);
enum ToastStates {SUCCESS,ERROR,WARNING}

Color ChooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

void SignOut({
  required String key,
  required BuildContext context,
  required Widget widget,
}){
  CacheHelper.ClearWithKey(key: key).then((value){
    if(value){
      NavigateToAndReplacement(context, widget);
    }
  });
}


Widget defaultAppBar({
  required BuildContext context,
  String title = '',
  List<Widget>? actions,
}) => AppBar(
  leading: IconButton(
    onPressed: ()
    {
      Navigator.pop(context);
    },
    icon: Icon(
      Icons.arrow_back,
    ),
  ),
  titleSpacing: 5.0,
  title: Text(
    title,
  ),
  actions: actions!,
);

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
  TextStyle? textstyle,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        style: textstyle  ,
      ),
    );