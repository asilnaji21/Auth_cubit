import 'package:flutter/foundation.dart';

class Constant {
  static const String baseUrl = 'http://demo-api.mr-dev.tech/api';
}

class EndPoints {
  static const String registerUrl = '/students/auth/register';
  static const String signInUrl = '/students/auth/login';
}

void printTest(String text) {
  if (kDebugMode) {
    print('\x1B[32m$text\x1B[0m');
  }
}

void printResponse(String text) {
  if (kDebugMode) {
    print('\x1B[33m$text\x1B[0m');
  }
}
