import 'package:flutter/material.dart';
import 'package:http_hp/providers/data_provider.dart';
import 'package:http_hp/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DataProvider()..getEpisodes(),
      child: MaterialApp(
        title: 'Flutter DSC',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(title: 'HTTP Happy Path'),
      ),
    );
  }
}
