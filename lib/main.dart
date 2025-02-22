import 'package:flutter/material.dart';
import 'package:myapp/widgets/home_page.dart';

void main() {
  runApp(Clima());
}

class Clima extends StatelessWidget {
  const Clima({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData.dark(),
    );
  }
}
