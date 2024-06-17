import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myapp/layout/socialapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/socialapp_layout/cubit/states.dart';
import 'package:myapp/modules/social_app/social_newpost/newpost_screen.dart';

import '../../shared/components/components.dart';

class SocialLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialAppStates>(
        listener: (context,state){
          if(state is SocialNewPostState){
            NavigateTo(context, SocialNewPostScreen());
          }
        },
        builder: (context,state) {
          var cubit = SocialCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purpleAccent,
              title: Text(
                cubit.socialtitlescreens[cubit.current_index],
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: (){
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: (){
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: ConditionalBuilder(
                  condition: cubit.usermodel != null,
                  builder: (context){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,),
                      child: Column(
                        children: [
                          if (!(FirebaseAuth.instance.currentUser!.emailVerified))
                            Container(
                              color: Colors.amber.withOpacity(0.6,),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                                child: Row(
                                  children: [
                                    Icon(Icons.info_outline,),
                                    SizedBox(width: 15.0,),
                                    Expanded(
                                      child: Text(
                                        'Please verify your email',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.0,),
                                    TextButton(
                                      onPressed: (){
                                        FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value){
                                          ShowToastMessage(
                                            message: 'Check Your Email',
                                            state: ToastStates.SUCCESS,
                                          );
                                        }).catchError((error){
                                          print(error.toString());
                                        });
                                      },
                                      child: Text(
                                        'SEND',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          cubit.socialscreens[cubit.current_index],

                        ],
                      ),
                    );
                  },
                  fallback: (context) => Center(child: CircularProgressIndicator()),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.socialbottomitems,
              currentIndex: cubit.current_index,
              onTap: (index){
                cubit.changenavbarindex(index);
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.purpleAccent,
              unselectedItemColor: Colors.grey,
            ),
          );
        },
    );
  }
}
