// ignore: file_names
import 'package:flutter/material.dart';

Widget scoreWidget(int score, reset) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(flex: 1),
              Text(
                'Score: $score',
                style: const TextStyle(
                  fontSize: 36,
                ),
              ),
              const Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    reset();
                  },
                  child: const Icon(Icons.replay),
                ),
              )
            ],
          )),
    ),
    flex: 1,
  );
}
