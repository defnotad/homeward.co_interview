import 'package:flutter/material.dart';

import './screens/loginScreen.dart';
import './screens/blogsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homeward.co',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        BlogsScreen.routeName: (ctx) => BlogsScreen(),
      },
    );
  }
}
