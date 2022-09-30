import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPressed;

  const ButtonCustom({Key? key,
    required this.title,
    this.loading = false,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white
        ),
        height: 40,
        width: 150,
        child:Center(child: loading? CircularProgressIndicator(color: Colors.black,) :Text(title, style: TextStyle(
            color: Colors.black87,
            fontSize: 20
        ),)),
      ),
    );
  }
}