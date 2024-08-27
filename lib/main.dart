import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(),
        appBarTheme: const AppBarTheme(
          backgroundColor: MaterialColor(0xFF0A0E21, kColorSwatch),
        ),
        scaffoldBackgroundColor: const MaterialColor(0xFF0A0E21, kColorSwatch),
      ),
      home: const InputPage(),
    );
  }
}
