import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String tittle;
  final double height;
  const AppButton ({super.key, required this.onPressed, required this.tittle, required this.height});
  @override
  Widget build(BuildContext context) {
  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(

        minimumSize: Size.fromHeight(height ?? 80)
      ),
      child: Text(
        tittle,
        style: const TextStyle(
          color: Colors.white
        ),
      ));
  }
}