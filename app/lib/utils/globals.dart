import 'package:dio/dio.dart';
import 'package:prime_ai_flutter_ui_kit/api/RestClient.dart';

class Globals {
  static String baseUrl = "http://192.168.0.11:8080/api/v1";
  static late RestClient client;
  static initRest() {
    Dio dio = Dio();
    client = RestClient(dio, baseUrl: baseUrl);
  }
}
