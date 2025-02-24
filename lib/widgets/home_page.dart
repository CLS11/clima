import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/components/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    final location = Location();
    await location.getCurrentLocation();
  }

  Future<void> getData() async {
    final url = Uri.parse(
      'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22',
    );
    final response = await http.get(url);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
