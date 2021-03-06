import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:calculator/controller/operators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';


class CalculatorBloc extends Bloc<Operators, String> {
  CalculatorBloc(String initialState) : super('0');
  String equation = "";
  String result = "0";
  String expression = "";
  double equationFontSize = 30.0;
  double resultFontSize = 45.0;
  String number = '';

  void _setupExpression() {
    expression = equation;
    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');
  }

  String _calculateResult() {
    try {
      equationFontSize = 30.0;
      resultFontSize = 45.0;
      _setupExpression();

      Parser p = Parser();
      Expression exp = p.parse(expression);

      return result = '${exp.evaluate(EvaluationType.REAL, ContextModel())}';
    } catch (e) {
      return result = "Error";
    }
  }

  @override
  Stream<String> mapEventToState(Operators event) async* {
    switch (event) {
      case Operators.equal:
        yield _calculateResult();
        break;
      case Operators.del:
        equation = equation.substring(0, equation.length - 1);
        yield equation.isEmpty ? '0' : equation;
        break;
      case Operators.clean:
        yield equation = '';
        yield result = '0';
        break;
      case Operators.elseState:
         equationFontSize=45.0;
         resultFontSize=30.0;
        yield equation;
        break;
    }
  }

  @override
  void onTransition(Transition<Operators, String> transition) {
    super.onTransition(transition);
    log("transition is $transition");
  }

  @override
  void onChange(Change<String> change) {
    // TODO: implement onChange
    super.onChange(change);
    log("change is $change");
  }

  @override
  void onEvent(Operators event) {
    // TODO: implement onEvent
    super.onEvent(event);
    log("event is $event");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    log("error is $error");
  }
}
