import 'package:flutter/material.dart';
import 'dart:io';

String capitalize(String value) {
  if (value.isEmpty) return value;
  return value[0].toUpperCase() + value.substring(1);
}

void showSnackbar(BuildContext context, String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color ?? Colors.black,
    ),
  );
}

Future<bool> isConnectedToInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } catch (_) {
    return false;
  }
}

String? nullIfEmpty(String? input) =>
    (input == null || input.trim().isEmpty) ? null : input;
