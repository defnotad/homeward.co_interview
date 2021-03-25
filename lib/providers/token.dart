import 'package:flutter/material.dart';

import '../models/blog.dart';

class Token with ChangeNotifier {
  var _token;
  List<Blog> _blogs = [];

  get token {
    return _token;
  }

  List<Blog> get blogs {
    return [..._blogs];
  }

  void setToken(newToken) {
    _token = newToken;
  }

  void setBlogs(blogsList) {
    _blogs = blogsList;
    notifyListeners();
  }
}
