import 'package:flutter/material.dart';
import 'package:mmvm_rest_apis_provider/utilities/routes/route_names.dart';
import 'package:mmvm_rest_apis_provider/utilities/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          Center(
            child: InkWell(
                onTap: () {
                  Utils.snackBar('scascasc', context);
                  Utils.flushBarErrorMessage('scascasc', context);
                  Utils.toastmessage('asdasd');
                  Navigator.pushNamed(context, RoutesNames.home);
                },
                child: const Text('click')),
          )
        ],
      ),
    );
  }
}
