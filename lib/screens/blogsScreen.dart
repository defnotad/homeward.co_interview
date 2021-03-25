import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/token.dart';

class BlogsScreen extends StatefulWidget {
  static final routeName = '/blogs-screen';

  @override
  _BlogsScreenState createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  @override
  Widget build(BuildContext context) {
    final token = Provider.of<Token>(context).token;

    return Scaffold(
      appBar: AppBar(
        title: Text(token.toString()),
      ),
    );
  }
}
