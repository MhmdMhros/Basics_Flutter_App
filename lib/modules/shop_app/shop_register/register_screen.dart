import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shopapp_layout/cubit/cubit.dart';
import '../../../layout/shopapp_layout/cubit/states.dart';
import '../../../layout/shopapp_layout/shop_app.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/local/cache_helper.dart';

class ShopRegisterScreen extends StatefulWidget {
  @override
  State<ShopRegisterScreen> createState() => _ShopRegisterScreenState();
}

class _ShopRegisterScreenState extends State<ShopRegisterScreen> {
  var shop_formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  bool shop_obsecure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopAppStates>(
      listener: (context,state){
        if(state is ShopRegisterSuccessState){
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
                        'Register',
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
                        texttype: TextInputType.name,
                        controler: nameController,
                        validate: (value) {
                          if(value?.isEmpty == true){
                            return 'name must not be empty';
                          }
                          return null;
                        },
                        textitem: 'Name',
                        prefixicon: Icons.person,
                        onchange: (value){
                        },
                        onfieldsubmit: (value){
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                        texttype: TextInputType.emailAddress,
                        controler: emailController,
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
                        texttype: TextInputType.phone,
                        controler: phoneController,
                        validate: (value) {
                          if(value?.isEmpty == true){
                            return 'phone must not be empty';
                          }
                          return null;
                        },
                        textitem: 'Phone Number',
                        prefixicon: Icons.phone,
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
                        controler: passwordController,
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
                          text: 'Register',
                          function: (){
                            if(shop_formKey.currentState?.validate() == true){
                              cubit.UserRegister(name: nameController.text, email: emailController.text, phone: phoneController.text, password: passwordController.text);
                            }
                          },
                        ),
                        fallback: (context) => Center(child: CircularProgressIndicator()),
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
