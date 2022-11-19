import 'dart:convert' show json;

String errorFormat(String error) => json.encode({ 'error': error });