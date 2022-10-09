import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:marina_mobility/data/network/BaseService.dart';
import '../AppException.dart';

//post,delete,put methods can be defined below

class Service extends BaseService {
  @override
  Future getResponse(String Url) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(baseURL + Url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
