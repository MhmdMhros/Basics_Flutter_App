import 'package:myapp/shared/components/components.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailaddress = TextEditingController();
  var password = TextEditingController();
  bool obsecure = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        title: const Text(
          'Guns Store',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                      controler: emailaddress,
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
                    texttype: TextInputType.visiblePassword,
                    controler: password,
                    validate: (value) {
                      if(value?.isEmpty == true){
                        return 'password must not be empty';
                      }
                      return null;
                    },
                    textitem: 'Password',
                    prefixicon: Icons.lock,
                    onchange: (value){
                      print(value);
                    },
                    onfieldsubmit: (value){
                      print(value);
                    },
                    ispassword: obsecure,
                    suffixicon: obsecure?Icons.visibility:Icons.visibility_off,
                    onpressobsecure: (){
                      setState((){
                        obsecure = !obsecure;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: 'Login',
                    function: (){
                      if(formKey.currentState?.validate() == true){
                         print(emailaddress.text);
                        print(password.text);
                      }
                    },
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
                      TextButton(onPressed: (){}, child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: Colors.yellow
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
