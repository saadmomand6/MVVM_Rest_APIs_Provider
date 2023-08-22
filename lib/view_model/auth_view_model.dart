import 'package:flutter/material.dart';
import 'package:mmvm_rest_apis_provider/repository/auth_repository.dart';
import 'package:mmvm_rest_apis_provider/utilities/routes/route_names.dart';
import 'package:mmvm_rest_apis_provider/utilities/utils.dart';

class AuthViewModel with ChangeNotifier {
  final myrepository = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;
  setloading(value) {
    _loading = value;
    notifyListeners();
  }

  bool _signuploading = false;
  bool get signuploading => _signuploading;
  setsignuploading(value) {
    _signuploading = value;
    notifyListeners();
  }

  Future<void> loginApiModel(dynamic data, BuildContext context) async {
    setloading(true);
    myrepository.loginApi(data).then((value) {
      setloading(false);
      Utils.flushBarErrorMessage('succesful login', context);
      Navigator.pushNamed(context, RoutesNames.home);
    }).onError((error, stackTrace) {
      setloading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> signupApiModel(dynamic data, BuildContext context) async {
    setsignuploading(true);
    myrepository.signupApi(data).then((value) {
      setsignuploading(false);
      Utils.flushBarErrorMessage('signup succesful', context);
      Navigator.pushNamed(context, RoutesNames.home);
    }).onError((error, stackTrace) {
      setsignuploading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
