import 'package:authenticateme/screens/auth/components/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:regexpattern/regexpattern.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.mail),
              errorMsg: _errorMsg,
              validator: (validate) {
                if (validate!.isEmpty) {
                  return "Please fill in this field";
                } else if (!validate.isEmail()) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
              controller: passwordController,
              hintText: "password",
              obscureText: obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),
              errorMsg: _errorMsg,
            validator:(valpass) {
              if(valpass!.isEmpty){
                return "Please fill in this field";

              }
              else if (!valpass.isPasswordNormal1()){
                return "Please enter a valid password";
              }
              return null;
              
            },
            suffixIcon: IconButton(onPressed: (){
              setState(){
                obscurePassword = !obscurePassword;
                if(obscurePassword){
                  iconPassword =  CupertinoIcons.eye_fill;

                }else{
                  iconPassword = CupertinoIcons.eye_slash_fill;
                }
              }
            }, icon: Icon(iconPassword)),
            ),
          ),
        ],
      ),
    );
  }
}
