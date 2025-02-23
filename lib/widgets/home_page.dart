import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
