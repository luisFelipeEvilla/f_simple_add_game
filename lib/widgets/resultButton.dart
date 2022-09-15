// ignore: file_names
import 'package:flutter/material.dart';

Widget resultButton(int value, callback) {
  return Expanded(
      child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
        onPressed: () => callback(value),
        child: Text(value.toString(),
            style: const TextStyle(
              fontSize: 40,
            ))),
  ));
}
