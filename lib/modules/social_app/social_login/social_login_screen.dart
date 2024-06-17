import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/layout/socialapp_layout/cubit/states.dart';
import 'package:myapp/layout/socialapp_layout/social_app.dart';
import 'package:myapp/modules/social_app/social_register/social_register_screen.dart';

import '../../../layout/socialapp_layout/cubit/cubit.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/local/cache_helper.dart';

class SocialLoginScreen extends StatefulWidget {
  @override
  State<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends State<SocialLoginScreen> {
  var social_formKey = GlobalKey<FormState>();

  var social_emailaddress = TextEditingController();

  var social_password = TextEditingController();

  bool social_obsecure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialCubit(),
      child: BlocConsumer<SocialCubit,SocialAppStates>(
        listener: (context,state){
          if(state is SocialLoginSuccessState){
            ShowToastMessage(
              message: 'Login successfully',
              state: ToastStates.SUCCESS,
            );
            CacheHelper.SaveData(key: 'uId', value: state.uId).then((value){
              NavigateToAndReplacement(context, SocialLayout());
            });
          }
          else if(state is SocialLoginErrorState){
            ShowToastMessage(
              message: state.error,
              state: ToastStates.ERROR,
            );
          }
        },
        builder: (context,state){
          var cubit = SocialCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepOrange,
              title: const Text(
                'Social App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: social_formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                          texttype: TextInputType.emailAddress,
                          controler: social_emailaddress,
                          validate: (value) {
                            if(value?.isEmpty == true){
                              return 'email must not be empty';
                            }
                            return null;
                          },
                          textitem: 'Email Address',
                          prefixicon: Icons.email,
                          onchange: (value){
                          },
                          onfieldsubmit: (value){
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                          texttype: TextInputType.visiblePassword,
                          controler: social_password,
                          validate: (value) {
                            if(value?.isEmpty == true){
                              return 'password must not be empty';
                            }
                            return null;
                          },
                          textitem: 'Password',
                          prefixicon: Icons.lock,
                          onchange: (value){
                          },
                          onfieldsubmit: (value){
                          },
                          ispassword: social_obsecure,
                          suffixicon: social_obsecure?Icons.visibility_off:Icons.visibility,
                          onpressobsecure: (){
                            setState((){
                              social_obsecure = !social_obsecure;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: true,
                          builder: (context) => defaultButton(
                            backgroundcolor: Colors.deepOrange,
                            textcolor: Colors.white,
                            text: 'Login',
                            function: (){
                              if(social_formKey.currentState?.validate() == true){
                                cubit.UserLogin(email: social_emailaddress.text, password: social_password.text);
                              }
                            },
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            TextButton(
                              onPressed: (){
                                NavigateTo(context, SocialRegisterScreen());
                              },
                              child: Text(
                                'Register Now',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
