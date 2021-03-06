import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../providers/token.dart';
import '../widgets/blogListItem.dart';
import '../models/blog.dart';

class BlogsScreen extends StatefulWidget {
  static const routeName = '/blogs-screen';

  @override
  _BlogsScreenState createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  void getBlogs() async {
    final providerData = Provider.of<Token>(context, listen: false);
    final token = providerData.token;
    Uri url =
        Uri.parse('https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs');
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authentication': 'Bearer $token',
    };

    http.Response response = await http.get(url, headers: headers);

    final responseBody = jsonDecode(response.body);
    final List<Blog> blogsList = [];

    responseBody.forEach((blog) {
      final newBlog = Blog(
        id: int.parse(blog["id"]),
        title: blog["title"],
        createdAt: DateTime.parse(blog["createdAt"]),
        imageUrl: blog["imageUrl"],
      );
      blogsList.add(newBlog);
    });

    providerData.setBlogs(blogsList);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getBlogs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final blogs = Provider.of<Token>(context).blogs;
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs'),
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (ctx, i) => BlogListItem(
          blogs[i].id,
          blogs[i].title,
          blogs[i].imageUrl,
          blogs[i].createdAt,
        ),
      ),
    );
  }
}
