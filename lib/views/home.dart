import 'package:calculator/controller/bloc/counter_bloc.dart';
import 'package:calculator/controller/const/const.dart';
import 'package:calculator/widgets/text_button.dart';
import 'package:calculator/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setWidthOfScreen(size.width);
    setHeightOfScreen(size.height);
    final cb = BlocProvider.of<CalculatorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: textWidget(text: 'Calculator'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: BlocBuilder<CalculatorBloc, String>(
              builder: (_, state) {
                return textWidget(
                    text: cb.equation,
                    fontSize: cb.equationFontSize,
                    color: Colors.black,
                    textDirection: TextDirection.ltr,
                    fontWeight: FontWeight.normal);
              },
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: BlocBuilder<CalculatorBloc, String>(
              builder: (_, state) {
                return textWidget(
                    text: cb.result,
                    fontSize: cb.resultFontSize,
                    color: Colors.black);
              },
            ),
          ),
          Expanded(child: SizedBox()),
          Row(
            children: [
              SizedBox(
                width: getWidthOfScreen * 0.75,
                child: Table(
                  children: [
                    tableRowHasThreeItems(
                      context: context,
                      num1: 'C',
                      num2: '⌫',
                      num3: '÷',
                      color: Colors.black,
                    ),
                    tableRowHasThreeItems(
                        context: context, num1: '7', num2: '8', num3: '9'),
                    tableRowHasThreeItems(
                        context: context, num1: '4', num2: '5', num3: '6'),
                    tableRowHasThreeItems(
                        context: context, num1: '1', num2: '2', num3: '3'),
                    tableRowHasThreeItems(
                        context: context, num1: '.', num2: '0', num3: '00'),
                  ],
                ),
              ),
              SizedBox(
                width: getWidthOfScreen * 0.25,
                child: Table(
                  children: [
                    tableRowHasOneItem(
                        context: context, num1: '×', color: Colors.black),
                    tableRowHasOneItem(
                        context: context, num1: '-', color: Colors.black),
                    tableRowHasOneItem(
                        context: context, num1: '+', color: Colors.black),
                    tableRowHasOneItem(
                        context: context,
                        num1: '=',
                        height: 2,
                        color: Colors.orange),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
