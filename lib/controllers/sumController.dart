// ignore: file_names
import 'package:get/get.dart';

import '../utils/randomInt.dart';

class SumController extends GetxController {
  final score = 0.obs;
  final op1 = 0.obs;
  final op2 = 0.obs;
  final rta = 0.obs;
  final vectorRta = [].obs;

  setValues() {
    op1.value = RandomInt.generate(max: 50);
    op2.value = RandomInt.generate(max: 50);

    rta.value = op1.value + op2.value;

    vectorRta.clear();
    vectorRta.addAll([rta.value, rta.value + 1, rta.value + 2]);
    vectorRta.shuffle();
  }

  void reset() {
    score.value = 0;
    setValues();
  }

  void onResultClick(int value) {
    if (value == rta.value) {
      score.value++;
    }

    setValues();
  }
}
