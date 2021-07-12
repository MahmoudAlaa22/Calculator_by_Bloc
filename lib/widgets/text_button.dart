import 'package:calculator/controller/bloc/counter_bloc.dart';
import 'package:calculator/controller/const/const.dart';
import 'package:calculator/controller/operators.dart';
import 'package:calculator/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/const/const.dart';


TableRow tableRowHasOneItem({@required BuildContext context,String num1,double height=1,Color color}){
  return TableRow(
    children: [
      textButton(context: context,num: num1,height: height, color: color),
    ]
  );
}
TableRow tableRowHasThreeItems({@required BuildContext context,String num1,String num2,String num3,Color color:Colors.black38,}){
  return TableRow(
    children: [
      textButton(context: context,num: num1,color: num1=='C'?Colors.orange:color),
      textButton(context: context,num: num2,color: color),
      textButton(context: context,num: num3,color: color),
    ]
  );
}

Widget textButton({var num,Color color:Colors.black54,double height=1,@required BuildContext context}){
final cb=BlocProvider.of<CalculatorBloc>(context);
  return Expanded(
    child: Container(
      height:getHeightOfScreen*0.1 * height as double,
      decoration: BoxDecoration(
          color: color
      ),
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white)
                  )
              )
          ),
          child:
        textWidget(
          text: num.toString()
        ),
          onPressed: (){
           print(equation);
           if(num=='=') {
            cb.add(Operators.eq);
          } else if(num=='C'){
             cb.add(Operators.clean);
           }
           else if(num=='⌫'){
             cb.add(Operators.del);
           }
           else {
             equation+=num;
             cb.add(Operators.elseState);
          }
        },),
    ),
  );
}