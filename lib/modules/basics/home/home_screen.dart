import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        leading: IconButton(onPressed: (){print('Menu!!!!!!!!');},icon: Icon(
        Icons.menu_open,
        color: Colors.black,
      )) ,
        title: Text(
          'Guns Store',
          style: const TextStyle(
            color: Colors.black
          ),
        ),
        actions:
        [
          IconButton(onPressed: (){print("Search!!!!!!!!!!!");}, icon: Icon(
            Icons.search,
            color: Colors.black,
          )),
          IconButton(onPressed: (){print("Notification!!!!!!!");}, icon: Icon(
            Icons.notification_important,
            color: Colors.black,
          )),
          IconButton(onPressed: (){print('Alarm!!!!!!');}, icon: Icon(
            Icons.access_alarm,
            color: Colors.black,
          )),
        ],
        elevation: 20,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.limeAccent.withOpacity(1),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 4.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                              height: 180.0,
                              width: 180.0,
                              fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image(image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZinE-J_5CNn13uZEx1B0ZxPC56XnrJPfCw&usqp=CAU'
                              ),
                                height: 180.0,
                                width: 180.0,
                                fit: BoxFit.cover,),
                              Container(
                                color: Colors.white.withOpacity(0.3),
                                width: 200.0,
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Good Gun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     color: Colors.greenAccent,
      //     width: double.infinity,
      //     child: Column(
      //       mainAxisSize: MainAxisSize.max,
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Container(
      //           child: Text('First Text',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 30.0,
      //               ),
      //           ),
      //           color: Colors.red,
      //         ),
      //         Container(
      //           child: Text('Second Text',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 30.0,
      //               ),
      //           ),
      //           color: Colors.green,
      //         ),
      //         Container(
      //           child: Text('Third Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.blue,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('Fourth Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.yellow,
      //         ),
      //         Container(
      //           child: Text('First Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.red,
      //         ),
      //         Container(
      //           child: Text('First Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.red,
      //         ),
      //         Container(
      //           child: Text('First Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.red,
      //         ),
      //         Container(
      //           child: Text('First Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.red,
      //         ),
      //         Container(
      //           child: Text('First Text',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //           color: Colors.red,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}