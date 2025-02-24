import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    final url = Uri.parse('url');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
