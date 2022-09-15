import 'package:flutter/widgets.dart';

import '../utils/randomInt.dart';
import '../widgets/optionsButtons.dart';
import '../widgets/problemWidget.dart';
import '../widgets/scoreWidget.dart';

class SumWidget extends StatefulWidget {
  const SumWidget({Key? key}) : super(key: key);

  @override
  State<SumWidget> createState() => _SumWidgetState();
}

class _SumWidgetState extends State<SumWidget> {
  late int op1;
  late int op2;
  late int rta;
  List<int> vectorRta = [];
  int score = 0;

  @override
  void initState() {
    super.initState();
  }

  void onResultClick(int value) {
    if (value == rta) {
      score = score + 1;
    }
    setState(() {});
  }

  void setValues() {
    op1 = RandomInt.generate(max: 50);
    op2 = RandomInt.generate(max: 50);

    rta = op1 + op2;
    vectorRta.clear();
    vectorRta.add(rta);
    vectorRta.add(rta + 1);
    vectorRta.add(rta - 1);
    vectorRta.shuffle();
  }

  void reset() {
    setState(() {
      score = 0;
    });

    setValues();
  }

  @override
  Widget build(BuildContext context) {
    setValues();
    return Column(
      children: [
        scoreWidget(score, reset),
        problemWidget(op1, op2),
        optionButtons(vectorRta, onResultClick)
      ],
    );
  }
}
