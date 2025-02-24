import 'package:flutter/material.dart';
import 'package:myapp/components/location.dart';
import 'package:myapp/components/networking.dart';

const apiKey = '182045b56f2e3480a284defb58cb861b';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    final location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude!;
    longitude = location.longitude!;
    NetworkHelper networkHelper = NetworkHelper(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey',
    );
    var weatherData = await networkHelper.getData();
    // final temperature = decodedData['main']['temp'];
    // final condition = decodedData['weather'][0]['id'];
    // final cityName = decodedData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
