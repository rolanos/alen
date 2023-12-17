import 'package:alen/core/color_ui.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: 'A',
            style: textTheme.titleLarge!.copyWith(color: ColorsUi.red),
            children: [
              TextSpan(
                text: 'L',
                style: textTheme.titleLarge!.copyWith(color: ColorsUi.green),
              ),
              TextSpan(
                text: 'E',
                style: textTheme.titleLarge!.copyWith(color: ColorsUi.blue),
              ),
              TextSpan(
                text: 'N',
                style: textTheme.titleLarge!.copyWith(color: ColorsUi.purple),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        RichText(
          text: TextSpan(
            text: '+',
            style: textTheme.titleLarge!.copyWith(
              color: ColorsUi.red,
              height: 0.8,
            ),
            children: [
              TextSpan(
                text: '÷',
                style: textTheme.titleLarge!.copyWith(
                  color: ColorsUi.green,
                ),
              ),
              TextSpan(
                text: '-',
                style: textTheme.titleLarge!.copyWith(
                  color: ColorsUi.blue,
                ),
              ),
              TextSpan(
                text: '×',
                style: textTheme.titleLarge!.copyWith(
                  color: ColorsUi.purple,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
