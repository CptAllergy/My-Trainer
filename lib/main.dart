import 'package:flutter/material.dart';
import 'package:my_trainer/src/pages/home_page.dart';
import 'package:my_trainer/src/states/global_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyTrainerApp());
}

class MyTrainerApp extends StatelessWidget {
  const MyTrainerApp({super.key});

  @override
  Widget build(BuildContext context) {

    var colorScheme = ColorScheme(
      primary: Color(0xd7f4d04d),
      onPrimary: Colors.white,
      secondary: Color(0xFFEFF3F3),
      onSecondary: Color(0xFF322942),
      error: Colors.redAccent,
      onError: Colors.white,
      surface: Color(0xFF141414),
      onSurface: Color(0xFF241E30),
      brightness: Brightness.dark,
    );

    return ChangeNotifierProvider(
      create: (context) => GlobalState(),
      child: MaterialApp(
        title: 'My Trainer',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme,
        ),
        home: HomePage(),
      ),
    );
  }
}







