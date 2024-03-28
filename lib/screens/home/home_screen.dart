import 'package:authenticateme/blocs/sign_in_bloc/sign_in_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Hey UserX , You are signed in"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<SignInBlocBloc>().add(SignOutRequired());
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
    );
  }
}
