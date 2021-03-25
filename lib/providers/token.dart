import 'package:flutter/material.dart';

class Token with ChangeNotifier {
  var _token;

  get token {
    return _token;
  }

  void setToken(newToken) {
    _token = newToken;
  }
}
