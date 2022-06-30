import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String? message;
  const ErrorWidget({Key? key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      message ?? 'Something went wrong',
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
    ));
  }
}
