import 'package:flutter/cupertino.dart';

extension PaddingExtention on Widget {
  Widget paddingAll(double value) {
    return Padding(padding: all(value), child: this);
  }

  Widget paddingSymmetric({double vertical = 0, double horizontal = 0}) {
    return Padding(
      padding: symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: only(left: left, top: top, right: right, bottom: bottom),
      child: this,
    );
  }

  Widget zero() {
    return Padding(padding: EdgeInsets.zero, child: this);
  }
}

EdgeInsetsGeometry all(double value) {
  return EdgeInsets.all(value);
}

EdgeInsetsGeometry symmetric({double vertical = 0, double horizontal = 0}) {
  return EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
}

EdgeInsetsGeometry only({
  double left = 0,
  double top = 0,
  double right = 0,
  double bottom = 0,
}) {
  return EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
}
