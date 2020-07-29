import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/great_places.dart';
import 'package:todo/screens/add_place_screen.dart';
import 'package:todo/screens/places_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.yellow,
        ),

        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routName: (ctx) => AddPlaceScreen(),
          },
      ),
    );
  }
}

