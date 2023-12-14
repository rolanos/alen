import 'package:alen/features/core/color_ui.dart';
import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final String titleText;
  final BorderRadiusGeometry? borderRadius;
  final TextEditingController? controller;

  const InputContainer(
      {super.key, required this.titleText, this.borderRadius, this.controller});

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
            readOnly: (controller == null) ? true : false,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
