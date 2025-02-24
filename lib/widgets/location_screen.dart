// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:myapp/components/weather.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/widgets/city_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});

  final dynamic locationWeather; 

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  
  late int temperature;
  late dynamic condition;
  late dynamic cityName;
  late String weatherIcon;
  late String weatherMessage;
  late double temp;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = ' ';
        return;
      }
      temp = (weatherData['main']['temp'] as num).toDouble();
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon = weather.getWeatherIcon(condition as int);
      weatherMessage = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8), 
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      shape: const CircleBorder(),
                    ),
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(Icons.near_me, size: 50),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      shape: const CircleBorder(),
                    ),
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CityScreen(),
                        ),
                      );
                      if (typedName != null) {
                        var weatherData = await weather.getCityWeather(
                          typedName as String,
                          );
                        updateUI(weatherData);
                      }
                    },
                    child: const Icon(Icons.location_city, size: 50),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text('$temperature°', style: tempTextStyle),
                    Text(weatherIcon, style: conditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: messageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
