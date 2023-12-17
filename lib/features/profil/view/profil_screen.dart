import 'package:alen/features/articles/view/bloc/article_bloc.dart';
import 'package:alen/core/color_ui.dart';
import 'package:alen/core/widget/button_container.dart';
import 'package:alen/core/widget/input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, pref) {
            if (pref.hasData == false || pref.data == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorsUi.green,
                ),
              );
            }
            if (pref.data == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorsUi.green,
                ),
              );
            }
            String? email = pref.data!.getString('email');
            String? name = pref.data!.getString('name');
            String? role = pref.data!.getString('role');
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 26.0,
                    ),
                    InputContainer(
                      titleText: 'Login',
                      hintText: email,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    InputContainer(
                      titleText: 'Name',
                      hintText: name,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    InputContainer(
                      titleText: 'Role',
                      hintText: 'role',
                      borderRadius: BorderRadius.circular(0),
                    ),
                    const SizedBox(
                      height: 46.0,
                    ),
                    ButtonContainer(
                        text: 'Change info',
                        color: ColorsUi.green,
                        onTap: () => context.goNamed('change_info'))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
