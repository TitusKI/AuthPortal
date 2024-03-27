import 'package:authenticateme/screens/auth/components/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  bool signUpRequired  = false;
  bool containsUpperCase = false;
  bool containsLowerCase = false;   
  bool containsNumber =false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
              SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(CupertinoIcons.mail_solid),
                  // color: Theme.of(context).colorScheme.primary),
              
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
          const SizedBox(height: 10,),
            SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),
              onChanged: (pass){
                if(pass!.contains(RegExp(r'[A-Z]'))){
                  setState(() {
                    containsUpperCase =true;
                  });
                
                }
                  else{
                    setState(() {
                      containsUpperCase = false;
                    });
                  }
                   if(pass.contains(RegExp(r'[a-z]'))){
                  setState(() {
                    containsLowerCase =true;
                  });
                
                }
                  else{
                    setState(() {
                      containsUpperCase = false;
                    });
                  }
                   if(pass!.contains(RegExp(r'[0-9]'))){
                  setState(() {
                    containsNumber =true;
                  });
                
                }
                  else{
                    setState(() {
                      containsNumber = false;
                    });
                  }
                   if(pass.contains(RegexPattern.alphaNumericSymbolOnly)){
                  setState(() {
                    containsSpecialChar =true;
                  });
                
                }
                  else{
                    setState(() {
                      containsSpecialChar = false;
                    });
                  }
                   if(pass.length >= 8){
                  setState(() {
                    contains8Length =true;
                  });
                
                }
                  else{
                    setState(() {
                      contains8Length = false;
                    });
                  }
                  return null;
              },
              validator: (valpass) {
                if (valpass!.isEmpty) {
                  return "Please fill in this field";
                } else if (!valpass.isPasswordHard()) {
                  return "Please enter a valid password";
                }
                return null;
              },
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                      if (obscurePassword) {
                        iconPassword = CupertinoIcons.eye_fill;
                      } else {
                        iconPassword = CupertinoIcons.eye_slash_fill;
                      }
                    });
                  },
                  icon: Icon(iconPassword)),
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•	 1 Uppercase",
                    style: TextStyle(
                      color: containsUpperCase 
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground
                    ),

                  ),
                    Text(
                    "•	 1 Uppercase",
                    style: TextStyle(
                      color: containsUpperCase 
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground
                    ),

                  ),
                    Text(
                    "•	 1 Uppercase",
                    style: TextStyle(
                      color: containsUpperCase 
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground
                    ),

                  ),
                    Text(
                    "•	 1 Uppercase",
                    style: TextStyle(
                      color: containsUpperCase 
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground
                    ),

                  ),
                    Text(
                    "•	 1 Uppercase",
                    style: TextStyle(
                      color: containsUpperCase 
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground
                    ),

                  ),
                ],
              )
            ],
          )
          ],
        )
      ),
      
      );
  }
}