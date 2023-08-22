import 'package:mmvm_rest_apis_provider/data/network/base_api_services.dart';
import 'package:mmvm_rest_apis_provider/data/network/network_api_services.dart';
import 'package:mmvm_rest_apis_provider/resources/app_urls.dart';

class AuthRepository {
  final BaseApiServices _apiservices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservices.getPostApiResponse(AppUrls.loginurl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservices.getPostApiResponse(AppUrls.registerurl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
