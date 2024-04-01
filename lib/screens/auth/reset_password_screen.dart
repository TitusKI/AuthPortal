import 'package:authenticateme/blocs/sign_in_bloc/sign_in_bloc_bloc.dart';
import 'package:authenticateme/screens/auth/components/my_text_field.dart';
import 'package:authenticateme/screens/home/background_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regexpattern/regexpattern.dart';

class ResetScreen extends StatefulWidget {
  final String email;
  const ResetScreen({super.key, required this.email});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late TextEditingController emailController;
  bool resetRequired = false;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.email);

    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(
            "Sign In Help",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'Find your account',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
                    'Enter your username or the email \n or phone number linked to your\n                account',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w300))),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: MyTextField(
                key: _formKey,
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                validator: (validate) {
                  if (validate!.isEmpty) {
                    return "Please fill in this field";
                  } else if (!validate.isEmail()) {
                    return "Please enter a your email";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            !resetRequired
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          context.read<SignInBlocBloc>().add(
                                ResetPasswordRequired(emailController.text),
                              );
                        }
                      },
                      style: TextButton.styleFrom(
                        elevation: 3.0,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        child: Text(
                          'Next',
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
                : const CircularProgressIndicator(),
            const SizedBox(
              height: 14,
            ),
            Center(
              child: Text(
                'Can\'t reset your password?',
                style: TextStyle(
                    fontSize: 15, color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
