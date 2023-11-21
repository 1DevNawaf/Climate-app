import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String weatherData = response.body;
      var decode = jsonDecode(weatherData);
      return decode;
    } else
      log("Status Code ----> " + response.statusCode.toString());
  }
}
