import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../resources/components/round_button.dart';
import '../utilities/routes/route_names.dart';
import '../utilities/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);
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
    final authviewmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
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
              title: 'SignUp',
              loading: authviewmodel.signuploading,
              onpress: () {
                if (emailcontroller.text.isEmpty) {
                  Utils.flushBarErrorMessage('enter email', context);
                } else if (passwordcontroller.text.isEmpty) {
                  Utils.flushBarErrorMessage('enter password', context);
                } else if (passwordcontroller.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'password should be more then 6', context);
                } else {
                  Map data = {
                    'email': emailcontroller.text.toString(),
                    'password': passwordcontroller.text.toString()
                  };
                  authviewmodel.signupApiModel(data, context);
                }
              },
            ),
            SizedBox(
              height: height * .1,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.login);
                },
                child: const Text('Already have account? Sign Up')),
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
