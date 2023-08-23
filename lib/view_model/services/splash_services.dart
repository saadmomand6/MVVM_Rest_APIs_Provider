import 'package:flutter/material.dart';
import 'package:mmvm_rest_apis_provider/models/user_model.dart';
import 'package:mmvm_rest_apis_provider/utilities/routes/route_names.dart';
import 'package:mmvm_rest_apis_provider/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthenthication(BuildContext context) {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(const Duration(seconds: 5));
        Navigator.pushNamed(context, RoutesNames.login);
      } else {
        await Future.delayed(const Duration(seconds: 5));
        Navigator.pushNamed(context, RoutesNames.home);
      }
    });
  }
}
