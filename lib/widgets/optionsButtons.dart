import 'package:flutter/widgets.dart';
import 'package:sum_game/widgets/resultButton.dart';

Widget optionButtons(vectorRta, onResultClick) {
  return Expanded(
    flex: 3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        resultButton(vectorRta[0], onResultClick),
        resultButton(vectorRta[1], onResultClick),
        resultButton(vectorRta[2], onResultClick),
      ],
    ),
  );
}
