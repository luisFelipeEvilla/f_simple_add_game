import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'opWidget.dart';

Widget problemWidget(int op1, int op2) {
  return Expanded(
    flex: 4,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          OpWidget(text: op1.toString()),
          const OpWidget(text: '+'),
          OpWidget(text: op2.toString()),
          const OpWidget(text: '='),
          const OpWidget(text: '?'),
        ]),
      ),
    ),
  );
}
