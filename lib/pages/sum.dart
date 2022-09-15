import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sum_game/controllers/sumController.dart';

import '../widgets/optionsButtons.dart';
import '../widgets/problemWidget.dart';
import '../widgets/scoreWidget.dart';

class SumWidget extends StatefulWidget {
  const SumWidget({Key? key}) : super(key: key);

  @override
  State<SumWidget> createState() => _SumWidgetState();
}

class _SumWidgetState extends State<SumWidget> {
  final controller = Get.put(SumController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.setValues();
    return Column(
      children: [
        Obx(() => scoreWidget(controller.score.value, controller.reset)),
        Obx(() => problemWidget(controller.op1.value, controller.op2.value)),
        Obx(() => optionButtons(controller.vectorRta, controller.onResultClick))
      ],
    );
  }
}
