import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mmvm_rest_apis_provider/data/app_exceptions.dart';
import 'base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responceJson = jsonDecode(response.body);
        return responceJson;
      case 400:
        throw BadRequestExceptions(response.body.toString());
      case 404:
        throw UnAuthorizedExceptions(response.body.toString());
      default:
        throw FetchDataExceptions(
            'Error Occured While Communicating with Server' +
                'with Status Code' +
                response.statusCode.toString());
    }
  }
}
