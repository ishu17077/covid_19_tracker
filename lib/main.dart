import 'package:flutter/material.dart';
import 'package:covid_19_tracker/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
          )),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        listTileTheme: ListTileThemeData(
          tileColor: Colors.white,
        ),
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
