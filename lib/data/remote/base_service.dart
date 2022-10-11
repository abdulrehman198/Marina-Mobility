abstract class BaseService {
  final String baseURL = 'https://api.mobility.com';

  Future<dynamic> getResponse(String Url);
}
