import 'package:flutter/material.dart';

import '../screens/blogEntryScreen.dart';

class BlogListItem extends StatelessWidget {
  final int id;
  final String title;
  final String imageUrl;
  final DateTime createdAt;

  BlogListItem(
    this.id,
    this.title,
    this.imageUrl,
    this.createdAt,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(BlogEntryScreen.routeName, arguments: id);
          },
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            tileColor: Colors.greenAccent,
            title: Text(title),
            leading: Image.network(imageUrl),
            subtitle: Text(createdAt.toString()),
          ),
        ),
      ),
    );
  }
}
