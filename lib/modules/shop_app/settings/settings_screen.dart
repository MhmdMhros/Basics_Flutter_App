import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/layout/shopapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/shopapp_layout/cubit/states.dart';
import 'package:myapp/modules/shop_app/shop_login/shop_login_screen.dart';

import '../../../shared/components/components.dart';

class SettingsScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopAppStates>(
      listener: (context,state) {
      },
      builder: (context,state) {
        var cubit = ShopCubit.get(context);
        nameController.text = cubit.shopprofilemodel!.data!.name!;
        emailController.text = cubit.shopprofilemodel!.data!.email!;
        phoneController.text = cubit.shopprofilemodel!.data!.phone!;

        return ConditionalBuilder(
            condition: ShopCubit.get(context).shopprofilemodel != null,
            builder: (context) => Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            print(value);
                          },
                          onfieldsubmit: (value){
                            print(value);
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
                            print(value);
                          },
                          onfieldsubmit: (value){
                            print(value);
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
                          textitem: 'Phone',
                          prefixicon: Icons.phone,
                          onchange: (value){
                            print(value);
                          },
                          onfieldsubmit: (value){
                            print(value);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                          text: 'Update',
                          isUpperCase: false,
                          backgroundcolor: Colors.deepOrange,
                          function: (){
                            if(formKey.currentState?.validate() == true){
                              cubit.UpdateUserData(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                          text: 'Logout',
                          isUpperCase: false,
                          backgroundcolor: Colors.deepOrange,
                          function: (){
                            if(formKey.currentState?.validate() == true){
                              SignOut(
                                  key: 'token',
                                  context: context,
                                  widget: ShopLoginScreen(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
