import 'package:alen/features/core/color_ui.dart';
import 'package:alen/features/core/widget/button_container.dart';
import 'package:alen/features/core/widget/input_container.dart';
import 'package:flutter/material.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 46.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: ButtonContainer(
                  text: 'Scan QR-code',
                  color: ColorsUi.green,
                  onTap: () {},
                ),
              ),
              Spacer(
                flex: 5,
              ),
              Container(
                width: size.height * 0.31,
                height: size.height * 0.31,
                color: ColorsUi.red,
              ),
              Spacer(
                flex: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: InputContainer(titleText: 'URL-text'),
              ),
              SizedBox(
                height: 26.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: ButtonContainer(
                  text: 'Generate QR-code',
                  color: ColorsUi.green,
                  onTap: () {},
                ),
              ),
              Spacer(
                flex: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
