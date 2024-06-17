import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:myapp/layout/shopapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/shopapp_layout/shop_app.dart';
import 'package:myapp/modules/shop_app/shop_register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/shared/network/local/cache_helper.dart';

import '../../../layout/shopapp_layout/cubit/states.dart';
import '../../../shared/components/components.dart';

class ShopLoginScreen extends StatefulWidget {
  @override
  State<ShopLoginScreen> createState() => _ShopLoginScreenState();
}

class _ShopLoginScreenState extends State<ShopLoginScreen> {
  var shop_emailaddress = TextEditingController();

  var shop_password = TextEditingController();

  bool shop_obsecure = true;

  var shop_formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopAppStates>(
        listener: (context,state){
          if(state is ShopLoginSuccessState){
            if((state.model!.status!)){
              ShowToastMessage(
                  message: state.model!.message!,
                  state: ToastStates.SUCCESS,
              );
              CacheHelper.SaveData(key: 'TokenSave', value: state.model.data!.token).then((value){
                ShopCubit.get(context).HelloHomePage(state);
                NavigateToAndReplacement(context, ShopAppScreen());
              });
            }
          }
          else if(state is ShopLoginErrorState){
            ShowToastMessage(
              message: state.model!.message!,
              state: ToastStates.ERROR,
            );
          }
        },
        builder: (context,state){
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepOrange,
              title: const Text(
                'Shop App',
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
                    key: shop_formKey,
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
                          controler: shop_emailaddress,
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
                          controler: shop_password,
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
                          ispassword: shop_obsecure,
                          suffixicon: shop_obsecure?Icons.visibility_off:Icons.visibility,
                          onpressobsecure: (){
                            setState((){
                              shop_obsecure = !shop_obsecure;
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
                              if(shop_formKey.currentState?.validate() == true){
                                cubit.UserLogin(email: shop_emailaddress.text, password: shop_password.text);
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
                                NavigateTo(context, ShopRegisterScreen());
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
      );
  }
}
