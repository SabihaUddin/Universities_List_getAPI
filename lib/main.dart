import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universities_list_api/screen/home.dart';
import 'package:universities_list_api/utiles/home_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context)=>HomeProvider())
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage()
      ),
    );
  }
}

