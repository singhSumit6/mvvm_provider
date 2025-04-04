import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_provider/data/app_exceptions.dart';
import 'package:mvvm_provider/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection.");
    } on TimeoutException {
      throw FetchDataException("The connection has timed out.");
    } on FormatException {
      throw FetchDataException("Bad response format.");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 30));
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection.");
    } on TimeoutException {
      throw FetchDataException("The connection has timed out.");
    } on FormatException {
      throw FetchDataException("Bad response format.");
    } catch (e) {
      rethrow;
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        try {
          return jsonDecode(response.body);
        } catch (e) {
          throw FetchDataException("Failed to decode response: $e");
        }
      case 400:
        throw BadRequestException("Bad Request.");
      case 401:
      case 403:
      case 404:
        throw UnatuhorisedException(
            "You are not authorized to access this resource.");
      case 500:
      case 502:
      case 503:
        throw FetchDataException(
            "Server error with status code ${response.statusCode}.");
      default:
        throw FetchDataException(
            "Unexpected error with status code ${response.statusCode}.");
    }
  }
}
