import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/token.dart';
import '../models/blog.dart';

class BlogEntryScreen extends StatefulWidget {
  static const routeName = '/blog-entry-screen';

  @override
  _BlogEntryScreenState createState() => _BlogEntryScreenState();
}

class _BlogEntryScreenState extends State<BlogEntryScreen> {
  Blog blog;
  bool isLoading = false;

  void retrieveBlog(int blogId) async {
    setState(() {
      isLoading = true;
    });
    final providerData = Provider.of<Token>(context, listen: false);
    final token = providerData.token;
    Uri url = Uri.parse(
        'https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs/$blogId');
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authentication': 'Bearer $token',
    };

    http.Response response = await http.get(url, headers: headers);

    final responseBody = jsonDecode(response.body);

    blog = Blog(
      id: int.parse(responseBody["id"]),
      title: responseBody["title"],
      imageUrl: responseBody["imageUrl"],
      createdAt: DateTime.parse(responseBody["createdAt"]),
    );
    print(responseBody["imageUrl"]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final blogId = ModalRoute.of(context).settings.arguments;
      retrieveBlog(blogId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // retrieveBlog(blogId, context);
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  child: Image.network(blog.imageUrl),
                ),
                Container(
                  child: Text(blog.title),
                ),
                Container(
                  child: Text(blog.createdAt.toString()),
                ),
              ],
            ),
    );
  }
}
