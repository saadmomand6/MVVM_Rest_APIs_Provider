import 'package:flutter/material.dart';
import 'package:mmvm_rest_apis_provider/utilities/routes/route_names.dart';
import 'package:mmvm_rest_apis_provider/utilities/utils.dart';

import '../resources/components/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  FocusNode emailfocusnode = FocusNode();
  FocusNode passwordfocusnode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    emailfocusnode.dispose();
    passwordfocusnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email),
                  hintText: 'Email',
                  labelText: 'Email'),
              focusNode: emailfocusnode,
              onFieldSubmitted: (value) {
                Utils.fieldfocuschange(
                    context, emailfocusnode, passwordfocusnode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obsecurepassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: passwordcontroller,
                  obscureText: _obsecurepassword.value,
                  obscuringCharacter: '*',
                  focusNode: passwordfocusnode,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurepassword.value = !_obsecurepassword.value;
                          },
                          child: Icon(_obsecurepassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility))),
                );
              },
            ),
            SizedBox(
              height: height * .1,
            ),
            RoundButton(
              title: 'login',
              onpress: () {
                if (emailcontroller.text.isEmpty) {
                  Utils.flushBarErrorMessage('enter email', context);
                } else if (passwordcontroller.text.isEmpty) {
                  Utils.flushBarErrorMessage('enter password', context);
                } else if (passwordcontroller.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'password should be more then 6', context);
                }
              },
            )
            // Center(
            //   child: InkWell(
            //       onTap: () {
            //         Utils.snackBar('scascasc', context);
            //         Utils.flushBarErrorMessage('scascasc', context);
            //         Utils.toastmessage('asdasd');
            //         Navigator.pushNamed(context, RoutesNames.home);
            //       },
            //       child: const Text('click')),
            // )
          ],
        ),
      ),
    );
  }
}
