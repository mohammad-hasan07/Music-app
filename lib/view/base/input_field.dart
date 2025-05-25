import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? title;
  final String subTitle;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? subTitleWidget;
  final Widget? prefixIcon;
  final bool obscureText;
  final double? marginRight;
  final double? marginBottom;
  final double? width;
  final double? radius;
  final double? height;
  final Color? color;
  final int? maxLine;
  final double? size;
  final Color? bgColor;

  const InputField(
      {super.key,
      this.title,
      required this.controller,
      this.suffixIcon,
      this.focusNode,
      this.nextFocus,
      this.keyboardType,
      this.obscureText = false,
      this.marginRight,
      this.marginBottom,
      this.width,
      this.radius,
      this.color,
      this.maxLine,
      this.prefixIcon,
      required this.subTitle,
      this.height,
      this.size,
      this.bgColor, this.subTitleWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: marginRight ?? 0, bottom: marginBottom ?? 0),
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 44,
      decoration: BoxDecoration(
          color: bgColor ?? Colors.grey.shade300,
          borderRadius: BorderRadius.circular(radius ?? 12)),
      child: TextFormField(
        focusNode: focusNode,
        maxLines: maxLine,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical(y: -0.1),
        controller: controller,
        onFieldSubmitted: (_) {},

        style: const TextStyle(fontSize: 14, color: Colors.white),
        decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: subTitleWidget != null ? null : subTitle,
            label: subTitleWidget ?? Text(subTitle),
            hintStyle: TextStyle(
              fontSize: size ?? 15,
              color: color ?? Colors.black26,
            )),
      ),
    );
  }
}
