import 'package:calculator/controller/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textWidget({String text,double fontSize,Color color,TextAlign textAlign,TextDirection textDirection,FontWeight fontWeight}){
  return Text(
    text,style: TextStyle(fontSize: fontSize??getWidthOfScreen*0.05,
  color: color??Colors.white,fontWeight:fontWeight??FontWeight.bold
  ),
    textAlign:textAlign??TextAlign.right ,
    textDirection:textDirection?? TextDirection.rtl,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}