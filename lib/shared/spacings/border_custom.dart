import 'package:flutter/material.dart';

BorderRadiusGeometry borderAll(double value) {
   return BorderRadius.all(Radius.circular(value));
 }

 BorderRadiusGeometry borderCircular(double value) {
   return BorderRadius.circular(value);
 }

 BorderRadiusGeometry borderOnly({
   double topLeft = 0,
   double topRight = 0,
   double bottomLeft = 0,
   double bottomRight = 0,
 }) {
   return BorderRadius.only(
     topLeft: Radius.circular(topLeft),
     topRight: Radius.circular(topRight),
     bottomLeft: Radius.circular(bottomLeft),
     bottomRight: Radius.circular(bottomRight),
   );
 }

 BorderRadiusGeometry borderSymmetric({
   double vertical = 0,
   double horizontal = 0,
 }) {
   return BorderRadius.vertical(
     top: Radius.circular(vertical),
     bottom: Radius.circular(vertical),
   ).add(BorderRadius.horizontal(
     left: Radius.circular(horizontal),
     right: Radius.circular(horizontal),
   ));
 }