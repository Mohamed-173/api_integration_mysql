import 'package:flutter/cupertino.dart';

double getHeight(context, double percentage) {
  double h = (MediaQuery.of(context).size.height) / 100;
  return h * percentage;
}

double getWidth(context, double percentage) {
  double h = (MediaQuery.of(context).size.width) / 100;
  return h * percentage;
}
