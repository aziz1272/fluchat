import 'package:flutter/material.dart';

void showLoader(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        ),
      );
    },
  );
}