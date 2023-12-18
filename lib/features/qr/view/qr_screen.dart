import 'package:alen/core/color_ui.dart';
import 'package:alen/core/widget/button_container.dart';
import 'package:alen/core/widget/input_container.dart';
import 'package:alen/features/forum/view/bloc/question_bloc.dart';
import 'package:alen/features/qr/view/bloc/qr_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  final TextEditingController qrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<QrBloc, QrState>(
        listener: (context, state) {
          if (state is QrState) {
            qrController.text = state.qr ?? "";
            setState(() {});
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height,
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
                        onTap: () {
                          context.goNamed('qr_scan');
                        },
                      ),
                    ),
                    Spacer(
                      flex: 5,
                    ),
                    if (state.qr != null)
                      QrImageView(
                        data: qrController.text.trim(),
                        size: size.height * 0.31,
                        backgroundColor: Colors.white,
                      ),
                    if (state.qr == null)
                      Container(
                        color: ColorsUi.red,
                        height: size.height * 0.31,
                        width: size.height * 0.31,
                      ),
                    Spacer(
                      flex: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: InputContainer(
                        titleText: 'URL-text',
                        controller: qrController,
                      ),
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: ButtonContainer(
                        text: 'Generate QR-code',
                        color: ColorsUi.green,
                        onTap: () {
                          BlocProvider.of<QrBloc>(context)
                              .add(SetQr(qr: qrController.text.trim()));
                        },
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
        },
      ),
    );
  }
}
