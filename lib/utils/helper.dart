import 'package:flutter/material.dart';

T? cast<T>(dynamic x) => x is T ? x : null;

extension LocaleContext on BuildContext {}

extension ThemeContext on BuildContext {
  ThemeData get t => Theme.of(this);
}
