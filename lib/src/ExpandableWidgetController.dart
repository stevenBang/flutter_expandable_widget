import 'package:flutter/material.dart';

class ExpandableWidgetController extends ChangeNotifier {
  bool _isExpanded;

  bool get isExpanded => _isExpanded;

  ExpandableWidgetController({
    bool isExpanded = false,
  }) : _isExpanded = isExpanded;

  void expand() {
    _isExpanded = true;
    notifyListeners();
  }

  void collapse() {
    _isExpanded = false;
    notifyListeners();
  }

  void toggle() {
    _isExpanded = !isExpanded;
    notifyListeners();
  }
}
