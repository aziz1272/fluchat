import 'package:flutter/material.dart';

class Go {
  BuildContext context;

  Go(this.context);

  void go(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void id(String id) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      id,
          (Route<dynamic> route) => false,
    );
  }

  void close() => Navigator.pop(context);
}