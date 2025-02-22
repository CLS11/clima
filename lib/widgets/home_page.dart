// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> getLocation() async {
    final position = await Geolocator
    .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: getLocation, 
          child: const Text('G E T  L O C A T I O N'),
        ),
      ),
    );
  }
}