import 'package:flutter/material.dart';

class Blog {
  final int id;
  final DateTime createdAt;
  final String title;
  final String imageUrl;

  Blog({
    @required this.id,
    @required this.createdAt,
    @required this.title,
    @required this.imageUrl,
  });
}
