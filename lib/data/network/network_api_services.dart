import 'dart:io';
import 'package:mmvm_rest_apis_provider/data/app_exceptions.dart';
import 'base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    }
  }

  @override
  Future getPostApiResponse(String url) {}
}
