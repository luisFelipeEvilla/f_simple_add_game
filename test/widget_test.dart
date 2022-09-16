// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sum_game/controllers/sumController.dart';
import 'package:sum_game/main.dart';
import 'package:sum_game/pages/sum.dart';

void main() {

  group("functions", () {
    final controller = SumController();
    test("setValues", () {
      //testing the function
      controller.setValues();

      var op1 = controller.op1.value;
      var op2 = controller.op2.value;
      var rta = op1 + op2;
      expect(rta, controller.rta.value);

      var vectorRta = [rta, rta + 1, rta + 2];
      for (var option in vectorRta) {
        expect(controller.vectorRta.value.contains(option), true);
      }

      //testing that vector is cleared
      controller.setValues();
      expect(controller.vectorRta.value.length, 3);
    });

    test("score update", () {
      controller.reset();
      expect(controller.score.value, 0);
      
      //testing correct responses
      for (var i = 0; i < 5; i++) {
        var op1 = controller.op1.value;
        var op2 = controller.op2.value;
        controller.onResultClick(op1+op2);
        expect(controller.score.value, i+1);
      }

      controller.reset();
      expect(controller.score.value, 0);
      var op1 = controller.op1.value;
      var op2 = controller.op2.value;

      controller.onResultClick(op1+op2);
      expect(controller.score.value, 1);

      op1 = controller.op1.value;
      op2 = controller.op2.value;
      controller.onResultClick(op1+op2);
      expect(controller.score.value, 2);

      op1 = controller.op1.value;
      op2 = controller.op2.value;
      controller.onResultClick(op1);
      expect(controller.score.value, 2);

      op1 = controller.op1.value;
      op2 = controller.op2.value;
      controller.onResultClick(op2);
      expect(controller.score.value, 2);

      op1 = controller.op1.value;
      op2 = controller.op2.value;
      controller.onResultClick(op1+op2+1);
      expect(controller.score.value, 2);

      op1 = controller.op1.value;
      op2 = controller.op2.value;
      controller.onResultClick(op1+op2+2);
      expect(controller.score.value, 2);

      op1 = controller.op1.value;
      op2 = controller.op2.value;
      controller.onResultClick(op1+op2);
      expect(controller.score.value, 3);

      controller.reset();
      expect(controller.score.value, 0);
    });
  });

  testWidgets('Init state', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    var controller = SumController(),op1,op2,correctAnswer,wrongAnswer;
    Get.put(controller);
    await tester.pumpWidget(MyApp());
    
    // Verify that our counter starts at 0.
    expect(find.text('Score: 0'), findsOneWidget);
    expect(find.text('Score: 1'), findsNothing);

    //find the button with the rigth answer and pressit
    op1 = controller.op1.value;
    op2 = controller.op2.value;
    correctAnswer = find.text((op1+op2).toString());
    expect(correctAnswer, findsOneWidget);
    await tester.tap(correctAnswer);
    await tester.pump();
    expect(find.text("Score: 1"), findsOneWidget);
    expect(find.text("Score: 0"), findsNothing);

    //Wrong Answer
    op1 = controller.op1.value;
    op2 = controller.op2.value;
    wrongAnswer = find.text((op1+op2+1).toString());
    expect(wrongAnswer, findsOneWidget);
    await tester.tap(wrongAnswer);
    await tester.pump();
    expect(find.text("Score: 1"), findsOneWidget);
    expect(find.text("Score: 0"), findsNothing);

    //Wrong Answer
    op1 = controller.op1.value;
    op2 = controller.op2.value;
    wrongAnswer = find.text((op1+op2+2).toString());
    expect(wrongAnswer, findsOneWidget);
    await tester.tap(wrongAnswer);
    await tester.pump();
    expect(find.text("Score: 1"), findsOneWidget);
    expect(find.text("Score: 0"), findsNothing);

    //Right Answer
    op1 = controller.op1.value;
    op2 = controller.op2.value;
    correctAnswer = find.text((op1+op2).toString());
    expect(correctAnswer, findsOneWidget);
    await tester.tap(correctAnswer);
    await tester.pump();
    expect(find.text("Score: 2"), findsOneWidget);
    expect(find.text("Score: 1"), findsNothing);

    //Wrong Answer
    op1 = controller.op1.value;
    op2 = controller.op2.value;
    wrongAnswer = find.text((op1+op2+2).toString());
    expect(wrongAnswer, findsOneWidget);
    await tester.tap(wrongAnswer);
    await tester.pump();
    expect(find.text("Score: 2"), findsOneWidget);
    expect(find.text("Score: 1"), findsNothing);

    //Wrong Answer
    op1 = controller.op1.value;
    op2 = controller.op2.value;
    wrongAnswer = find.text((op1+op2+3).toString());
    expect(wrongAnswer, findsNothing);

    //Right Aanswer
    op1 = controller.op1.value;
    op2 = controller.op2.value;
    correctAnswer = find.text((op1+op2).toString());
    expect(correctAnswer, findsOneWidget);
    await tester.tap(correctAnswer);
    await tester.pump();
    expect(find.text("Score: 3"), findsOneWidget);
    expect(find.text("Score: 2"), findsNothing);

    var resetB = find.byIcon(Icons.replay);
    await tester.tap(resetB);
    await tester.pump();
    expect(find.text("Score: 0"), findsOneWidget);
    op1 = controller.op1.value;
    op2 = controller.op2.value;
    expect(find.text((op1+op2).toString()),findsOneWidget);
    expect(find.text((op1+op2+1).toString()),findsOneWidget);
    expect(find.text((op1+op2+2).toString()),findsOneWidget);
  });
}
