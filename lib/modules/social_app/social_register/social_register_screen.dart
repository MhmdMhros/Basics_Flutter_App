import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/layout/socialapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/socialapp_layout/cubit/states.dart';
import 'package:myapp/layout/socialapp_layout/social_app.dart';

import '../../../shared/components/components.dart';

class SocialRegisterScreen extends StatefulWidget {
  @override
  State<SocialRegisterScreen> createState() => _SocialRegisterScreenState();
}

class _SocialRegisterScreenState extends State<SocialRegisterScreen> {
  var social_formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  bool social_obsecure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialCubit(),
      child: BlocConsumer<SocialCubit,SocialAppStates>(
        listener: (context,state){
          if(state is SocialCreateSuccessState){
            NavigateToAndReplacement(context, SocialLayout());
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
                            text: 'Register',
                            function: (){
                              if(social_formKey.currentState?.validate() == true){
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
      ),
    );
  }
}
