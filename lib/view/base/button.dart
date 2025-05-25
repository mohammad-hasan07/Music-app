import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Function onTap;
  final double? width;
  final double? radius;
  final double? height;
  final double? padding;
  final double? fontSize;

  const Button(
      {super.key,
      required this.title,
      required this.onTap,
      this.width,
      this.radius,
      this.padding,
      this.fontSize,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height ?? 50,
        width: width ?? MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(padding ?? 8),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(
              radius ?? 8,
            )),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: fontSize ?? 8),
          ),
        ),
      ),
    );
  }
}
