import 'package:dio/dio.dart';
import './endpoints.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio();
  }

// this static function is used to get data from jumiaa api
  static Future<Response> getDataFromJumiaa(String path) async {
    dio.options.baseUrl = kJumiaaBaseUrl;
    dio.options.headers = {
      'X-RapidAPI-Key': '31805705d8msh9c4bc38c258c5c5p1a687ejsn1b1bb68fede9',
      'X-RapidAPI-Host': 'jumia-service.p.rapidapi.com'
    };
    final response = await dio.get(
      path,
    );
    return response;
  }

// this static function is used to get data from AliExpress api
  static Future<Response> getDataFromAliExpress(String name) async {
    dio.options.baseUrl = kAliExpressBaseUrl;
    dio.options.headers = {
      'X-RapidAPI-Key': '31805705d8msh9c4bc38c258c5c5p1a687ejsn1b1bb68fede9',
      'X-RapidAPI-Host': 'magic-aliexpress1.p.rapidapi.com'
    };
    final response = await dio.get('products/search', queryParameters: {
      'name': name,
      'minSalePrice': 5,
      'shipToCountry': 'FR',
      'sort': 'SALE_PRICE_ASC',
      'page': '1',
      'targetCurrency': 'INR'
    });
    return response;
  }
}
