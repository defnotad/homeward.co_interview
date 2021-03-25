import 'package:flutter/material.dart';

class BlogListItem extends StatelessWidget {
  final String title;

  BlogListItem(this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
    );
  }
}
