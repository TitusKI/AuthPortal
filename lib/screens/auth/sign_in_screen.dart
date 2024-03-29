

import 'package:authenticateme/blocs/sign_in_bloc/sign_in_bloc_bloc.dart';
import 'package:authenticateme/screens/auth/components/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  IconData iconPassword = Icons.remove_red_eye_rounded;
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
              prefixIcon: const Icon(CupertinoIcons.mail),
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
              prefixIcon: const Icon(Icons.lock_outline),
              errorMsg: _errorMsg,
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
                        iconPassword = Icons.remove_red_eye_rounded;
                      } else {
                        iconPassword = CupertinoIcons.eye_slash_fill;
                      }
                    });
                  },
                  icon: Icon(iconPassword
                  , color: Theme.of(context).colorScheme.primary,
                  )),
            ),
          ),
          const SizedBox(height: 20.0),
          !signInRequired
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<SignInBlocBloc>().add(SignInRequired(emailController.text, passwordController.text));
                      }
                    },
                    style: TextButton.styleFrom(
                      
                      elevation: 3.0,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              : const CircularProgressIndicator()
        ],
      ),
    );
  }
}
