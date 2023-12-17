import 'package:alen/core/color_ui.dart';
import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final String titleText;
  final BorderRadiusGeometry? borderRadius;
  final TextEditingController? controller;
  final bool obscure;
  final String? hintText;

  const InputContainer(
      {super.key,
      required this.titleText,
      this.borderRadius,
      this.controller,
      this.obscure = false,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: Text(
            titleText,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          decoration: BoxDecoration(
            color: ColorsUi.blue,
            borderRadius: borderRadius ?? BorderRadius.circular(45.0),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscure,
            readOnly: (controller == null) ? true : false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
